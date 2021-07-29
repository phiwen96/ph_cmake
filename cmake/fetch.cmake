macro (ph_fetch )
	set (prefix ARG)
	set (NoArg)
	set (SingleArg)
	set (MultiArg)

	cmake_parse_arguments (${prefix} "${NoArg}" "${SingleArg}" "MultiArg" ${ARGN})

	

	if (NOT TARGET ${target})
		include (FetchContent)
		FetchContent_Declare(
			${target}
			GIT_REPOSITORY https://github.com/phiwen96/${target}.git
			GIT_TAG        v0.0.0)

		FetchContent_GetProperties (${target})
		
		if (NOT {target}_POPULATED)
			FetchContent_Populate (${target})
			add_subdirectory (${${target}_SOURCE_DIR} ${${target}_BINARY_DIR})
		endif ()
	endif ()
endmacro ()