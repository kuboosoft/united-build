FROM davidva/unibuild-26:latest

MAINTAINER David Va <davidva@tutanota.com>

RUN rm -rf united-build \ 
&& git clone https://github.com/kuboosoft/united-build.git \
&& cd united-build \
&& chmod a+x urpms \
&& ./urpms -g UnitedRPMs/chromium-freeworld -s chromium-freeworld.spec -r true -d 'dist .fc26'

CACHE OFF

EXPOSE 3000

ENV PORT 3000

CMD ["/bin/bash", "npm", "start"]



