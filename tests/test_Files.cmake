macro (test_Files)

	if (EXISTS "A")
		message (FATAL_ERROR "oops")
	endif ()
	
	if (EXISTS "B")
		message (FATAL_ERROR "oops")
	endif ()

	if (EXISTS "C")
		message (FATAL_ERROR "oops")
	endif ()

	

	message("tjo")


endmacro ()
