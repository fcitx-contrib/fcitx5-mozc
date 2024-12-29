set(MOZC_CONVERTER_SRCS
    candidate_filter.cc
    connector.cc
    converter.cc
    history_reconstructor.cc
    immutable_converter.cc
    key_corrector.cc
    lattice.cc
    nbest_generator.cc
    node_list_builder.cc
    reverse_converter.cc
    segmenter.cc
    segments.cc
)
list(TRANSFORM MOZC_CONVERTER_SRCS PREPEND "${MOZC_SRC_DIR}/converter/")

add_library(mozc_converter OBJECT ${MOZC_CONVERTER_SRCS})

target_include_directories(mozc_converter PRIVATE
    "${MOZC_SRC_DIR}"
    "${MOZC_SRC_DIR}/third_party/abseil-cpp"
    "${MOZC_SRC_DIR}/third_party/protobuf/src"
    "${PROJECT_BINARY_DIR}"
)
