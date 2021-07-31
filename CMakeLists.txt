cmake_minimum_required (VERSION 3.18)

project (
	ph_cmake
	VERSION 1.0.0
	DESCRIPTION "Very nice project")

# if (TARGET ph_cmake)
# 	return()
# endif()

# add_custom_target (ph_cmake)



set (CMAKE_MODULE_PATH "${PROJECT_SOURCE_DIR}/cmake" ${CMAKE_MODULE_PATH})

# include (FetchContent)



file (GLOB_RECURSE cmake_functions "cmake_functions/*.cmake")
file (GLOB_RECURSE cmake_tests "cmake_tests/*.cmake")


foreach (file ${cmake_functions})
    include (${file})
endforeach ()

# foreach (file IN LIST ${cmake_tests})
#     include (${file})
# 	message(${file})
# 	message("hej")
# endforeach ()


Create_files (FILES "kuk" "fitta" TEXT "tjo")
Create_cpp_files (FILES "kuk" "fitta" TEXT "tjo")

