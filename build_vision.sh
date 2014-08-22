#!/bin/bash

notify-send 'PUREKAT for Vision' --icon=dialog-information

# Make sure we are building clean

make clobber

# Let's sync the source first

repo sync -j4 -f

# Let's speed up the build

export export USE_CCACHE=1
export CCACHE_DIR=/purekat
/purekat/prebuilts/misc/darwin-x86/ccache/ccache -M 50G

# Let's setup the environment

. build/envsetup.sh

# Let's pick vision for building

lunch cm_vision-userdebug

# Let's make some bacon ;)

mka bacon

# Let's show a notify-send prompt saying we are down building

notify-send 'All done building!!' --icon=dialog-information 
