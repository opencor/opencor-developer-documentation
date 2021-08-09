cmake_minimum_required(VERSION 3.11)

# Project definition

project(DeveloperDocumentation
    LANGUAGES NONE
)

# Retrieve the theme repository

include(FetchContent)

set(SPHINX_THEME_DIR ${CMAKE_CURRENT_BINARY_DIR}/theme)

FetchContent_Declare(sphinx-theme
    GIT_REPOSITORY https://github.com/opencor/sphinx-theme
    SOURCE_DIR ${SPHINX_THEME_DIR}
)

FetchContent_Populate(sphinx-theme)

# Build the developer documentation for OpenCOR

include(${SPHINX_THEME_DIR}/cmake/common.cmake)

build_documentation(developer 49 133 155)

add_custom_command(TARGET Sphinx POST_BUILD
                   COMMAND ${PYTHON_EXECUTABLE} "${CMAKE_CURRENT_BINARY_DIR}/theme/cmake/appendfile.py"
                                                "${CMAKE_CURRENT_BINARY_DIR}/html/_static/theme.css"
                                                "${CMAKE_CURRENT_SOURCE_DIR}/styles/opencor.css")
