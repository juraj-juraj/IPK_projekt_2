add_library(utils_fce STATIC utils_fce.cpp)
target_compile_definitions(utils_fce PUBLIC UTILSFCE)

add_library(cmd_params OBJECT cmd_params_c.cpp)
target_compile_definitions(cmd_params PUBLIC CMDPARAMS)
target_link_libraries(cmd_params PUBLIC utils_fce)
