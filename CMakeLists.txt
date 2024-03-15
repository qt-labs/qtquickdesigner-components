cmake_minimum_required(VERSION 3.16)

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
)
set(PROJECT_VERSION ${Qt6_VERSION})

qt_build_repo()
