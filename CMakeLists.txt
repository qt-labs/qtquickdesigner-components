cmake_minimum_required(VERSION 3.16)

##PROJECT_VERSION_MAJOR = 6
project(QtQuickDesignerComponents
    DESCRIPTION "QtQuick Designer Components"
    HOMEPAGE_URL "https://qt.io/"
    VERSION "6.4.0"
    LANGUAGES CXX C
)

include(CMakePrintHelpers)

cmake_print_variables(PROJECT_SOURCE_DIR)
cmake_print_variables(PROJECT_VERSION_MAJOR)
message("$(PROJECT_SOURCE_DIR)")
message("$(PROJECT_VERSION_MAJOR)")

set(CMAKE_AUTOMOC ON)

find_package(Qt6
    CONFIG
    REQUIRED
    COMPONENTS
        BuildInternals
        Quick
        Core
        Qml
        Gui
)

qt_standard_project_setup()
add_subdirectory(src)

