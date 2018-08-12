# united-build


URPMS/unibuild, is a light tool for build rpms using rpmbuild or mock with docker, useful in Popular CI services. 
Short discription: 
- It rebase your package to the latest version from a github repository; if detects a massive rebuild.
- You can use svn sources
- Unibuild test your package, installing after built.
- Build in mode mock and rpmbuild; by default in mode rpmbuild.
- You can choise branches in your github repository for build your rpm.

Your github repository need to include: 1 spec file (with downloables source files), patches.

The project is in a primary phase. "unibuild" is part of the infraestructure of UnitedRPMs Project.


## ** Usage **

```
  -g url_git

    The git hub name user and project, example (-g UnitedRPMs/ffmpeg)


 urpms -g UnitedRPMs/ffmpeg -s ffmpeg.spec -t fedora-29-x86_64

```

```
  -r SRPM

   Rebuild a src.rpm from remote url (-r url/foo.src.rpm)

   urpms -t fedora-29-x86_64 -r http:www.foo/ffmpeg-foo.src.rpm 

```

```
  -n SNAPSHOT
   Generate the source file with a special script example (-n ffmpeg-snapshot.sh)
   urpms -g UnitedRPMs/ffmpeg -s ffmpeg.spec -t fedora-29-x86_64 -n ffmpeg-snapshot.sh "
```

"--------------------------------------"
```
  -s SPECfile
    The name of the RPM SPEC file, example 

  -s ffmpeg.spec

```

```
  -t TARJET

Mode mock + dist build

mock config example 

  -t fedora-26-x86_64
```

```
  -d DIST
   In combination with Rpmbuild mode with tag distribution 
   
  -d 'dist .fc29'

```

"--------------------------------------"

```
  -b BUILD

   Mode rpmbuild
   You need combine with (-d 'dist .fcXX')

  -b true -d 'dist .fcXX'

```

"--------------------------------------"

```
### Examples

*  Build without mock

   urpms -g UnitedRPMs/opera    -s opera.spec     -b true     -d 'dist .fc29'    -u true
         -------------------    -------------   ------------  ---------------    -------
         git name repository    name spec file  mode rpmbuild  Distro version    disabled massive rebuild


*  Build with mock

   urpms -g UnitedRPMs/opera    -s opera.spec      -t fedora-29-x86_64         -u true
         -------------------    -------------   ---------------------------    -------
         git name repository    name spec file  mode mock with distro build    disabled massive rebuild

```



### ** Dependencies **

You need a image compatible with rpm... Fedora; I am not tested with Centos, Mageia, Mandriva.

* Also you need the next dependencies:

rpm-sign wget curl createrepo repoview fedora-packager git gnupg sshpass rsync bc python3-dnf-plugins-extras-repomanage docker 

dnf install 'dnf-command(config-manager)'


#### ** Output dir **
/enjoy


#### ** Limitants **
* Mock need special permits, no all CI services accept it... then you need run 'urpms' on rpmbuild mode using the especific version of your distribution linux. urpms emulates a similar Mock task.

* Build a rpm with "mock" and docker is very slow, we recomends build without mock (super fast)...



