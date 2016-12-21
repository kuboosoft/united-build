# united-build

[![Travis branch](https://img.shields.io/travis/rust-lang/rust/master.svg?style=flat-square)](https://travis-ci.org/kuboosoft/united-build)
[![Shippable](https://img.shields.io/shippable/5444c5ecb904a4b21567b0ff.svg?style=flat-square)](https://app.shippable.com/projects/582ce4db2bbf381000df99f3)
[![CircleCI](https://circleci.com/gh/kuboosoft/united-build.svg?style=svg)](https://circleci.com/gh/kuboosoft/united-build)
[![wercker status](https://app.wercker.com/status/507dabc6a9f204010ba0693770a20639/m/master "wercker status")](https://app.wercker.com/project/byKey/507dabc6a9f204010ba0693770a20639)

This is the first test to compile using mock and populars containers, usually this project is in a primary phase.


## ** Usage **

```
  -g url_git

    The git hub name user and project, example UnitedRPMs/ffmpeg


 urpms -g UnitedRPMs/ffmpeg -s ffmpeg.spec -t fedora-24-x86_64

```


```
  -m massive

   Make a massive rebuild rpm"

 urpms -o UnitedRPMs -m true -t fedora-25-x86_64

```

```
  -r SRPM

   Rebuild a src.rpm from remote url

 urpms -t fedora-25-x86_64 -r http:www.foo/ffmpeg-foo.src.rpm 

```

```
  -n SNAPSHOT
   Generate the source file with a special script example ffmpeg-snapshot.sh "
   urpms -g UnitedRPMs/ffmpeg -s ffmpeg.spec -t fedora-25-x86_64 -n ffmpeg-snapshot.sh "
```

"--------------------------------------"
```
  -s SPECfile
    The name of the RPM SPEC file, example "-s ffmpeg.spec"
```

```
  -o organization
    The name of the organization GIT, only in massive task.
```

```
  -t TARJET
    mock config example "-t fedora-26-x86_64"
```

"--------------------------------------"

```
  -b BUILD

   Build whithout mock

   urpms -g UnitedRPMs/chromium-freeworld -s chromium.spec -b true -d 'dist .fc25'

```

