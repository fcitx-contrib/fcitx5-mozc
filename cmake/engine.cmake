set(MOZC_ENGINE_SRCS
    candidate_list.cc
    data_loader.cc
    engine.cc
    engine_converter.cc
    engine_output.cc
    minimal_converter.cc
    modules.cc
)
list(TRANSFORM MOZC_ENGINE_SRCS PREPEND "${MOZC_SRC_DIR}/engine/")
