

macro (Create_cpp_tests)

	if (NOT TARGET Catch2)
		include (FetchContent)

		FetchContent_Declare(
			Catch2
			GIT_REPOSITORY https://github.com/catchorg/Catch2.git
			GIT_TAG        v2.13.1)

		FetchContent_MakeAvailable (Catch2)
	endif ()



endmacro ()
