@ECHO OFF

TITLE Cleaning the developer documentation for OpenCOR...

SET CurrentPath=%CD%

CD %CurrentPath%\build

FOR /D %%I IN (*.*) DO RMDIR /S /Q "%%I"
FOR    %%I IN (*.*) DO DEL /Q "%%I"

CD %CurrentPath%\theme

FOR /D %%I IN (*.*) DO RMDIR /S /Q "%%I"
FOR    %%I IN (*.*) DO DEL /Q "%%I"

CD %CurrentPath%

RMDIR /S /Q theme
