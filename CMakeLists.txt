cmake_minimum_required(VERSION 3.3)

# Project definition

project(DeveloperDocumentationForOpenCOR
    LANGUAGES NONE
)

# Make sure that Sphinx is available

list(APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_SOURCE_DIR}/cmake")

find_package(Sphinx REQUIRED)

# Build the developer documentation for OpenCOR

string(TIMESTAMP SPHINX_YEAR "%Y")

configure_file("${CMAKE_CURRENT_SOURCE_DIR}/src/conf.py.in"
               "${CMAKE_CURRENT_BINARY_DIR}/conf.py"
               @ONLY)

add_custom_target(Sphinx ALL
                  ${SPHINX_EXECUTABLE} -q -b html
                                       -c "${CMAKE_CURRENT_BINARY_DIR}"
                                       -d "${CMAKE_CURRENT_BINARY_DIR}/doctrees"
                                       "${CMAKE_CURRENT_SOURCE_DIR}/src"
                                       "${CMAKE_CURRENT_BINARY_DIR}/html"
                  COMMENT "Building the developer documentation for OpenCOR")
