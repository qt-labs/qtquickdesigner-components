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

# get Qt version without using find, which would destroy the QT_REPO_DEPENDENCIES workaround
list(GET CMAKE_PREFIX_PATH 0 QT_INSTALL_PREFIX)
set(QT_VERSION_FILE "${QT_INSTALL_PREFIX}/lib/cmake/Qt6/Qt6ConfigVersionImpl.cmake")
if(EXISTS "${QT_VERSION_FILE}")
    file(STRINGS "${QT_VERSION_FILE}" QT_VERSION_FILE_CONTENT REGEX "^set\\(PACKAGE_VERSION \".*\"\\)")
    string(REGEX MATCH "set\\(PACKAGE_VERSION \"([0-9]+\\.[0-9]+\\.[0-9]+)\"" _ "${QT_VERSION_FILE_CONTENT}")
    set(STUDIO_COMPONENTS_VERSION "${CMAKE_MATCH_1}")
endif()

if(NOT DEFINED STUDIO_COMPONENTS_VERSION)
    message(WARNING "Could not extract Qt version from ${QT_VERSION_FILE}. Please check if the file contains the PACKAGE_VERSION.")
    set(STUDIO_COMPONENTS_VERSION "6.0.0")
endif()

project(QtQuickDesignerComponents
    DESCRIPTION "QtQuick Designer Components"
    HOMEPAGE_URL "https://qt.io/"
    LANGUAGES CXX C
    VERSION ${STUDIO_COMPONENTS_VERSION}
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

if(NOT "${STUDIO_COMPONENTS_VERSION}" STREQUAL "${Qt6_VERSION}")
    message(WARNING "STUDIO_COMPONENTS_VERSION (${STUDIO_COMPONENTS_VERSION}) does not match the found Qt version (${Qt6_VERSION}).")
endif()

qt_build_repo()
