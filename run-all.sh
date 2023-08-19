#!/bin/bash

# Run the prepare-flutter.sh script
bash scripts/prepare-flutter.sh

# Run the prepare-android.sh script
bash scripts/prepare-android.sh

# Run the prepare-ios.sh script
bash scripts/prepare-ios.sh

# Run the beta-android.sh script
bash scripts/beta-android.sh

# Run the beta-ios.sh script
bash scripts/beta-ios.sh
