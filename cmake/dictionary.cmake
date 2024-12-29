# Generate pos_matcher_impl.inc
set(pos_matcher_impl_inc "${PROJECT_BINARY_DIR}/dictionary/pos_matcher_impl.inc")

add_custom_command(
    OUTPUT "${pos_matcher_impl_inc}"
    COMMAND "${PROJECT_SOURCE_DIR}/scripts/gen_pos_matcher_code.sh" "${pos_matcher_impl_inc}"
    WORKING_DIRECTORY "${MOZC_SRC_DIR}"
    COMMENT "Generating pos_matcher_impl.inc"
)

add_custom_target(gen_pos_matcher_impl_inc DEPENDS "${pos_matcher_impl_inc}")

# Generate pos_map.inc
set(pos_map_inc "${PROJECT_BINARY_DIR}/dictionary/pos_map.inc")

add_custom_command(
    OUTPUT "${pos_map_inc}"
    COMMAND "${PROJECT_SOURCE_DIR}/scripts/gen_pos_map.sh" "${pos_map_inc}"
    WORKING_DIRECTORY "${MOZC_SRC_DIR}"
    COMMENT "Generating pos_map.inc"
)

add_custom_target(gen_pos_matcher_code DEPENDS "${pos_map_inc}")

set(MOZC_DICTIONARY_SRCS
    dictionary_impl.cc
    file/codec.cc
    file/codec_factory.cc
    file/codec_util.cc
    file/dictionary_file.cc
    single_kanji_dictionary.cc
    suffix_dictionary.cc
    suppression_dictionary.cc
    system/codec.cc
    system/system_dictionary.cc
    system/value_dictionary.cc
    user_dictionary.cc
    user_dictionary_importer.cc
    user_dictionary_session.cc
    user_dictionary_session_handler.cc
    user_dictionary_storage.cc
    user_dictionary_util.cc
    user_pos.cc
)
list(TRANSFORM MOZC_DICTIONARY_SRCS PREPEND "${MOZC_SRC_DIR}/dictionary/")
