macro (Create_cpp_executables)

	set (prefix ARG)
	set (NoValues)
	set (SingleValues INCLUDE_DIR SRC_DIR)
	set (MultiValues TARGETS PRE_VISITOR POST_VISITOR)

	cmake_parse_arguments (${prefix} "${NoValues}" "${SingleValues}" "${MultiValues}" ${ARGN})




	if (NOT ARG_TEXT)
		set (ARG_TEXT "")
	endif ()

	macro (pre_visitor file)
		message("PRE_VISITOR ${file}")
	endmacro ()

	macro (post_visitor file)
			message("POST_VISITOR ${file}")
	endmacro ()
	

	Files (DIR "src" TEXT ${ARG_TEXT} FILES ${ARG_TARGETS} PRE_VISITOR pre_visitor POST_VISITOR post_visitor)


	# foreach (target IN LISTS ARG_TARGETS)



	# 		add_executable (${target} "src/${filename}.cpp")

	# 	if (NOT TARGET ARG_INCLUDE_DIR)
	# 		add_executable (${filename} "src/${filename}.cpp")
	# 		# list (APPEND files "include/${filename}.cmake" "src/${filename}.cmake")
	# 	endif ()

	# endforeach ()

	# Create_files (FILES ${files} TEXT ${ARG_TEXT})


endmacro ()
