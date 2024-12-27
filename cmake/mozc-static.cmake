add_library(mozc-static STATIC
    $<TARGET_OBJECTS:mozc_proto>
    $<TARGET_OBJECTS:mozc_base>
    $<TARGET_OBJECTS:mozc_composer>
    $<TARGET_OBJECTS:mozc_config>
    $<TARGET_OBJECTS:mozc_converter>
    $<TARGET_OBJECTS:mozc_data_manager>
    $<TARGET_OBJECTS:mozc_dictionary>
    $<TARGET_OBJECTS:mozc_engine>
    $<TARGET_OBJECTS:mozc_prediction>
    $<TARGET_OBJECTS:mozc_rewriter>
    $<TARGET_OBJECTS:mozc_session>
    $<TARGET_OBJECTS:mozc_storage>
    $<TARGET_OBJECTS:mozc_transliteration>
    $<TARGET_OBJECTS:mozc_usage_stats>
)
