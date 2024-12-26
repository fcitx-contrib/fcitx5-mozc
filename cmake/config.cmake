set(MOZC_CONFIG_SRCS
    character_form_manager.cc
    config_handler.cc
    stats_config_util.cc
)
list(TRANSFORM MOZC_CONFIG_SRCS PREPEND "${MOZC_SRC_DIR}/config/")

add_library(mozc_config OBJECT ${MOZC_CONFIG_SRCS})

target_include_directories(mozc_config PRIVATE
    "${MOZC_SRC_DIR}"
    "${MOZC_SRC_DIR}/third_party/abseil-cpp"
    "${MOZC_SRC_DIR}/third_party/protobuf/src"
    "${PROJECT_BINARY_DIR}"
)
