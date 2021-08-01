macro (Lambda)
	set (prefix ARG)
	set (NoValues)
	set (SingleValues INCLUDE_DIR SRC_DIR TEXT)
	set (MultiValues FILES VISITORS)

	cmake_parse_arguments (${prefix} "${NoValues}" "${SingleValues}" "${MultiValues}" ${ARGN})

	foreach (value ${ARG_VALUES})
		foreach (function ${ARG_VISITORS})
			cmake_language (CALL ${function} VISITORS ${ARG_VISITORS} VALUE ${value})
		endforeach ()
		
	endforeach ()
	

endmacro ()
