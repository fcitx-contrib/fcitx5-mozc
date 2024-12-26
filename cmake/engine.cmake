set(MOZC_ENGINE_SRCS
    data_loader.cc
    engine.cc
    eval_engine_factory.cc
    minimal_engine.cc
    modules.cc
)
list(TRANSFORM MOZC_ENGINE_SRCS PREPEND "${MOZC_SRC_DIR}/engine/")

add_library(mozc_engine OBJECT ${MOZC_ENGINE_SRCS})

target_include_directories(mozc_engine PRIVATE
    "${MOZC_SRC_DIR}"
    "${MOZC_SRC_DIR}/third_party/abseil-cpp"
    "${MOZC_SRC_DIR}/third_party/protobuf/src"
    "${PROJECT_BINARY_DIR}"
)
