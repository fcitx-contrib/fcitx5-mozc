set(MOZC_SESSION_SRCS
    ime_context.cc
    key_event_transformer.cc
    keymap.cc
    key_info_util.cc
    session.cc
    session_handler.cc
)
list(TRANSFORM MOZC_SESSION_SRCS PREPEND "${MOZC_SRC_DIR}/session/")
