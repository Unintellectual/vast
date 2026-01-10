# Parent project does not export its library target, so this CML implicitly
# depends on being added from it, i.e. the testing is done only from the build
# tree and is not feasible from an install location

project(vastTests LANGUAGES CXX)

# ---- Tests ----

add_executable(vast_test source/vast_test.cpp)
target_link_libraries(vast_test PRIVATE vast_lib)
target_compile_features(vast_test PRIVATE cxx_std_20)

add_test(NAME vast_test COMMAND vast_test)

# ---- End-of-file commands ----

add_folders(Test)
