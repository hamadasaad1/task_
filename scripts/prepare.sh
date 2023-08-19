#!/bin/bash

# Clean Flutter project dependencies and setup
flutter clean
flutter pub get

# Clean and reinstall iOS Pods
cd ios
rm -rf Pods
pod install
cd ..

# Clean Android project and setup
cd android
./gradlew clean
bundle install
bundle exec fastlane install_plugins
cd ..

# Clean and reinstall iOS dependencies and setup
cd ios
bundle install
bundle exec fastlane install_plugins
cd ..
