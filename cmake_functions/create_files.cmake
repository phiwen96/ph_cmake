

macro (ph_create_files)

	set (prefix ARG)
	set (NoValues DONT_ERASE_MODULE_IF_NOT_DEFINED)
	set (SingleValues NAME DESTINATION)
	set (MultiValues TESTS FILES)

	cmake_parse_arguments (${prefix} "${NoValues}" "${SingleValues}" "${MultiValues}" ${ARGN})


	

	foreach(arg IN LISTS noValues)
		if(${${prefix}_${arg}})
			message(" ${arg} enabled")
		else()
			message(" ${arg} disabled")
		endif()
  	endforeach()

	foreach(arg IN LISTS singleValues)
  		message(" ${arg} = ${${prefix}_${arg}}")
	endforeach()

	foreach (file IN LISTS ${prefix}_FILES)
  		message(" ${arg} = ${${prefix}_${arg}}")

		get_filename_component (name ${file} NAME_WE)
			# message(${name})
		list (FIND ARG_MODULES "${name}" _index)
		if (${_index} GREATER -1)
		else ()
			message ("creating files")
			file (WRITE "${header_file}" "#pragma once")
		endif ()

	endforeach()
endmacro ()


