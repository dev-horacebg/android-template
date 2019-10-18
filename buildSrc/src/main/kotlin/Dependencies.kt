import org.gradle.api.JavaVersion

object Config {
    const val minSdk = 20
    const val compileSdk = 29
    const val targetSdk = 29
    val javaVersion = JavaVersion.VERSION_1_8
    const val buildTools = "29.0.2"
}


object Versions {
    // <editor-fold desc="google">
    const val androidx_core = "1.0.1"
    const val androidx_recyclerview = "1.0.0"
    const val androidx_navigation = "2.0.0"
    const val androidx_constraintLayout = "1.1.3"
    const val material = "1.1.0-alpha04"
    const val androidx_appcompat = "1.1.0"
    // </editor-fold>

    // <editor-fold desc="testing">
    const val junit = "4.12"
    const val androidx_espresso = "3.1.1"
    const val androidx_testing = "1.1.1"
    //</editor-fold>

    // <editor-fold desc="tools">
    const val gradleandroid = "3.5.0"
    const val kotlin = "1.3.20"
    const val gradleversions = "0.21.0"
    // </editor-fold>

}

object Deps {
    val androidx_core = "androidx.core:core-ktx:${Versions.androidx_core}"
    val androidx_constraintlayout = "androidx.constraintlayout:constraintlayout:${Versions.androidx_constraintLayout}"
    val androidx_material = "com.google.android.material:material:${Versions.material}"
    val androidx_navigation_fragment = "androidx.navigation:navigation-fragment-ktx:${Versions.androidx_navigation}"
    val androidx_navigation_ui = "androidx.navigation:navigation-ui-ktx:${Versions.androidx_navigation}"
    val androidx_recyclerview = "androidx.recyclerview:recyclerview:${Versions.androidx_recyclerview}"
    val androidx_appcompat = "androidx.appcompat:appcompat:${Versions.androidx_appcompat}"

    val testlib_junit = "junit:junit:${Versions.junit}"

    val testandroidx_rules = "androidx.test:rules:${Versions.androidx_testing}"
    val testandroidx_runner = "androidx.test:runner:${Versions.androidx_testing}"
    val testandroidx_espressocore = "androidx.test.espresso:espresso-core:${Versions.androidx_espresso}"

    const val tools_gradleandroid = "com.android.tools.build:gradle:${Versions.gradleandroid}"
    const val tools_kotlin = "org.jetbrains.kotlin:kotlin-gradle-plugin:${Versions.kotlin}"
    const val tools_gradleversions = "com.github.ben-manes:gradle-versions-plugin:${Versions.gradleversions}"

}