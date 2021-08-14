macro (Create_files)

	set (prefix ARG)
	set (NoValues DONT_ERASE_MODULE_IF_NOT_DEFINED)
	set (SingleValues NAME TEXT)
	set (MultiValues FILES PRE_VISITORS POST_VISITORS)

	cmake_parse_arguments (${prefix} "${NoValues}" "${SingleValues}" "${MultiValues}" ${ARGN})

	

	if (NOT ARG_FILES)
		message (FATAL_ERROR "Please give us a FiILE.")
	endif ()

	if (NOT ARG_TEXT)
		set (ARG_TEXT "")
	endif ()


	foreach (file IN LISTS ARG_FILES)
		foreach (visitor IN LISTS ${ARG_POST_VISITORS})
				cmake_language (CALL ${visitor} FILE ${file})
		endforeach ()
		if (NOT EXISTS ${file})
	
			file (WRITE ${file} ${ARG_TEXT})
			foreach (visitor IN LISTS ${ARG_POST_VISITORS})
				cmake_language (CALL ${visitor} FILE ${file})
			endforeach ()
		endif ()	
	endforeach ()

endmacro ()
