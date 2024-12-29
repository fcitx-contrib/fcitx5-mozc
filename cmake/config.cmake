set(MOZC_CONFIG_SRCS
    character_form_manager.cc
    config_handler.cc
    stats_config_util.cc
)
list(TRANSFORM MOZC_CONFIG_SRCS PREPEND "${MOZC_SRC_DIR}/config/")
