add_library(SyscallExtractPass MODULE
    # List your source files here.
    pass.cpp
    graph_utility.cpp
    utility.cpp
    print_utility.cpp
    parse_utility.cpp
)

# Use C++11 to compile our pass (i.e., supply -std=c++11).
target_compile_features(SyscallExtractPass PRIVATE cxx_range_for cxx_auto_type)

# LLVM is (typically) built with no C++ RTTI. We need to match that.
set_target_properties(SyscallExtractPass PROPERTIES
    COMPILE_FLAGS "-fno-rtti"
)

find_package(jsoncpp REQUIRED)
target_link_libraries(SyscallExtractPass ${JSONCPP_LIBRARIES})
