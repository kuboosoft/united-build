FROM davidva/unibuild:latest

MAINTAINER David Va <davidva@tutanota.com>

RUN rm -rf united-build \ 
&& git clone https://github.com/kuboosoft/united-build.git \
&& cd united-build \
&& cp -f urpms / \
&& chmod a+x urpms \
&& chmod a+x /urpms \
&& ./urpms -g UnitedRPMs/x264 -s x264.spec -r true -d 'dist .fc25'

EXPOSE 3000

ENV PORT 3000

CMD ["/bin/bash", "npm", "start"]



