macro (Create_files)

	set (prefix ARG)
	set (NoValues DONT_ERASE_MODULE_IF_NOT_DEFINED)
	set (SingleValues NAME TEXT)
	set (MultiValues FILES)

	cmake_parse_arguments (${prefix} "${NoValues}" "${SingleValues}" "${MultiValues}" ${ARGN})

	

	if (NOT ARG_FILES)
		message (FATAL_ERROR "Please give us a FILE.")
	endif ()

	if (NOT ARG_TEXT)
		set (ARG_TEXT "")
	endif ()


	foreach (file IN LISTS ARG_FILES)
		if (NOT EXISTS ${file})
			file (WRITE ${file} ${ARG_TEXT})
		endif ()	
	endforeach ()

endmacro ()
