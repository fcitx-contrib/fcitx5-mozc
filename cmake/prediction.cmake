set(MOZC_PREDICTION_SRCS
    dictionary_prediction_aggregator.cc
    dictionary_predictor.cc
    number_decoder.cc
    predictor.cc
    realtime_decoder.cc
    result.cc
    result_filter.cc
    single_kanji_decoder.cc
    suggestion_filter.cc
    user_history_predictor.cc
)
list(TRANSFORM MOZC_PREDICTION_SRCS PREPEND "${MOZC_SRC_DIR}/prediction/")
