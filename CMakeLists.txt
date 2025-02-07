cmake_minimum_required(VERSION 3.16)

##PROJECT_VERSION_MAJOR = 6

## project(QtQuickDesignerComponents
##    DESCRIPTION "QtQuick Designer Components"
##    HOMEPAGE_URL "https://qt.io/"
##    VERSION "6.4.0"
##   LANGUAGES CXX C
##)

include(CMakePrintHelpers)

if(WIN32 AND NOT IGNORE_TOO_LONG_PATH_CHECK)
  set(LIMIT 250)
  set(FILE_SUFFIX "/src/imports/compat/QuickUltraLiteStudioComponentsplugin_autogen/include/QuickUltraLiteStudioComponentsplugin_QtQuickUltralite_Studio_ComponentsPlugin.moc")

  set(fullMocFilePath "${CMAKE_BINARY_DIR}${FILE_SUFFIX}")

  string(LENGTH "${fullMocFilePath}" fullPathLen)
  string(LENGTH "${FILE_SUFFIX}" suffixLen)
  math(EXPR maxBuildDirLen "${LIMIT} - ${suffixLen}")

  if(fullPathLen GREATER LIMIT)
    message(FATAL_ERROR
      "The path to the build directory is too long. "
      "Maximum allowed build directory length is ${maxBuildDirLen} characters. "
      "Please use a shorter path or pass -DIGNORE_TOO_LONG_PATH_CHECK=ON to skip this check."
    )
  endif()
endif()

set(PROJECT_VERSION_MAJOR 6)
set(PROJECT_VERSION_MINOR 4)
set(PROJECT_VERSION 6.4.1)

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

### qt_standard_project_setup()
add_subdirectory(src)

