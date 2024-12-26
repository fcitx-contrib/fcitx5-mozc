# You should set PROTOC_EXECUTABLE to native protoc when cross-build.
if (NOT PROTOC_EXECUTABLE)
    add_executable(protoc "${MOZC_SRC_DIR}/protobuf/custom_protoc_main.cc")
    target_include_directories(protoc PRIVATE "${MOZC_SRC_DIR}/third_party/protobuf/src")
    target_link_libraries(protoc libprotoc)
    set(PROTOC_EXECUTABLE "${PROJECT_BINARY_DIR}/protoc")
endif()

add_custom_target(gen) # Dummy target to force data generation before binary build
set(PROTO_SRCS
    data_manager/dataset
    prediction/user_history_predictor
    protocol/candidate_window
    protocol/commands
    protocol/config
    protocol/engine_builder
    protocol/segmenter_data
    protocol/state
    protocol/user_dictionary_storage
    usage_stats/usage_stats
)
list(TRANSFORM PROTO_SRCS APPEND ".pb.cc" OUTPUT_VARIABLE GENERATED_PROTO_SRCS)
list(TRANSFORM GENERATED_PROTO_SRCS PREPEND "${PROJECT_BINARY_DIR}/")

foreach(PROTO_SRC ${PROTO_SRCS})
    get_filename_component(PROTO_NAME ${PROTO_SRC} NAME)
    set(target_name "gen_${PROTO_NAME}_proto")
    set(proto_cc "${PROJECT_BINARY_DIR}/${PROTO_SRC}.pb.cc")
    set(proto_h "${PROJECT_BINARY_DIR}/${PROTO_SRC}.pb.h")

    add_custom_command(
        OUTPUT "${proto_cc}" "${proto_h}"
        COMMAND ${PROTOC_EXECUTABLE} --cpp_out=${PROJECT_BINARY_DIR} "${PROTO_SRC}.proto"
        DEPENDS "${MOZC_SRC_DIR}/${PROTO_SRC}.proto"
        WORKING_DIRECTORY ${MOZC_SRC_DIR}
        COMMENT "Generating ${PROTO_SRC}.pb.cc and ${PROTO_SRC}.pb.h"
    )
    add_custom_target(${target_name} DEPENDS "${proto_cc}" "${proto_h}")
    add_dependencies(${target_name} protoc)
    add_dependencies(gen ${target_name})
endforeach()