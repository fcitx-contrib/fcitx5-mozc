cmake_minimum_required(VERSION 3.22)

project(fcitx5-mozc)

set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

find_package(Gettext REQUIRED)
find_package(Fcitx5Core 5.1.12 REQUIRED)
find_package(Fcitx5Module REQUIRED COMPONENTS Clipboard)

include("${FCITX_INSTALL_CMAKECONFIG_DIR}/Fcitx5Utils/Fcitx5CompilerSettings.cmake")
add_compile_options(-fPIC)

set(MOZC_SRC_DIR "${PROJECT_SOURCE_DIR}/mozc/src")

add_subdirectory("${MOZC_SRC_DIR}/third_party/abseil-cpp")

set(protobuf_INSTALL OFF)
set(protobuf_BUILD_TESTS OFF)
set(protobuf_BUILD_PROTOC_BINARIES OFF)
set(protobuf_BUILD_LIBPROTOC ON)
add_subdirectory("${MOZC_SRC_DIR}/third_party/protobuf")

include(cmake/protobuf.cmake)

# Mozc requires char to be unsigned, as it's used as array index.
add_compile_options(-funsigned-char)

include(cmake/base.cmake)
include(cmake/composer.cmake)
include(cmake/config.cmake)
include(cmake/converter.cmake)
include(cmake/data_manager.cmake)
include(cmake/dictionary.cmake)
include(cmake/engine.cmake)
include(cmake/prediction.cmake)
include(cmake/rewriter.cmake)
include(cmake/session.cmake)
include(cmake/storage.cmake)
include(cmake/transliteration.cmake)
include(cmake/usage_stats.cmake)

include(cmake/mozc-static.cmake)

# Force data generation before binary build
add_dependencies(gen
    gen_character_set
    gen_config_file_stream_data
    gen_pos_matcher_code
    gen_pos_matcher_impl_inc
    gen_stats_list
    gen_version_def
)

add_dependencies(mozc_base gen)
add_dependencies(mozc_composer gen)
add_dependencies(mozc_config gen)
add_dependencies(mozc_converter gen)
add_dependencies(mozc_data_manager gen)
add_dependencies(mozc_dictionary gen)
add_dependencies(mozc_engine gen)
add_dependencies(mozc_prediction gen)
add_dependencies(mozc_rewriter gen)
add_dependencies(mozc_session gen)
add_dependencies(mozc_storage gen)
add_dependencies(mozc_transliteration gen)
add_dependencies(mozc_usage_stats gen)

add_subdirectory(src/unix/fcitx5)
