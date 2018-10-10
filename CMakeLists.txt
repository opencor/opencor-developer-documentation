cmake_minimum_required(VERSION 3.11)

# Project definition

project(DeveloperDocumentation
    LANGUAGES NONE
)

# Some in-house CMake macros

include(${CMAKE_SOURCE_DIR}/cmake/common.cmake)

# Build the developer documentation for OpenCOR

build_documentation(developer 49 133 155)
