start /i /wait build_x86.bat
if "%errorlevel%" == "1" (
	goto ERROR_END
)

start /i /wait build_x64.bat
if "%errorlevel%" == "1" (
	goto ERROR_END
)
start /i /wait build_x86_xp.bat
if "%errorlevel%" == "1" (
	goto ERROR_END
)

start /i /wait build_x64_xp.bat
if "%errorlevel%" == "1" (
	goto ERROR_END
)

goto END

:ERROR_END

:END