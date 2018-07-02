cmake_minimum_required(VERSION 3.11)

# Project definition

project(DeveloperDocumentationForOpenCOR
    LANGUAGES NONE
)

# Make sure that Sphinx is available and that it is at least version 1.4

list(APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_SOURCE_DIR}/cmake")

find_package(Sphinx REQUIRED)

if(APPLE)
    execute_process(COMMAND "${SPHINX_EXECUTABLE}" --version
                    OUTPUT_VARIABLE SPHINX_VERSION
                    OUTPUT_STRIP_TRAILING_WHITESPACE)
else()
    execute_process(COMMAND "${SPHINX_EXECUTABLE}" --version
                    ERROR_VARIABLE SPHINX_VERSION
                    ERROR_STRIP_TRAILING_WHITESPACE)
endif()

string(REGEX REPLACE "^.* " ""
       SPHINX_VERSION "${SPHINX_VERSION}")

if(SPHINX_VERSION VERSION_LESS 1.4)
    message(FATAL_ERROR "Sphinx 1.4 or later is required...")
endif()

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
