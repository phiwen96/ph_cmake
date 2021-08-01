macro (cmake_files)


	macro (FILES f)
		message(${f})
	endmacro ()

	macro (DIR d)
		message("DIR!!")
	endmacro ()
	

	macro(hej)
		message("hej")
	endmacro(hej)
	

	macro(fitta_p)
		message("hej")
	endmacro()

	macro(hora k)
		message("${k}")
		# foreach(i IN LISTS ${ARGN})
		# 	message("lol  ${i}")
		# endforeach(i IN LISTS ${ARGN})
		
	endmacro(hora)
	

	ph_parse (. DIR .. kuk ... FILES args ${ARGN})

	return ()


	# message("hej")
	
	set (prefix ARG)
	set (NoValues)
	set (SingleValues DIR)
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

		if (ARG_DIR)
			list (APPEND files "${ARG_DIR}/${filename}.cmake")
		else ()
			list (APPEND files "${filename}.cmake")
		endif ()

	endforeach ()

	Create_files (FILES ${files} TEXT ${ARG_TEXT})


endmacro ()
