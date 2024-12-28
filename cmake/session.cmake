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
    session_handler_tool.cc
    session_observer_handler.cc
    session_usage_observer.cc
    session_usage_stats_util.cc
)
list(TRANSFORM MOZC_SESSION_SRCS PREPEND "${MOZC_SRC_DIR}/session/")

add_library(mozc_session OBJECT ${MOZC_SESSION_SRCS})

target_compile_definitions(mozc_session PRIVATE -DMOZC_DISABLE_SESSION_WATCHDOG)

target_include_directories(mozc_session PRIVATE
    "${MOZC_SRC_DIR}"
    "${MOZC_SRC_DIR}/third_party/abseil-cpp"
    "${MOZC_SRC_DIR}/third_party/protobuf/src"
    "${PROJECT_BINARY_DIR}"
)
