set(CMAKE_SYSTEM_NAME Darwin)

find_program(CMAKE_C_COMPILER NAME gcc
  PATHS
  /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/usr/bin/
  /Developer/Platforms/iPhoneSimulator.platform/Developer/usr/bin/
  NO_DEFAULT_PATH)

find_program(CMAKE_CXX_COMPILER NAME g++
  PATHS
  /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/usr/bin/
  /Developer/Platforms/iPhoneSimulator.platform/Developer/usr/bin/
  NO_DEFAULT_PATH)

set(CMAKE_OSX_ARCHITECTURES i386)
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -fmessage-length=0 -pipe")
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wno-trigraphs -fpascal-strings")
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -O0 -Wreturn-type -Wunused-variable")
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -fexceptions -fasm-blocks -mmacosx-version-min=10.6")
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -gdwarf-2 -fvisibility=hidden")
#set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -fvisibility-inlines-hidden")
#set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -fobjc-abi-version=2 -fobjc-legacy-dispatch")
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -D__IPHONE_OS_VERSION_MIN_REQUIRED=40300")
#set(CMAKE_C_FLAGS "${CMAKE_CXX_FLAGS}")


# Set the CMAKE_OSX_SYSROOT to the latest SDK found
set(CMAKE_OSX_SYSROOT)
set(possible_sdk_roots
  /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs
  /Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs
  )
foreach(sdk_root ${possible_sdk_roots})
  foreach(sdk iPhoneSimulator4.3.sdk iPhoneSimulator5.0.sdk iPhoneSimulator5.1.sdk iPhoneSimulator6.0.sdk)
    if (EXISTS ${sdk_root}/${sdk} AND IS_DIRECTORY ${sdk_root}/${sdk})
      set(CMAKE_OSX_SYSROOT ${sdk_root}/${sdk})
    endif()
  endforeach()
endforeach()
if (NOT CMAKE_OSX_SYSROOT)
  message(FATAL_ERROR "Could not find a usable iOS SDK in ${sdk_root}")
endif()
message(STATUS "-- Using iOS SDK: ${CMAKE_OSX_SYSROOT}")


set(CMAKE_OSX_ARCHITECTURES "${CMAKE_OSX_ARCHITECTURES}" CACHE STRING "osx architectures")
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS}" CACHE STRING "c++ flags")
set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS}" CACHE STRING "c flags")
set(CMAKE_OSX_SYSROOT "${CMAKE_OSX_SYSROOT}" CACHE PATH "osx sysroot")


set(CMAKE_FIND_ROOT_PATH ${CMAKE_OSX_SYSROOT})
set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)
