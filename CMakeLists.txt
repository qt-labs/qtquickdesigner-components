cmake_minimum_required(VERSION 3.16)

if (NOT IGNORE_TOO_LONG_PATH_CHECK)
    execute_process(
        COMMAND cmd /c "ver"
        RESULT_VARIABLE EXIT_CODE_RETURN
        OUTPUT_VARIABLE OS_VERSION
        ERROR_QUIET
        OUTPUT_STRIP_TRAILING_WHITESPACE
    )

    if(NOT EXIT_CODE_RETURN AND OS_VERSION MATCHES "Microsoft Windows")
            string(LENGTH
                   ${CMAKE_BINARY_DIR}/src/imports/compat/Components/QuickUltraLiteStudioComponentsplugin_autogen/include/QuickUltraLiteStudioComponentsplugin_QtQuickUltralite_Studio_ComponentsPlugin.moc
                   BINARY_DIR_LENGTH)
            if(BINARY_DIR_LENGTH GREATER 250)
                message(FATAL_ERROR "The path to the build directory results in excessively long file"
                                    " paths. This may cause build issues on Windows. Please use a shorter"
                                    " build directory."
                                    " Or you can try to build by adding -DIGNORE_TOO_LONG_PATH_CHECK=ON"
                                    " to your CMAKE command.")
            endif()
    endif()
endif()

project(QtQuickDesignerComponents
    DESCRIPTION "QtQuick Designer Components"
    HOMEPAGE_URL "https://qt.io/"
    LANGUAGES CXX C
    # we do not know the Qt version here, but it is necessary to have one
    # version is set after we know the current Qt version again
    VERSION "6.2.4"
)

set(CMAKE_AUTOMOC ON)

# Enable reconfiguration of already installed version via
# pretend that we do a Qt repository build that depends on qtdeclarative.
# this activates an early bail out (already existing hack)
# This needs to be called before any find(Qt* is called.
set(QT_REPO_DEPENDENCIES "qtdeclarative")

find_package(Qt6
    CONFIG
    REQUIRED
    COMPONENTS
        BuildInternals
        Quick
        Core
        Qml
        ShaderTools
)
set(PROJECT_VERSION ${Qt6_VERSION})

qt_build_repo()
