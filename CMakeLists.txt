cmake_minimum_required(VERSION 3.16)

project(QtQuickDesignerComponents
    DESCRIPTION "QtQuick Designer Components"
    HOMEPAGE_URL "https://qt.io/"
    VERSION "6.2.4"
    LANGUAGES CXX C
)

set(CMAKE_AUTOMOC ON)

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
