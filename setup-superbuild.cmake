include(ExternalProject)

set(base "${CMAKE_BINARY_DIR}/CMakeExternals")
set_property(DIRECTORY PROPERTY EP_BASE ${base})


# This macro sets CMAKE_BUILD_TYPE if it is undefined
# and makes sure that the variable appears in the cache
macro(set_default_build_type build_type)
  if(NOT CMAKE_BUILD_TYPE)
    set(CMAKE_BUILD_TYPE ${build_type})
  endif()
  set(CMAKE_BUILD_TYPE ${CMAKE_BUILD_TYPE} CACHE STRING "Build configuration type" FORCE)
endmacro()


set_default_build_type(Release)
set(build_type ${CMAKE_BUILD_TYPE})
set(source_prefix ${base}/Source)
set(build_prefix ${base}/Build)
set(install_prefix ${base}/Install)
