macro (Create_cpp_files)

	set (prefix ARG)
	set (NoValues)
	set (SingleValues INCLUDE_DIR SRC_DIR TEXT)
	set (MultiValues FILES VISITORS)

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
		list (APPEND files "${ARG_INCLUDE_DIR}/${filename}.hpp" "${ARG_SRC_DIR}/${filename}.cpp")
	endforeach ()

	foreach (filename IN LISTS ARG_FOR_EACH_FUNCTIONS)
		list (APPEND files "${ARG_INCLUDE_DIR}/${filename}.hpp" "${ARG_SRC_DIR}/${filename}.cpp")
	endforeach ()

	

	Files (FILES ${files} TEXT ${ARG_TEXT} VISITORS ${ARG_VISITORS})
	
endmacro ()
