set(MOZC_SESSION_SRCS
    internal/candidate_list.cc
    internal/ime_context.cc
    internal/key_event_transformer.cc
    internal/keymap.cc
    internal/session_output.cc
    key_info_util.cc
    session.cc
    session_converter.cc
    session_handler.cc
    session_observer_handler.cc
    session_usage_observer.cc
    session_usage_stats_util.cc
)
list(TRANSFORM MOZC_SESSION_SRCS PREPEND "${MOZC_SRC_DIR}/session/")
