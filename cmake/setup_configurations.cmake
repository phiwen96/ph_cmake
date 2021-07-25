if(CMAKE_CONFIGURATION_TYPES) 
	if(NOT "Profile" IN_LIST CMAKE_CONFIGURATION_TYPES) 
		list(APPEND CMAKE_CONFIGURATION_TYPES Profile) 
	endif() 
else() 
	set(allowableBuildTypes Debug Release Profile) 
	set_property(CACHE CMAKE_BUILD_TYPE PROPERTY STRINGS "${allowableBuildTypes}") 
	if(NOT CMAKE_BUILD_TYPE) 
		set(CMAKE_BUILD_TYPE Debug CACHE STRING "" FORCE) 
	elseif(NOT CMAKE_BUILD_TYPE IN_LIST allowableBuildTypes) 
		message(FATAL_ERROR "Invalid build type: ${CMAKE_BUILD_TYPE}") 
	endif() 
endif()