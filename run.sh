#!/bin/zsh

xcodebuild -destination="platform:iOS Simulator, arch:arm64, id:CEC1B4FC-46E5-42FA-AE4C-8D9919E9E970, OS:26.5, name:iPhone 17" -scheme eschy SYMROOT="./build" build -sdk iphonesimulator -project eschy.xcodeproj -configuration Debug build

xcrun simctl boot CEC1B4FC-46E5-42FA-AE4C-8D9919E9E970
open /Applications/Xcode.app/Contents/Developer/Applications/Simulator.app/

xcrun simctl install CEC1B4FC-46E5-42FA-AE4C-8D9919E9E970 build/Debug-iphonesimulator/eschy.app

xcrun simctl launch CEC1B4FC-46E5-42FA-AE4C-8D9919E9E970 AbhinavMara.eschy
