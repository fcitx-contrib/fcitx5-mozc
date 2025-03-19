set(MOZC_COMPOSER_SRCS
    char_chunk.cc    
    composer.cc
    composition.cc
    composition_input.cc
    mode_switching_handler.cc
    special_key.cc
    transliterators.cc
    key_event_util.cc
    key_parser.cc
    table.cc
)
list(TRANSFORM MOZC_COMPOSER_SRCS PREPEND "${MOZC_SRC_DIR}/composer/")
