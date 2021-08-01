Create_cpp_executables (TARGETS "myApp")


add_executable(myApp main.c)
add_executable(myAlias ALIAS myApp)
add_library(myLib STATIC src.cpp)

include(CMakePrintHelpers)
cmake_print_properties(TARGETS myApp myLib myAlias
  PROPERTIES TYPE ALIASED_TARGET)