FROM davidva/unibuild-27:latest

MAINTAINER David Va <davidva@tutanota.com>

RUN rm -rf united-build \ 
&& git clone https://github.com/kuboosoft/united-build.git \
&& cd united-build \
&& cp -f urpms / \
&& chmod a+x urpms \
&& chmod a+x /urpms \
&& ./urpms -g UnitedRPMs/mplayer -s mplayer.spec -r true -d 'dist .fc27'

CMD ["/bin/bash", "/usr/bin/bash"]
STOPSIGNAL SIGKILL



