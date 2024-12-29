set(MOZC_COMPOSER_SRCS
    composer.cc
    internal/char_chunk.cc
    internal/composition.cc
    internal/composition_input.cc
    internal/mode_switching_handler.cc
    internal/special_key.cc
    internal/transliterators.cc
    key_event_util.cc
    key_parser.cc
    table.cc
)
list(TRANSFORM MOZC_COMPOSER_SRCS PREPEND "${MOZC_SRC_DIR}/composer/")
