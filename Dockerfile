FROM davidva/unibuild-27:latest

MAINTAINER David Va <davidva@tutanota.com>

RUN rm -rf united-build \ 
&& git clone https://github.com/kuboosoft/united-build.git \
&& cd united-build \
&& cp -f urpms / \
&& chmod a+x urpms \
&& chmod a+x /urpms \
&& dnf -y install psmisc \
&& killall `ps -aux | grep megaput | grep -v grep | awk '{ print $1 }'` && killall inotifywait \
&& ./urpms -g UnitedRPMs/gstreamer1-plugins-bad-free -s gstreamer1-plugins-bad-free.spec -r true -d 'dist .fc27'

CMD ["/bin/bash", "/usr/bin/bash"]




