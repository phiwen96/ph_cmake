include (FetchContent)


macro (Fetch)
	set (opt)
	set (single REPO TAG)
	set (mult TARGETS)

	cmake_parse_arguments (ARG "${opt}" "${single}" "${mult}" ${ARGN})

	if (NOT ARG_TAG)
		set (TAG "v0.0.0")
	endif ()
	
	if (NOT ARG_REPO)
		set (ARG_REPO "https://github.com/phiwen96")
	endif ()

	if (NOT ARG_TARGETS)
		message (FATAL_MESSAGE "you need to specify targets.")
	endif ()
	
	
	foreach (target IN LISTS ARG_TARGETS)
		# message (${A})
		FetchContent_Declare(
  		${target}
  		GIT_REPOSITORY "${ARG_REPO}/${target}.git"
  		GIT_TAG        "${ARG_TAG}")

		FetchContent_GetProperties (${target})
	
		if (NOT ${target}_POPULATED)
  			FetchContent_Populate (${target})
  			add_subdirectory (${${target}_SOURCE_DIR} ${${target}_BINARY_DIR})
		endif ()
	endforeach ()
	
endmacro (Fetch)

# message("kiss")
# Fetch (TARGETS hej då)