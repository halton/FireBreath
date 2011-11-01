#/**********************************************************\ 
# Auto-generated X11 project definition file for the
# @{PLUGIN_name} project
#\**********************************************************/

# X11 template platform definition CMake file
# Included from ../CMakeLists.txt

# remember that the current source dir is the project root; this file is in X11/
file (GLOB PLATFORM RELATIVE ${CMAKE_CURRENT_SOURCE_DIR}
    X11/[^.]*.cpp
    X11/[^.]*.h
    X11/[^.]*.cmake
    )

SOURCE_GROUP(X11 FILES ${PLATFORM})

# use this to add preprocessor definitions
add_definitions(
)

set (SOURCES
    ${SOURCES}
    ${PLATFORM}
    )

add_x11_plugin(${PROJECT_NAME} SOURCES)

if (FB_SHARED)
    pkg_check_modules(LIBFIREBREATH REQUIRED firebreath)
endif()

# add library dependencies here; leave ${PLUGIN_INTERNAL_DEPS} there unless you know what you're doing!
if (FB_SHARED)
  target_link_libraries(${PROJECT_NAME}
    -Wl,-whole-archive
    ${PLUGIN_PREFIX}_PluginAuto
    -Wl,-no-whole-archive
    ${LIBFIREBREATH_LIBRARIES}
    ${Boost_LIBRARIES}
    ${FBLIB_LIBRARIES}
    -ldl
    )
else()
  target_link_libraries(${PROJECT_NAME}
    ${PLUGIN_INTERNAL_DEPS}
  )
endif()
