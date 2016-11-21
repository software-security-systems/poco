start /i /wait build_dbg.bat
if "%errorlevel%" == "1" (
	goto ERROR_END
)

start /i /wait build.bat
if "%errorlevel%" == "1" (
	goto ERROR_END
)
start /i /wait build_xp_dbg.bat
if "%errorlevel%" == "1" (
	goto ERROR_END
)

start /i /wait build_xp.bat
if "%errorlevel%" == "1" (
	goto ERROR_END
)

goto END

:ERROR_END

:END