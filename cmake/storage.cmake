set(MOZC_STORAGE_SRCS
    encrypted_string_storage.cc
    existence_filter.cc
    louds/bit_vector_based_array.cc
    louds/louds.cc
    louds/louds_trie.cc
    louds/simple_succinct_bit_vector_index.cc
    lru_storage.cc
)
list(TRANSFORM MOZC_STORAGE_SRCS PREPEND "${MOZC_SRC_DIR}/storage/")
