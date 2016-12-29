FROM davidva/unibuild

MAINTAINER David Va <davidva@tutanota.com>

RUN rm -rf united-build \ 
&& git clone https://github.com/kuboosoft/united-build.git \
&& cd united-build \
&& chmod a+x urpms \
&& ./urpms -g UnitedRPMs/chromium-freeworld -s chromium.spec -t fedora-25-x86_64 

VOLUME ["/var/lib/mock"]
REQUEST CAP SYS_ADMIN
USER makerpm
CMD ["/bin/bash"]



