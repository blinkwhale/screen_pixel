cmake_minimum_required(VERSION 3.14)

# Project-level configuration.
project(screen_pixel LANGUAGES CXX)

# Explicitly opt in to modern CMake behaviors to avoid warnings with recent versions of CMake.
cmake_policy(VERSION 3.14...3.25)

# Define the plugin name.
set(PLUGIN_NAME "screen_pixel_plugin")

# Any new source files that you add to the plugin should be added here.
list(APPEND PLUGIN_SOURCES
  "screen_pixel_plugin.cpp"
  "screen_pixel_plugin_c_api.cpp"
)

# Define the plugin library target. Its name must not be changed (see comment on PLUGIN_NAME above).
add_library(${PLUGIN_NAME} SHARED
  ${PLUGIN_SOURCES}
)

# Apply a standard set of build settings that are configured in the application-level CMakeLists.txt.
apply_standard_settings(${PLUGIN_NAME})

# Symbols are hidden by default to reduce the chance of accidental conflicts between plugins.
# This should not be removed; any symbols that should be exported should be explicitly exported
# with the FLUTTER_PLUGIN_EXPORT macro.
set_target_properties(${PLUGIN_NAME} PROPERTIES
  CXX_VISIBILITY_PRESET hidden)
target_compile_definitions(${PLUGIN_NAME} PRIVATE FLUTTER_PLUGIN_IMPL)

# Source include directories and library dependencies. Add any plugin-specific dependencies here.
target_include_directories(${PLUGIN_NAME} PRIVATE
  "${CMAKE_CURRENT_SOURCE_DIR}"
)
target_link_libraries(${PLUGIN_NAME} PRIVATE flutter flutter_wrapper_plugin)

# List of absolute paths to libraries that should be bundled with the plugin.
# This list could contain prebuilt libraries, or libraries created by an external build triggered from this build file.
set(screen_pixel_bundled_libraries
  ""
  PARENT_SCOPE
)
