macro (ph_fetch )
	set (prefix ARG)
	set (NoArg)
	set (SingleArg USER VERSION)
	set (MultiArg REPOS)

	cmake_parse_arguments (${prefix} "${NoArg}" "${SingleArg}" "MultiArg" ${ARGN})

	
	if (NOT ARG_REPOS)
		message (FATAL_ERROR "You must specify [1, -∞) project names.")
	endif ()

	if (NOT ARG_USER)
		message (FATAL_ERROR "You must specify a user for use in the urls of repos, for example phiwen96.")
	endif ()

	if (NOT ARG_VERSION)
		message (FATAL_ERROR "You must specify a version for .")
	endif ()


	foreach (git_repo IN LISTS ARG_REPOS)
	 
		if (NOT TARGET ${git_repo})

			message ("Fetching git repo ${git_repo}")
			
			include (FetchContent)

			FetchContent_Declare(
				${git_repo}
				GIT_REPOSITORY https://github.com/${ARG_USER}/${git_repo}.git
				GIT_TAG        ${ARG_VERSION})

			FetchContent_GetProperties (${git_repo})
			
			if (NOT ${git_repo}_POPULATED)
				FetchContent_Populate (${git_repo})
				add_subdirectory (${${git_repo}_SOURCE_DIR} ${${git_repo}_BINARY_DIR})
			endif ()
		endif ()

	endforeach ()
endmacro ()