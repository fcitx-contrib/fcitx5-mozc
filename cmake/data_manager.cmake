set(MOZC_DATA_MANAGER_SRCS
    data_manager.cc
    dataset_reader.cc
    oss/oss_data_manager.cc
    serialized_dictionary.cc
)
list(TRANSFORM MOZC_DATA_MANAGER_SRCS PREPEND "${MOZC_SRC_DIR}/data_manager/")
