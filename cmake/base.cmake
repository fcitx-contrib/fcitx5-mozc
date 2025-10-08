# Generate config_file_stream_data.inc
set(config_file_stream_data_inc "${PROJECT_BINARY_DIR}/base/config_file_stream_data.inc")

set(keymap_files
    atok.tsv
    chromeos.tsv
    kotoeri.tsv
    mobile.tsv
    ms-ime.tsv
    overlay_henkan_muhenkan_to_ime_on_off.tsv
)

list(TRANSFORM keymap_files PREPEND "keymap/")

set(composition_table
    12keys-halfwidthascii.tsv
    12keys-hiragana.tsv
    12keys-hiragana_intuitive.tsv
    50keys-hiragana.tsv
    flick-halfwidthascii.tsv
    flick-halfwidthascii_ios.tsv
    flick-hiragana.tsv
    flick-hiragana_intuitive.tsv
    flick-number.tsv
    godan-hiragana.tsv
    hiragana-romanji.tsv
    kana.tsv
    notouch-hiragana.tsv
    qwerty_mobile-halfwidthascii.tsv
    qwerty_mobile-hiragana.tsv
    romanji-hiragana.tsv
    toggle_flick-halfwidthascii.tsv
    toggle_flick-halfwidthascii_ios.tsv
    toggle_flick-hiragana.tsv
    toggle_flick-hiragana_intuitive.tsv
    toggle_flick-number.tsv
)

list(TRANSFORM composition_table PREPEND "preedit/")

add_custom_command(
    OUTPUT "${config_file_stream_data_inc}"
    COMMAND python "${MOZC_SRC_DIR}/base/gen_config_file_stream_data.py" --output "${config_file_stream_data_inc}" ${composition_table} ${keymap_files}
    WORKING_DIRECTORY "${MOZC_SRC_DIR}/data"
    COMMENT "Generating config_file_stream_data.inc"
)

add_custom_target(gen_config_file_stream_data DEPENDS "${config_file_stream_data_inc}")

# Generate version_def.h
set(version_def_h "${PROJECT_BINARY_DIR}/base/version_def.h")

add_custom_command(
    OUTPUT "${version_def_h}"
    COMMAND "${PROJECT_SOURCE_DIR}/scripts/gen_version_def.sh" "${PROJECT_BINARY_DIR}/base/mozc_version.txt" "${version_def_h}"
    WORKING_DIRECTORY "${MOZC_SRC_DIR}"
    COMMENT "Generating version_def.h"
)

add_custom_target(gen_version_def DEPENDS "${version_def_h}")

# Build mozc_base
set(MOZC_BASE_SRCS
    clock.cc
    config_file_stream.cc
    container/serialized_string_array.cc
    encryptor.cc
    environ.cc
    file_stream.cc
    file_util.cc
    hash.cc
    init_mozc.cc
    log_file.cc
    mmap.cc
    number_util.cc
    password_manager.cc
    process_mutex.cc
    random.cc
    singleton.cc
    stopwatch.cc
    strings/internal/double_array.cc
    strings/internal/japanese_rules.cc
    strings/internal/utf8_internal.cc
    strings/japanese.cc
    strings/unicode.cc
    system_util.cc
    text_normalizer.cc
    unverified_aes256.cc
    unverified_sha1.cc
    util.cc
    version.cc
    vlog.cc
)
list(TRANSFORM MOZC_BASE_SRCS PREPEND "${MOZC_SRC_DIR}/base/")

list(APPEND MOZC_BASE_SRCS
    "${PROJECT_SOURCE_DIR}/src/process.cc"
)

if (APPLE)
    list(APPEND MOZC_BASE_SRCS
        "${PROJECT_SOURCE_DIR}/src/mac_util.mm"
    )
endif()
