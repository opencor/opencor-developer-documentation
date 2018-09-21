cmake_minimum_required(VERSION 3.11)

# Project definition

project(DeveloperDocumentation
    LANGUAGES NONE
)

# Make sure that Sphinx is available and that it is at least version 1.4

list(APPEND CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}/cmake")

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

# Retrieve the theme repository

include(FetchContent)

FetchContent_Declare(sphinx-theme
    GIT_REPOSITORY https://github.com/opencor/sphinx-theme
    SOURCE_DIR "${CMAKE_BINARY_DIR}/theme"
)

FetchContent_Populate(sphinx-theme)

# Build the developer documentation for OpenCOR

string(TIMESTAMP SPHINX_YEAR "%Y")

execute_process(COMMAND ${CMAKE_COMMAND} -E copy ${CMAKE_SOURCE_DIR}/src/conf.py
                                                 ${CMAKE_BINARY_DIR}/conf.py)

file(APPEND "${CMAKE_BINARY_DIR}/conf.py"
    \n
    copyright = u'2011-${SPHINX_YEAR}, University of Auckland'\n
    html_theme = 'theme'\n
    html_show_sphinx = False\n
    html_show_copyright = False\n
)

add_custom_target(Sphinx ALL
                  ${SPHINX_EXECUTABLE} -q -b html
                                       -c "${CMAKE_BINARY_DIR}"
                                       "${CMAKE_SOURCE_DIR}/src"
                                       "${CMAKE_BINARY_DIR}/html"
                  COMMENT "Building the developer documentation for OpenCOR")
