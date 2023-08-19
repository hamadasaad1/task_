#!/bin/bash



# Clean and reinstall iOS Pods
cd ios
rm -rf Pods
pod install
cd ..



# Clean and reinstall iOS dependencies and setup
cd ios
bundle install
bundle exec fastlane install_plugins
cd ..
