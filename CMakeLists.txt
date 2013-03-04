cmake_minimum_required(VERSION 2.8.6)
project(superbuild NONE)

include(setup-superbuild.cmake)

include(setup-project-variables.cmake)

include(external-project-macros.cmake)


install_eigen()
fetch_vtk()
fetch_ves()
fetch_pcl()
fetch_boost()
fetch_flann()

compile_vtk()

set(tags)

if(BUILD_ANDROID)
 list(APPEND tags android)
endif()
if(BUILD_IOS_DEVICE)
 list(APPEND tags ios-device)
endif()
if(BUILD_IOS_SIMULATOR)
 list(APPEND tags ios-simulator)
endif()

foreach(tag ${tags})
  crosscompile_vtk(${tag})
  crosscompile_boost(${tag})
  crosscompile_flann(${tag})
  crosscompile_pcl(${tag})
  crosscompile_ves(${tag})
endforeach()

if (BUILD_IOS_DEVICE)
  create_pcl_framework()
endif()
