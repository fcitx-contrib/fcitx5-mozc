# Generate usage_stats_list.inc
set(usage_stats_list_inc "${PROJECT_BINARY_DIR}/usage_stats/usage_stats_list.inc")

add_custom_command(
    OUTPUT "${usage_stats_list_inc}"
    COMMAND python "${MOZC_SRC_DIR}/usage_stats/gen_stats_list.py" --output "${usage_stats_list_inc}" "${MOZC_SRC_DIR}/data/usage_stats/stats.def"
    WORKING_DIRECTORY "${MOZC_SRC_DIR}"
    COMMENT "Generating usage_stats_list.inc"
)

add_custom_target(gen_stats_list DEPENDS "${usage_stats_list_inc}")

set(MOZC_USAGE_STATS_SRCS
    usage_stats.cc
    usage_stats_uploader.cc
)
list(TRANSFORM MOZC_USAGE_STATS_SRCS PREPEND "${MOZC_SRC_DIR}/usage_stats/")

add_library(mozc_usage_stats OBJECT ${MOZC_USAGE_STATS_SRCS})

target_include_directories(mozc_usage_stats PRIVATE
    "${MOZC_SRC_DIR}"
    "${MOZC_SRC_DIR}/third_party/abseil-cpp"
    "${MOZC_SRC_DIR}/third_party/protobuf/src"
    "${PROJECT_BINARY_DIR}"
)
