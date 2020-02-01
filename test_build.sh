#!/bin/bash

readargs() {
  while [ "$#" -gt 0 ] ; do
    case "$1" in
       -n)
        if [ "$2" ] ; then
          namegit="$2"
          shift ; shift
        else
          echo "Missing a value for $1."
          echo
          shift
          usage
exit
        fi
      ;;
      *)
        echo "Unknown option or argument $1. Use -n namerepository"
        echo
        shift
        usage
      exit 1
      ;;
    esac
  done
}


clear_proxy() {
unset http_proxy
unset no_proxy 
unset https_proxy
}


# MACROS
# lto macro
defult_flags=('export LANG=C.UTF-8\
export GCC_IGNORE_WERROR=1\
export CFLAGS="$CFLAGS -fno-lto"\
export FCFLAGS="$CFLAGS -fno-lto"\
export FFLAGS="$CFLAGS -fno-lto "\
export CXXFLAGS="$CXXFLAGS -fno-lto"\
export MAKEFLAGS=%{?_smp_mflags}') 

# unset proxy
clean_proxy=('unset http_proxy\ 
unset no_proxy\ 
unset https_proxy')

#  BEGIN THE PROGRAM
readargs "$@"

clear_proxy
# Absolute paths
directory=/root/rpmbuild
mkdir -p ${directory}/{RPMS,BUILD,SOURCES,SRPMS} && pushd ${directory}
# Unique .spec file (I hate various spec files in the same repository)
specfile="${namegit}.spec"
# install rpm devtools
swupd update  1>/dev/null
swupd bundle-add package-utils 1>/dev/null
curl -L https://gist.github.com/paulcarroty/ec7133a6d41762e23cdacc75dab69423/raw/9869938ddb4471b177d27de8bffdea7fd4673099/spectool -o /usr/bin/spectool
chmod +x /usr/bin/spectool
# manage dependencies
dnf config-manager --add-repo https://download.clearlinux.org/current/x86_64/os/
dnf config-manager --add-repo https://gitlab.com/clearfraction/repository/raw/repos/
dnf -y groupinstall build srpm-build
# Cloning repository
rm -rf ${namegit} && git clone https://github.com/kuboosoft/${namegit}.git && pushd ${namegit}  
# Downloading sources
spectool -g "${specfile}"
# Installing build dependencies
# builddep fails some times (needs a hand)
dnf -q -y builddep *.spec || dnf -y install $( rpmspec --parse *.spec | grep -i "BuildRequires:" | sed -e 's|[Bb]uild[Rr]equires:||g' | sed -e 's|>=||g' | sed -e 's|<=||g' |  tr -d '\t' | sed -e 's/^ *//' | LC_ALL=C sort | xargs)
# build the package
# rpmbuild --quiet  - super useful to cut the logs
# spectool fails some times (needs a hand) --undefine=_disable_source_fetch
rpmbuild -v --define "_topdir $PWD" --define "_sourcedir $PWD" --undefine=_disable_source_fetch -bs *.spec && rpmbuild --define "_topdir $PWD" --define "debug_package %{nil}" --define "abi_package %{nil}" --define "lto_flags $defult_flags" --define "unset_proxy $clean_proxy" --rebuild $PWD/SRPMS/*.src.rpm
# Test install
if [ -n ${directory}/${namegit}/RPMS/x86_64 ]; then
RESULTS="${directory}/${namegit}/RPMS/x86_64/"
elif [ -n ${directory}/${namegit}/RPMS/noarch ]; then
RESULTS="${directory}/${namegit}/RPMS/noarch/"
fi
pushd "${RESULTS}"
dnf -y install *.rpm
popd
 popd
