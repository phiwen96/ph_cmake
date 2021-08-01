cmake_minimum_required (VERSION 3.18)

project (
	ph_cmake
	VERSION 1.0.0
	DESCRIPTION "Very nice project")

set (CMAKE_MODULE_PATH "${PROJECT_SOURCE_DIR}/cmake_functions" ${CMAKE_MODULE_PATH})

file (GLOB_RECURSE cmake_functions "cmake_functions/*.cmake")
file (GLOB_RECURSE cmake_tests "cmake_tests/*.cmake")

foreach (file ${cmake_functions})
    include (${file})
endforeach ()

Create_cmake_files (

	FILES 
		"Create_files"
		"Create_cmake_files"
		"Create_cmake_files"
		"Create_cpp_executables"
		"Create_cpp_apps"

	DIR 
		"cmake_functions"
)




