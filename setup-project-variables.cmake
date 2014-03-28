


find_package(PythonInterp REQUIRED)
find_package(Git REQUIRED)



set(vtk_module_defaults
  -DVTK_Group_StandAlone:BOOL=OFF
  -DVTK_Group_Rendering:BOOL=OFF
  -DModule_vtkFiltersCore:BOOL=ON
  -DModule_vtkFiltersModeling:BOOL=ON
  -DModule_vtkFiltersSources:BOOL=ON
  -DModule_vtkFiltersGeometry:BOOL=ON
  -DModule_vtkIOGeometry:BOOL=ON
  -DModule_vtkIOLegacy:BOOL=ON
  -DModule_vtkIOXML:BOOL=ON
  -DModule_vtkIOImage:BOOL=ON
  -DModule_vtkIOPLY:BOOL=ON
  -DModule_vtkIOInfovis:BOOL=ON
  -DModule_vtkImagingCore:BOOL=ON
  -DModule_vtkParallelCore:BOOL=ON
  -DModule_vtkRenderingCore:BOOL=ON
  -DModule_vtkRenderingFreeType:BOOL=ON
)


option(BUILD_ANDROID "Build for Android" ON)
option(BUILD_IOS_DEVICE "Build for iOS device" ON)
option(BUILD_IOS_SIMULATOR "Build for iOS simulator" OFF)
option(BUILD_HOST "Build for host" ON)

set(toolchain_dir ${CMAKE_SOURCE_DIR}/toolchains)
set(toolchain_ios_simulator ${toolchain_dir}/toolchain-ios-simulator.cmake)
set(toolchain_ios_device ${toolchain_dir}/toolchain-ios-device.cmake)
set(toolchain_android ${toolchain_dir}/toolchain-android.cmake)
set(try_run_results_vtk_ios_simulator ${toolchain_dir}/vtk-try-run-results.cmake)
set(try_run_results_vtk_ios_device ${toolchain_dir}/vtk-try-run-results.cmake)
set(try_run_results_vtk_android ${toolchain_dir}/vtk-try-run-results.cmake)
set(try_run_results_pcl_ios_simulator ${toolchain_dir}/pcl-try-run-results.cmake)
set(try_run_results_pcl_ios_device ${toolchain_dir}/pcl-try-run-results.cmake)
set(try_run_results_pcl_android ${toolchain_dir}/pcl-try-run-results.cmake)
