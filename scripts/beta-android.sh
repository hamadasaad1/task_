
# cd android
# bundle exec fastlane beta_android
# cd ..


cd android
chmod +x gradlew
./gradlew clean
bundle install
bundle exec fastlane beta_android
cd ..





