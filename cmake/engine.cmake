set(MOZC_ENGINE_SRCS
    data_loader.cc
    engine.cc
    minimal_converter.cc
    modules.cc
)
list(TRANSFORM MOZC_ENGINE_SRCS PREPEND "${MOZC_SRC_DIR}/engine/")
