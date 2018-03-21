# united-build


URPMS, is a light tool for build rpms using rpmbuild and mock with docker, useful in Popular CI services. The project is in a primary phase. Unite-Build is part of the infraestructure of United RPMS Project.


## ** Usage **

```
  -g url_git

    The git hub name user and project, example (-g UnitedRPMs/ffmpeg)


 urpms -g UnitedRPMs/ffmpeg -s ffmpeg.spec -t fedora-24-x86_64

```


```
  -m massive organization

   Make a massive rebuild rpm of your organization" (-m true)

 urpms -o UnitedRPMs -m true -t fedora-25-x86_64

```

```
  -r SRPM

   Rebuild a src.rpm from remote url (-r url/foo.src.rpm)

   urpms -t fedora-25-x86_64 -r http:www.foo/ffmpeg-foo.src.rpm 

```

```
  -n SNAPSHOT
   Generate the source file with a special script example (-n ffmpeg-snapshot.sh)
   urpms -g UnitedRPMs/ffmpeg -s ffmpeg.spec -t fedora-25-x86_64 -n ffmpeg-snapshot.sh "
```

"--------------------------------------"
```
  -s SPECfile
    The name of the RPM SPEC file, example 

  -s ffmpeg.spec

```

```
  -o organization (-o UnitedRPMs)
    The name of the organization GIT, only in massive organization task. You need a powerful machine...
```

```
  -t TARJET
    mock config example 

  -t fedora-26-x86_64
```

```
  -d DIST
    Rpmbuild mode with tag distribution 
   
  -d 'dist .fc25'

```

"--------------------------------------"

```
  -b BUILD

   Mode rpmbuild

  -b true 

```

"--------------------------------------"

```
### Examples

*  Build without mock

   urpms -g UnitedRPMs/opera -s opera.spec -b true -d 'dist .fc25'



*  Build with mock

   urpms -g UnitedRPMs/opera -s opera.spec -t fedora-25-x86_64

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



