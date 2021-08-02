file (GLOB_RECURSE cmaketestfiles "*.cmake")
	message("kuk")

foreach (file IN LISTS ${cmaketestfiles})


	include (${file})

	get_filename_component (name ${file} NAME_WE)

	cmake_language (CALL ${name})
	message("kuk")

endforeach ()
