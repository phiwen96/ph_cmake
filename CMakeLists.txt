cmake_minimum_required (VERSION 3.18)

project (
	ph_cmake
	VERSION 1.0.0
	DESCRIPTION "Very nice project")

if (TARGET ph_cmake)
	return()
endif()

add_custom_target (ph_cmake)



set(CMAKE_MODULE_PATH "${PROJECT_SOURCE_DIR}/cmake" ${CMAKE_MODULE_PATH})

include (FetchContent)


file (GLOB_RECURSE cmakes cmake/*.cmake)

foreach (file ${cmakes})
    include (${file})
endforeach ()

