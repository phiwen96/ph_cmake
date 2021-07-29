macro (Create_file)
	set (prefix ARG)
	set (NoValues DONT_ERASE_MODULE_IF_NOT_DEFINED)
	set (SingleValues NAME FILE TEXT)
	set (MultiValues)

	cmake_parse_arguments (${prefix} "${NoValues}" "${SingleValues}" "${MultiValues}" ${ARGN})

	

	if (NOT ARG_FILE)
		message (FATAL_ERROR "Please give us a FILE.")
	endif ()

	set ()


	set (create_with_text "${ARG_TEXT}")

	if (NOT ARG_TEXT)
		file (WRITE "${ARG_FILE}")
	else ()
		file (WRITE "${ARG_FILE}" "${ARG_TEXT}")
	endif ()

	cmake_language (CALL ${})
	file (WRITE "${ARG_FILE}" "${ARG_TEXT}")

	
endmacro ()
