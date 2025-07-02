## CircleCI Configuration for Building Signed APKs
This configuration file is designed to build signed APKs for an Android application using CircleCI. It supports multiple flavors of the application, allowing you to specify which flavor to build at runtime. The configuration includes steps for checking out the code, installing dependencies, analyzing the code, running tests, decoding the keystore, generating the `key.properties` file, and finally building the APK for the specified flavor.

---

```yml
version: 2.1

executors:
  flutter:
    docker:
      - image: cirrusci/flutter:stable
    working_directory: ~/repo

jobs:
  build_signed_apk:
    executor: flutter
    parameters:
      flavor:
        type: string

    environment:
      FLUTTER_CHANNEL: stable

    steps:
      - checkout

      - run:
          name: 🛠️ Install Melos & Bootstrap
          command: |
            dart pub global activate melos
            melos bootstrap

      - run:
          name: 🔍 Flutter Version
          command: flutter --version

      - run:
          name: 🔧 Analyze Code
          command: melos analyze

      - run:
          name: ✅ Run Tests
          command: melos test

      - run:
          name: 🗝️ Decode Keystore
          command: |
            echo "$ANDROID_KEYSTORE" | base64 -d > application/android/app/keystore.jks

      - run:
          name: 🗂️ Create key.properties
          command: |
            cat <<EOF > application/android/key.properties
            storePassword=$KEYSTORE_PASSWORD
            keyPassword=$ANDROID_ALIAS_PASSWORD
            keyAlias=$ANDROID_ALIAS
            storeFile=keystore.jks
            EOF

      - run:
          name: 🏗 Build APK (<< parameters.flavor >>)
          command: |
            cd application
            flutter build apk \
              --obfuscate \
              --split-debug-info=out/android \
              --flavor << parameters.flavor >> \
              -t lib/main_<< parameters.flavor >>.dart

      - store_artifacts:
          path: application/build/app/outputs/apk/<< parameters.flavor >>/release/
          destination: << parameters.flavor >>-release-apk

workflows:
  version: 2
  android-release-ci:
    jobs:
      - build_signed_apk:
          name: build-production-apk
          flavor: production
          filters:
            branches:
              only:
                - main
                - dev
            tags:
              ignore: /.*/
```