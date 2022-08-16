#!/bin/bash

if [ -f ".app_version" ]; then
    VER=`cat .app_version`
else
    VER="1.0.0"
    echo $VER > .app_version
fi

if [ -f ".build_seq" ]; then
    BLD=`cat .build_seq`
else
    BLD='0'
fi

((BLD++))
echo $BLD > .build_seq
echo "Ver: $VER ($BLD)" > .current_version

echo "
// Auto-generated by updversion.sh. Do not edit.

class version_buildnumber {
  static const String name = '$VER';q
  static const int build = $BLD;
  
}


echo "$VER"

exit 0

java --version
echo 1.what is ur name
