FROM davidva/unibuild-24

MAINTAINER David Va <davidva@tutanota.com>

RUN rm -rf united-build \ 
&& git clone https://github.com/kuboosoft/united-build.git \
&& cd united-build \
&& cp -f urpms / \
&& chmod a+x urpms \
&& chmod a+x /urpms \
&& ./urpms -g UnitedRPMs/ffmpeg -s ffmpeg.spec -r true -d 'dist .fc24' -c true 

CMD ["/bin/bash", "/usr/bin/bash"]




