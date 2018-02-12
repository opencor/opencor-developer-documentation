@ECHO OFF

SETLOCAL ENABLEDELAYEDEXPANSION

FOR %%X IN (ninja.exe) DO (
    SET NinjaFound=%%~$PATH:X
)

IF DEFINED NinjaFound (
    SET Generator=Ninja
) ELSE (
    SET Generator=JOM
)

TITLE Making the developer documentation for OpenCOR (using !Generator!)...

CALL "C:\Program Files (x86)\Microsoft Visual Studio 14.0\VC\bin\amd64\vcvars64.bat"

CD build

IF DEFINED NinjaFound (
    SET CMakeGenerator=Ninja
) ELSE (
    SET CMakeGenerator=NMake Makefiles JOM
)

cmake -G "!CMakeGenerator!" ..

SET ExitCode=!ERRORLEVEL!

IF !ExitCode! EQU 0 (
    FOR /F "TOKENS=1,* DELIMS= " %%X IN ("%*") DO (
        SET Args=%%Y
    )

    IF DEFINED NinjaFound (
        ninja !Args!

        SET ExitCode=!ERRORLEVEL!
    ) ELSE (
        jom !Args!

        SET ExitCode=!ERRORLEVEL!
    )
)

CD ..

EXIT /B !ExitCode!
