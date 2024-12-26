set(MOZC_REWRITER_SRCS
    a11y_description_rewriter.cc
    calculator/calculator.cc
    calculator/calculator_mock.cc
    calculator_rewriter.cc
    collocation_rewriter.cc
    collocation_util.cc
    command_rewriter.cc
    correction_rewriter.cc
    date_rewriter.cc
    dice_rewriter.cc
    dictionary_generator.cc
    emoji_rewriter.cc
    emoticon_rewriter.cc
    english_variants_rewriter.cc
    environmental_filter_rewriter.cc
    focus_candidate_rewriter.cc
    fortune_rewriter.cc
    gen_emoticon_rewriter_data.cc
    gen_existence_data.cc
    gen_single_kanji_noun_prefix_data.cc
    ivs_variants_rewriter.cc
    language_aware_rewriter.cc
    number_compound_util.cc
    number_rewriter.cc
    order_rewriter.cc
    remove_redundant_candidate_rewriter.cc
    rewriter.cc
    rewriter_util.cc
    single_kanji_rewriter.cc
    small_letter_rewriter.cc
    symbol_rewriter.cc
    t13n_promotion_rewriter.cc
    transliteration_rewriter.cc
    unicode_rewriter.cc
    usage_rewriter.cc
    user_boundary_history_rewriter.cc
    user_dictionary_rewriter.cc
    user_segment_history_rewriter.cc
    variants_rewriter.cc
    version_rewriter.cc
    zipcode_rewriter.cc
)
list(TRANSFORM MOZC_REWRITER_SRCS PREPEND "${MOZC_SRC_DIR}/rewriter/")

add_library(mozc_rewriter OBJECT ${MOZC_REWRITER_SRCS})

target_include_directories(mozc_rewriter PRIVATE
    "${MOZC_SRC_DIR}"
    "${MOZC_SRC_DIR}/third_party/abseil-cpp"
    "${MOZC_SRC_DIR}/third_party/protobuf/src"
    "${PROJECT_BINARY_DIR}"
)