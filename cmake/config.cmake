set(MOZC_CONFIG_SRCS
    character_form_manager.cc
    config_handler.cc
)
list(TRANSFORM MOZC_CONFIG_SRCS PREPEND "${MOZC_SRC_DIR}/config/")
