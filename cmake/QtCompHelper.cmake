macro(check_path_length)
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
endmacro()

# get Qt version without using find, which would
# destroy the QT_REPO_DEPENDENCIES workaround
macro(set_studio_components_version)
    set(QT_SEARCH_PATHS)

    if(DEFINED CMAKE_TOOLCHAIN_FILE)
        file(TO_CMAKE_PATH "${CMAKE_TOOLCHAIN_FILE}" CMAKE_TOOLCHAIN_FILE_UNIX)
        string(REGEX REPLACE "/lib/cmake/Qt6/qt\\.toolchain\\.cmake$" "" QT_INSTALL_PREFIX "${CMAKE_TOOLCHAIN_FILE_UNIX}")
        list(APPEND QT_SEARCH_PATHS "${QT_INSTALL_PREFIX}")
    endif()

    if(DEFINED CMAKE_PREFIX_PATH)
        list(APPEND QT_SEARCH_PATHS ${CMAKE_PREFIX_PATH})
    endif()

    set(QT_VERSION_FILE "")
    foreach(QT_INSTALL_PREFIX IN LISTS QT_SEARCH_PATHS)
        set(POTENTIAL_QT_VERSION_FILE "${QT_INSTALL_PREFIX}/lib/cmake/Qt6/Qt6ConfigVersionImpl.cmake")
        if(EXISTS "${POTENTIAL_QT_VERSION_FILE}")
            set(QT_VERSION_FILE "${POTENTIAL_QT_VERSION_FILE}")
            break()
        endif()
    endforeach()

    if(EXISTS "${QT_VERSION_FILE}")
        file(STRINGS "${QT_VERSION_FILE}" QT_VERSION_FILE_CONTENT REGEX "^set\\(PACKAGE_VERSION \".*\"\\)")
        string(REGEX MATCH "set\\(PACKAGE_VERSION \"([0-9]+\\.[0-9]+\\.[0-9]+)\"" _ "${QT_VERSION_FILE_CONTENT}")
        set(STUDIO_COMPONENTS_VERSION "${CMAKE_MATCH_1}")
    endif()

    if(NOT DEFINED STUDIO_COMPONENTS_VERSION)
        message(WARNING "Could not extract Qt version from ${QT_VERSION_FILE}. Please check if the file contains the PACKAGE_VERSION.")
        set(STUDIO_COMPONENTS_VERSION "6.0.0")
    endif()
endmacro()

macro(store_build_type_pre_project)
    # Store initial build type (if any is specified) to be read by
    # qt_internal_set_default_build_type().
    # See qt_internal_set_default_build_type() for details.
    if(DEFINED CACHE{CMAKE_BUILD_TYPE})
        set(__qt_internal_standalone_project_cmake_build_type_before_project_call "${CMAKE_BUILD_TYPE}")
    endif()
endmacro()

function(map_to_components input_path output_var)
  file(RELATIVE_PATH rel_path "${CMAKE_SOURCE_DIR}/src" "${input_path}")
  set(mapped_path "${CMAKE_SOURCE_DIR}/components/${rel_path}")
  set(${output_var} "${mapped_path}" PARENT_SCOPE)
endfunction()

function(set_qml_resource_aliases)
  foreach(file_path IN LISTS ARGN)
    get_filename_component(file_name "${file_path}" NAME)
    set_source_files_properties("${file_path}" PROPERTIES QT_RESOURCE_ALIAS "${file_name}")
  endforeach()
endfunction()

function(make_shader_outputs prefix_arg shaders_arg outputs_arg)
  set(output_list "")
  foreach(shader IN LISTS ${shaders_arg})
    string(REPLACE "${prefix_arg}/" "" rel_shader "${shader}")
    string(REPLACE ".frag" ".frag.qsb" output_shader "${rel_shader}")
    list(APPEND output_list "${output_shader}")
  endforeach()
  set(${outputs_arg} "${output_list}" PARENT_SCOPE)
endfunction()
