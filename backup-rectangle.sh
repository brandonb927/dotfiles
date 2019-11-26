#!/usr/bin/env bash

RECTANGLE_PREFS="$(dirname $0)/Rectangle.prefs"

echo "#!/bin/bash" > $RECTANGLE_PREFS
echo ''
echo "defaults write com.knollsoft.Rectangle SUEnableAutomaticChecks -bool true" >> $RECTANGLE_PREFS
echo "defaults write com.knollsoft.Rectangle allowAnyShortcut -bool true" >> $RECTANGLE_PREFS
echo "defaults write com.knollsoft.Rectangle launchOnLogin -bool true" >> $RECTANGLE_PREFS

for key in \
leftHalf \
rightHalf \
topHalf \
bottomHalf \
topLeft \
topRight \
bottomLeft \
bottomRight
do
  printf "defaults write com.knollsoft.Rectangle ${key} -data " >> $RECTANGLE_PREFS
  defaults read com.knollsoft.Rectangle ${key} | sed 's/[^0-9a-f]//g' >> $RECTANGLE_PREFS
done
