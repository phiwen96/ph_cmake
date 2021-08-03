macro (Create_cmake_files)

	set (dir "")

	macro (FILES f)
			# message("FILES!!")
			list (APPEND files "${dir}/${f}.cmake")
			# message(${f})
	endmacro ()

	macro (DIR d)
		set (dir ${d})
	endmacro ()
	
	

	ph_parse (.. DIR ... FILES args ${ARGN})

	Files (FILES ${files} TEXT ${ARG_TEXT})



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
