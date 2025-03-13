cmake_minimum_required(VERSION 3.16)

list(APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_SOURCE_DIR}/cmake")
include(QtCompHelper)

if (NOT IGNORE_TOO_LONG_PATH_CHECK)
    check_path_length()
endif()

if(NOT DEFINED STUDIO_COMPONENTS_VERSION)
    set_studio_components_version()
endif()

store_build_type_pre_project()

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

qt_policy(SET QTP0004 NEW)
qt_build_repo()
