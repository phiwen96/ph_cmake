macro (Create_cpp_files)

	set (prefix ARG)
	set (NoValues)
	set (SingleValues INCLUDE_DIR SRC_DIR TEXT)
	set (MultiValues FILES PRE_VISITORS POST_VISITORS)

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

	macro (pre_visitor file)
		message("PRE_VISITOR ${file}")
	endmacro ()

	macro (post_visitor file)
			message("POST_VISITOR ${file}")
	endmacro ()

	Files (FILES ${files} TEXT ${ARG_TEXT} PRE_VISITORS ${ARG_PRE_VISITORS} pre_visitor POST_VISITORS ${ARG_POST_VISITORS} post_visitor)



	foreach (filename IN LISTS ARG_FILES)
		list (APPEND files "${ARG_INCLUDE_DIR}/${filename}.hpp" "${ARG_SRC_DIR}/${filename}.cpp")
	endforeach ()

	foreach (filename IN LISTS ARG_FOR_EACH_FUNCTIONS)
		list (APPEND files "${ARG_INCLUDE_DIR}/${filename}.hpp" "${ARG_SRC_DIR}/${filename}.cpp")
	endforeach ()

	

	
endmacro ()
