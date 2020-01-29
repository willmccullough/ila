
SET(_PF86 "PROGRAMFILES(X86)")

SET(SDL2_SEARCH_PATHS
	${SDL2_ROOT_DIR}
	./vendor/SDL2
	$ENV{PROGRAMFILES}/SDL2
	"$ENV{_PF86}/SDL2"
	~/Library/Frameworks
	/Library/Frameworks
	/usr/local
	/usr
	/opt
	/sw
	/opt/local
	/opt/csw
)

FIND_PATH(SDL2_INCLUDE_DIRS
	NAMES
	SDL.h SDL2/SDL.h
	PATHS
		${SDL2_SEARCH_PATHS}
	PATH_SUFFIXES
		include
	DOC
		"The directory where SDL.h resides"
)

FIND_LIBRARY(SDL2_LIBRARIES
	NAMES
		SDL2 SDL2main
	PATHS
		${SDL2_SEARCH_PATHS}
	PATH_SUFFIXES
		lib
		lib64
		lib/x86
		lib/x64
	DOC
		"The SDL2 library"
)

IF ( SDL2_INCLUDE_DIRS AND SDL2_LIBRARIES )
	SET( SDL2_FOUND TRUE )
	MESSAGE(STATUS "Looking for SDL2 - found")
ELSE ( SDL2_INCLUDE_DIRS AND SDL2_LIBRARIES )
	SET( SDL2_FOUND FALSE )
	MESSAGE(STATUS "Looking for SDL2 - not found")
ENDIF ( SDL2_INCLUDE_DIRS AND SDL2_LIBRARIES )