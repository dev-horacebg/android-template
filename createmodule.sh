#!/bin/bash

buildDomain(){
    mkdir -p ${DOMAIN} \
            ${DOMAIN}/src/main/kotlin/com/horacebg/${MODULE}/domain \
            ${DOMAIN}/src/test/kotlin/com/horacebg/${MODULE}/domain /

    echo "/build" > ${DOMAIN}/.gitignore

    touch ${DOMAIN}/build.gradle
    cat > ${DOMAIN}/build.gradle <<EOL
apply plugin: 'java-library'

dependencies {
    testImplementation Deps.testlib_junit
}

sourceSets {
    main.java.srcDirs += 'src/main/kotlin'
    test.java.srcDirs += 'src/test/kotlin'
}
EOL
}

buildData(){
    mkdir -p ${DATA} \
            ${DATA}/src/main/kotlin/com/horacebg/${MODULE}/data \
            ${DATA}/src/test/kotlin/com/horacebg/${MODULE}/data /
    echo "/build" > ${DATA}/.gitignore
    touch ${DATA}/build.gradle
    cat > ${DATA}/build.gradle <<EOL
apply plugin: 'java-library'

dependencies {
    implementation project(':${MODULE}:domain')
    testImplementation Deps.testlib_junit
}

sourceSets {
    main.java.srcDirs += 'src/main/kotlin'
    test.java.srcDirs += 'src/test/kotlin'
}
EOL
}

buildView() {
    mkdir -p ${VIEW} \
            ${VIEW}/src/main/kotlin/com/horacebg/${MODULE}/view \
            ${VIEW}/src/test/kotlin/com/horacebg/${MODULE}/view \
            ${VIEW}/src/androidTest/kotlin/com/horacebg/${MODULE}/view /
    echo "/build" > ${VIEW}/.gitignore
    echo "<manifest package=\"com.horacebg.${MODULE}.view\" />" > ${VIEW}/src/main/AndroidManifest.xml

    touch ${VIEW}/build.gradle
    cat > ${VIEW}/build.gradle <<EOL
apply plugin: 'com.android.library'
apply plugin: 'kotlin-android'
apply plugin: 'kotlin-android-extensions'

android {
    compileSdkVersion rootProject.ext.compileSdkVersion

    sourceSets {
        main.java.srcDirs += 'src/main/kotlin'
        test.java.srcDirs += 'src/test/kotlin'
        androidTest.java.srcDirs += 'src/androidTest/kotlin'
    }
}


dependencies {
    implementation project(':${MODULE}:domain')

    implementation Deps.androidx_appcompat
    implementation Deps.androidx_core
    testImplementation Deps.testlib_junit
    androidTestImplementation 'androidx.test.ext:junit:1.1.0'
    androidTestImplementation Deps.testandroidx_espressocore
}
EOL
}

buildApp() {
    mkdir -p ${APP} \
         ${APP}/src/main/kotlin/com/horacebg/${MODULE}/app \
         ${APP}/src/test/kotlin/com/horacebg/${MODULE}/app /
    echo "/build" > ${APP}/.gitignore

    touch ${APP}/build.gradle
    cat > ${APP}/build.gradle <<EOL
apply plugin: 'java-library'

dependencies {
    api project(':${MODULE}:domain')
    implementation project(':${MODULE}:data')

    testImplementation Deps.testlib_junit
}

sourceSets {
    main.java.srcDirs += 'src/main/kotlin'
    test.java.srcDirs += 'src/test/kotlin'
}
EOL
}

buildAppWithView() {
    mkdir -p ${APP} \
         ${APP}/src/main/kotlin/com/horacebg/${MODULE}/app \
         ${APP}/src/test/kotlin/com/horacebg/${MODULE}/app /
    echo "/build" > ${APP}/.gitignore
    echo "<manifest package=\"com.horacebg.${MODULE}.app\" />" > ${APP}/src/main/AndroidManifest.xml

    touch ${APP}/build.gradle
    cat > ${APP}/build.gradle <<EOL
apply plugin: 'com.android.library'

android {
    compileSdkVersion rootProject.ext.compileSdkVersion

    sourceSets {
        main.java.srcDirs += 'src/main/kotlin'
        test.java.srcDirs += 'src/test/kotlin'
        androidTest.java.srcDirs += 'src/androidTest/kotlin'
    }
}

dependencies {
    api project(':${MODULE}:domain')
    implementation project(':${MODULE}:data')
    implementation project(':${MODULE}:view')
    testImplementation Deps.testlib_junit
}

EOL
}

successMessage() {
    cat << EOM
Module created successfully

Add next line in setting.gradle:
'${MODULE}:app', '${MODULE}:domain', '${MODULE}:data'${VIEW_MODULE}

Enjoy!
EOM
}

usage(){
    echo "Arguments: <feature_name> [--skip-view]"
}

SKIP_VIEW=0
MODULE=$1
while [[ "$2" != "" ]]; do
    case $2 in
        --skip-view )   shift
                        SKIP_VIEW=1
                        ;;
    * )                 usage
                        exit 1
    esac
done

ROOT=$(pwd)
MODULE_ROOT="${ROOT}/${MODULE}"
APP="${MODULE_ROOT}/app"
DOMAIN="${MODULE_ROOT}/domain"
DATA="${MODULE_ROOT}/data"
VIEW="${MODULE_ROOT}/view"


buildDomain
buildData
VIEW_MODULE=''
if [[ ${SKIP_VIEW} -eq 0 ]]; then
  buildView
  buildAppWithView
  VIEW_MODULE=", '${MODULE}:view'"
else
  buildApp
fi

successMessage
