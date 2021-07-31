macro (Create_cmake_files)

	set (prefix ARG)
	set (NoValues)
	set (SingleValues)
	set (MultiValues FILES)

	cmake_parse_arguments (${prefix} "${NoValues}" "${SingleValues}" "${MultiValues}" ${ARGN})

	
	if (NOT ARG_INCLUDE_DIR)
		set (ARG_INCLUDE_DIR "include")
		# message (FATAL_ERROR "Please give us a include dir.")
	endif ()

	if (NOT ARG_SRC_DIR)
		set (ARG_SRC_DIR "src")
	endif ()

	if (NOT ARG_FILES)
		message (FATAL_ERROR "Please give us a FILE.")
	endif ()

	if (NOT ARG_FILES)
		message (FATAL_ERROR "Please give us a FILE.")
	endif ()

	if (NOT ARG_TEXT)
		set (ARG_TEXT "")
	endif ()


	foreach (filename IN LISTS ARG_FILES)

		if (NOT EXISTS ${ARG_INCLUDE_DIR}/${filename})
			message ("${ARG_INCLUDE_DIR}/${filename}")
			file (WRITE "${ARG_INCLUDE_DIR}/${filename}" ${ARG_TEXT})

			# file (WRITE "${ARG_INCLUDE_DIR}/${filename}" ${ARG_TEXT})
		endif ()

		if (NOT EXISTS ${ARG_SRC_DIR}/${filename})
			message ("${ARG_SRC_DIR}/${filename}")

			file (WRITE "${ARG_SRC_DIR}/${filename}" ${ARG_TEXT})
		endif ()	

	endforeach ()

endmacro ()
