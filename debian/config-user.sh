#!/bin/bash
#
# This script configures the logged in users xsession to properly
# configure unity to launch
#
# Major thanks to: http://c-nergy.be/blog/?p=10752 for the tips.
#
bash -c "cat > ~/.xsession <<EOF
xfce4-session
EOF"
