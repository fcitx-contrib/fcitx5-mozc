set(MOZC_CONVERTER_SRCS
    candidate.cc    
    candidate_filter.cc
    connector.cc
    converter.cc
    history_reconstructor.cc
    immutable_converter.cc
    key_corrector.cc
    lattice.cc
    nbest_generator.cc
    reverse_converter.cc
    segmenter.cc
    segments.cc
)
list(TRANSFORM MOZC_CONVERTER_SRCS PREPEND "${MOZC_SRC_DIR}/converter/")
