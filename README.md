# united-build

This is the first test to compile using mock and a popular container, usually this project is in a primary phase.


Usage

```

  -g url_git

    The git hub name user and project, example UnitedRPMs/ffmpeg


 urpms -g UnitedRPMs/ffmpeg -s ffmpeg.spec -t fedora-24-x86_64

```

  -m massive

   Make a massive rebuild rpm"

 urpms -o UnitedRPMs -m true -t fedora-25-x86_64

```

  -r SRPM

   Rebuild a src.rpm from remote url

 urpms -t fedora-25-x86_64 -r http:www.foo/ffmpeg-foo.src.rpm 

```

  n SNAPSHOT
   Generate the source file with a special script example ffmpeg-snapshot.sh "
   urpms -g UnitedRPMs/ffmpeg -s ffmpeg.spec -t fedora-25-x86_64 -n ffmpeg-snapshot.sh "


"--------------------------------------"
```
  -s SPECfile
    The name of the RPM SPEC file, example "-s ffmpeg.spec"

  -o organization
    The name of the organization GIT, only in massive task.

  -t TARJET
    mock config example "-t fedora-26-x86_64"



