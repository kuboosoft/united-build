FROM davidva/unibuild-27

MAINTAINER David Va <davidva@tutanota.com>

RUN rm -rf united-build \ 
&& git clone https://github.com/kuboosoft/united-build.git \
&& cd united-build \
&& cp -f urpms / \
&& chmod a+x urpms \
&& chmod a+x /urpms \
&& ps -ef | grep urpms | grep -v grep | awk '{print $2}' | xargs kill -9 \
&& ps -ef | grep megaput | grep -v grep | awk '{print $2}' | xargs kill -9 \
&& ./urpms -g UnitedRPMs/gstreamer1-plugins-bad-free -s gstreamer1-plugins-bad-free.spec -r true -d 'dist .fc27'

CMD ["/bin/bash", "/usr/bin/bash"]




