if (TARGET ocpn::gtk)
  return()
endif ()

add_library(_GTK INTERFACE)
add_library(ocpn::gtk ALIAS _GTK)

if (NOT OCPN_FORCE_GTK3)
  find_package(GTK2)
endif ()

if (GTK2_FOUND)
  target_include_directories(_GTK INTERFACE ${GTK2_INCLUDE_DIRS})
  target_link_libraries(_GTK INTERFACE ${GTK2_LIBRARIES})
  message(STATUS "Building against GTK2...")
  if (OCPN_VERBOSE)
    message(STATUS "GTK2 headers: ${GTK2_INCLUDE_DIRS}")
    message(STATUS "GTK2 libs: ${GTK2_LIBRARIES}")
  endif ()
else (GTK2_FOUND)
  find_package(GTK3)
  target_include_directories(_GTK INTERFACE ${GTK3_INCLUDE_DIRS})
  target_link_libraries(_GTK INTERFACE ${GTK3_LIBRARIES})
  target_compile_definitions(_GTK INTERFACE "-D__WXGTK3__")
  message(STATUS "Building against GTK3...")
endif (GTK2_FOUND)
