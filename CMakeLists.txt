cmake_minimum_required(VERSION 3.22)

project(fcitx5-mozc)

set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

option(BUILD_MOZC_ADDON "Build Mozc Fcitx5 Addon" ON)

set(CMAKE_CXX_STANDARD 17)
add_compile_options(-fPIC)

set(MOZC_SRC_DIR "${PROJECT_SOURCE_DIR}/mozc/src")

if (NOT DEFINED MOZC_TARGET)
    add_subdirectory("${MOZC_SRC_DIR}/third_party/abseil-cpp")
    # Not installing as we'll regenerate libabsl.a

    set(protobuf_INSTALL OFF)
    set(protobuf_BUILD_TESTS OFF)
    set(protobuf_BUILD_PROTOC_BINARIES OFF) # We use the one in mozc.
    set(protobuf_BUILD_LIBPROTOC ON)
    set(protobuf_BUILD_LIBUPB OFF) # No binary for iOS.
    add_subdirectory("${MOZC_SRC_DIR}/third_party/protobuf")
    install(TARGETS utf8_validity DESTINATION "${CMAKE_INSTALL_LIBDIR}")
    install(TARGETS libprotobuf DESTINATION "${CMAKE_INSTALL_LIBDIR}")

    include(cmake/protobuf.cmake)
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

    include(cmake/mozc-static.cmake)
    set(MOZC_TARGET
        libprotobuf
        mozc-static
        absl::flags_parse
        absl::log_flags
    )

    # Force data generation before binary build
    add_dependencies(gen
        gen_character_set
        gen_config_file_stream_data
        gen_pos_matcher_code
        gen_pos_matcher_impl_inc
        gen_version_def
    )
endif()

if (BUILD_MOZC_ADDON)
    find_package(Gettext REQUIRED)
    find_package(Fcitx5Core 5.1.12 REQUIRED)
    find_package(Fcitx5Module REQUIRED COMPONENTS Clipboard)

    include("${FCITX_INSTALL_CMAKECONFIG_DIR}/Fcitx5Utils/Fcitx5CompilerSettings.cmake")
    add_subdirectory(src/unix/fcitx5)
endif()
