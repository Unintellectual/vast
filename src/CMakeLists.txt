add_executable(${PROJECT_NAME} main.cpp)

target_sources(${PROJECT_NAME}
    PRIVATE
    main.cpp
)

target_include_directories(${PROJECT_NAME}
    PRIVATE
    ${CMAKE_SOURCE_DIR}/includes
)

