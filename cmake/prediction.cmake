set(MOZC_PREDICTION_SRCS
    dictionary_prediction_aggregator.cc
    dictionary_predictor.cc
    number_decoder.cc
    predictor.cc
    result.cc
    single_kanji_prediction_aggregator.cc
    suggestion_filter.cc
    user_history_predictor.cc
)
list(TRANSFORM MOZC_PREDICTION_SRCS PREPEND "${MOZC_SRC_DIR}/prediction/")

add_library(mozc_prediction OBJECT
    ${MOZC_PREDICTION_SRCS}
    "${PROJECT_BINARY_DIR}/prediction/user_history_predictor.pb.cc"
)

target_include_directories(mozc_prediction PRIVATE
    "${MOZC_SRC_DIR}"
    "${MOZC_SRC_DIR}/third_party/abseil-cpp"
    "${MOZC_SRC_DIR}/third_party/protobuf/src"
    "${PROJECT_BINARY_DIR}"
)
