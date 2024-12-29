add_library(mozc-static STATIC
    ${GENERATED_PROTO_SRCS}
    ${MOZC_BASE_SRCS}
    ${MOZC_COMPOSER_SRCS}
    ${MOZC_CONFIG_SRCS}
    ${MOZC_CONVERTER_SRCS}
    ${MOZC_DATA_MANAGER_SRCS}
    ${MOZC_DICTIONARY_SRCS}
    ${MOZC_ENGINE_SRCS}
    ${MOZC_PREDICTION_SRCS}
    ${MOZC_REWRITER_SRCS}
    ${MOZC_SESSION_SRCS}
    ${MOZC_STORAGE_SRCS}
    ${MOZC_TRANSLITERATION_SRCS}
    ${MOZC_USAGE_STATS_SRCS}
)

target_include_directories(mozc-static PRIVATE
    "${MOZC_SRC_DIR}"
    "${MOZC_SRC_DIR}/third_party/abseil-cpp"
    "${MOZC_SRC_DIR}/third_party/protobuf/src"
    "${PROJECT_BINARY_DIR}"
)

# Mozc requires char to be unsigned, as it's used as array index.
target_compile_options(mozc-static PRIVATE -funsigned-char)

target_compile_definitions(mozc-static PRIVATE
    -DMOZC_DATASET_MAGIC_NUMBER_LENGTH=7
    -DMOZC_DISABLE_SESSION_WATCHDOG
)

add_dependencies(mozc-static gen)
