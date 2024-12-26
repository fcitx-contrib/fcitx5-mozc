set(MOZC_TRANSLITERATION_SRCS
    transliteration.cc
)
list(TRANSFORM MOZC_TRANSLITERATION_SRCS PREPEND "${MOZC_SRC_DIR}/transliteration/")

add_library(mozc_transliteration OBJECT ${MOZC_TRANSLITERATION_SRCS})

target_include_directories(mozc_transliteration PRIVATE
    "${MOZC_SRC_DIR}"
)
