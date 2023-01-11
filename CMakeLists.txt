cmake_minimum_required(VERSION 3.16)

project(QtQuickDesignerComponents
    DESCRIPTION "QtQuick Designer Components"
    HOMEPAGE_URL "https://qt.io/"
    VERSION "6.2.4"
    LANGUAGES CXX C
)

set(CMAKE_AUTOMOC ON)

# Enable reconfiguration of already installed version via
# pretend we are inside a qtdeclarative build.
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

qt_build_repo()
