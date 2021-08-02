macro (Create_cpp_executables)

	set (prefix ARG)
	set (NoValues)
	set (SingleValues INCLUDE_DIR SRC_DIR)
	set (MultiValues TARGETS)

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

	Files (DIR "/src" FILES ${ARG_TARGETS})


	foreach (filename IN LISTS ARG_TARGETS)

		if (NOT TARGET ARG_INCLUDE_DIR)
			add_executable (${filename} "src/${filename}.cpp")
			# list (APPEND files "include/${filename}.cmake" "src/${filename}.cmake")
		endif ()

	endforeach ()

	# Create_files (FILES ${files} TEXT ${ARG_TEXT})


endmacro ()
