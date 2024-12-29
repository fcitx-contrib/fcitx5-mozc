set(MOZC_DATA_MANAGER_SRCS
    data_manager.cc
    dataset_reader.cc
    oss/oss_data_manager.cc
    serialized_dictionary.cc
)
list(TRANSFORM MOZC_DATA_MANAGER_SRCS PREPEND "${MOZC_SRC_DIR}/data_manager/")

add_library(mozc_data_manager OBJECT ${MOZC_DATA_MANAGER_SRCS})

target_compile_definitions(mozc_data_manager PRIVATE -DMOZC_DATASET_MAGIC_NUMBER_LENGTH=7)

target_include_directories(mozc_data_manager PRIVATE
    "${MOZC_SRC_DIR}"
    "${MOZC_SRC_DIR}/third_party/abseil-cpp"
    "${MOZC_SRC_DIR}/third_party/protobuf/src"
    "${PROJECT_BINARY_DIR}"
)
