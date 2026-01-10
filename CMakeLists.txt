cmake_minimum_required(VERSION 3.14)

include(cmake/prelude.cmake)

project(
    vast
    VERSION 0.1.0
    DESCRIPTION "Visualizer for AST"
    HOMEPAGE_URL "github.com/Unintellectual/vast "
    LANGUAGES CXX
)

include(cmake/project-is-top-level.cmake)
include(cmake/variables.cmake)

# ---- Declare library ----

add_library(
    vast_lib OBJECT
    source/lib.cpp
)

target_include_directories(
    vast_lib ${warning_guard}
    PUBLIC
    "\$<BUILD_INTERFACE:${PROJECT_SOURCE_DIR}/source>"
)

target_compile_features(vast_lib PUBLIC cxx_std_20)

# ---- Declare executable ----

add_executable(vast_exe source/main.cpp)
add_executable(vast::exe ALIAS vast_exe)

set_property(TARGET vast_exe PROPERTY OUTPUT_NAME vast)

target_compile_features(vast_exe PRIVATE cxx_std_20)

target_link_libraries(vast_exe PRIVATE vast_lib)

# ---- Install rules ----

if(NOT CMAKE_SKIP_INSTALL_RULES)
  include(cmake/install-rules.cmake)
endif()

# ---- Developer mode ----

if(NOT vast_DEVELOPER_MODE)
  return()
elseif(NOT PROJECT_IS_TOP_LEVEL)
  message(
      AUTHOR_WARNING
      "Developer mode is intended for developers of vast"
  )
endif()

include(cmake/dev-mode.cmake)
