set(MOZC_STORAGE_SRCS
    encrypted_string_storage.cc
    existence_filter.cc
    louds/bit_stream.cc
    louds/bit_vector_based_array.cc
    louds/bit_vector_based_array_builder.cc
    louds/louds.cc
    louds/louds_trie.cc
    louds/louds_trie_builder.cc
    louds/simple_succinct_bit_vector_index.cc
    lru_storage.cc
    registry.cc
    tiny_storage.cc
)
list(TRANSFORM MOZC_STORAGE_SRCS PREPEND "${MOZC_SRC_DIR}/storage/")

add_library(mozc_storage OBJECT ${MOZC_STORAGE_SRCS})

target_include_directories(mozc_storage PRIVATE
    "${MOZC_SRC_DIR}"
    "${MOZC_SRC_DIR}/third_party/abseil-cpp"
)
