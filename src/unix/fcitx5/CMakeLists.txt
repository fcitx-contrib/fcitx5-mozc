set(FCITX5_MOZC_SRCS
    fcitx_key_event_handler.cc
    fcitx_key_translator.cc
    mozc_client_pool.cc
    mozc_direct_client.cc
    mozc_engine_factory.cc
    mozc_engine.cc
    mozc_response_parser.cc
    mozc_state.cc
    surrounding_text_util.cc
)

add_fcitx5_addon(mozc ${FCITX5_MOZC_SRCS})

target_include_directories(mozc PRIVATE
    "${PROJECT_SOURCE_DIR}/src"
    "${MOZC_SRC_DIR}"
    "${PROJECT_BINARY_DIR}"
    "${MOZC_SRC_DIR}/third_party/protobuf/src"
    "${MOZC_SRC_DIR}/third_party/abseil-cpp"
)

if (LINUX)
    target_include_directories(mozc PRIVATE
        "${CMAKE_INSTALL_PREFIX}/include"
        "${CMAKE_INSTALL_PREFIX}/include/Fcitx5/Module"
    )
elseif (APPLE AND NOT IOS)
    target_include_directories(mozc PRIVATE
        "/Library/Input Methods/Fcitx5.app/Contents/include"
        "/Library/Input Methods/Fcitx5.app/Contents/include/Fcitx5/Module"
    )
endif()

target_link_libraries(mozc
    Fcitx5::Core
    ${MOZC_TARGET}
)

install(TARGETS mozc DESTINATION "${CMAKE_INSTALL_LIBDIR}/fcitx5")
install(FILES "${CMAKE_CURRENT_SOURCE_DIR}/mozc.conf" DESTINATION "${CMAKE_INSTALL_DATADIR}/fcitx5/inputmethod" COMPONENT config)
install(FILES "${CMAKE_CURRENT_SOURCE_DIR}/mozc-addon.conf" RENAME mozc.conf DESTINATION "${FCITX_INSTALL_PKGDATADIR}/addon" COMPONENT config)

add_subdirectory(po)
