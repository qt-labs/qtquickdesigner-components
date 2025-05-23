find_package(Qt6 COMPONENTS ShaderTools)

add_library(QtQuickDesignerComponents INTERFACE)

function(register_plugin module_name)
    target_link_libraries(QtQuickDesignerComponents INTERFACE ${module_name}plugin)
endfunction()

set(qds_qml_extra_args "")
if(QT_QDS_COMPONENTS_NOWARN)
   list(APPEND qds_qml_extra_args NO_LINT)
endif()

if (Qt6_VERSION VERSION_GREATER_EQUAL "6.8")
    qt_policy(SET QTP0004 NEW)
endif()

add_subdirectory(imports)
