@echo off
set VISUAL_STUDIO_2014_ROOT=C:\Program Files (x86)\Microsoft Visual Studio 14.0
set THIS_SOURCES_ROOT=%CD%

pushd .
call "%VISUAL_STUDIO_2014_ROOT%\VC\vcvarsall.bat" x86_amd64 || exit /B %errorlevel%
popd

"C:\Program Files (x86)\MSBuild\14.0\bin\MSBuild.exe" /m /target:Rebuild /property:Configuration=debug_static_mt;Platform=Win32 /fileLogger /fileLoggerParameters:LogFile=Foundation\msbuildDebugNativeX86.log;Verbosity=diagnostic;Encoding=UTF-8 Foundation\Foundation_vs140.vcxproj
if "%errorlevel%" == "1" (
	goto ERROR_END
)

"C:\Program Files (x86)\MSBuild\14.0\bin\MSBuild.exe" /m /target:Rebuild /property:Configuration=debug_static_mt;Platform=Win32 /fileLogger /fileLoggerParameters:LogFile=Util\msbuildDebugNativeX86.log;Verbosity=diagnostic;Encoding=UTF-8 Util\Util_vs140.vcxproj
if "%errorlevel%" == "1" (
	goto ERROR_END
)

"C:\Program Files (x86)\MSBuild\14.0\bin\MSBuild.exe" /m /target:Rebuild /property:Configuration=debug_static_mt;Platform=Win32 /fileLogger /fileLoggerParameters:LogFile=XML\msbuildDebugNativeX86.log;Verbosity=diagnostic;Encoding=UTF-8 XML\XML_vs140.vcxproj
if "%errorlevel%" == "1" (
 	goto ERROR_END
)

"C:\Program Files (x86)\MSBuild\14.0\bin\MSBuild.exe" /m /target:Rebuild /property:Configuration=debug_static_mt;Platform=Win32 /fileLogger /fileLoggerParameters:LogFile=JSON\msbuildDebugNativeX86.log;Verbosity=diagnostic;Encoding=UTF-8 JSON\JSON_vs140.vcxproj
if "%errorlevel%" == "1" (
	goto ERROR_END
)

"C:\Program Files (x86)\MSBuild\14.0\bin\MSBuild.exe" /m /target:Rebuild /property:Configuration=debug_static_mt;Platform=Win32 /fileLogger /fileLoggerParameters:LogFile=Crypto\msbuildDebugNativeX86.log;Verbosity=diagnostic;Encoding=UTF-8 Crypto\Crypto_vs140.vcxproj
if "%errorlevel%" == "1" (
	goto ERROR_END
)

"C:\Program Files (x86)\MSBuild\14.0\bin\MSBuild.exe" /m /target:Rebuild /property:Configuration=debug_static_mt;Platform=Win32 /fileLogger /fileLoggerParameters:LogFile=Net\msbuildDebugNativeX86.log;Verbosity=diagnostic;Encoding=UTF-8 Net\Net_vs140.vcxproj
if "%errorlevel%" == "1" (
	goto ERROR_END
)

"C:\Program Files (x86)\MSBuild\14.0\bin\MSBuild.exe" /m /target:Rebuild /property:Configuration=debug_static_mt;Platform=Win32 /fileLogger /fileLoggerParameters:LogFile=NetSSL_OpenSSL\msbuildDebugNativeX86.log;Verbosity=diagnostic;Encoding=UTF-8 NetSSL_OpenSSL\NetSSL_OpenSSL_vs140.vcxproj
if "%errorlevel%" == "1" (
	goto ERROR_END
)

rem "C:\Program Files (x86)\MSBuild\14.0\bin\MSBuild.exe" /m /target:Rebuild /property:Configuration=debug_static_mt;Platform=Win32 /fileLogger /fileLoggerParameters:LogFile=Data\msbuildDebugNativeX86.log;Verbosity=diagnostic;Encoding=UTF-8 Data\Data_vs140.vcxproj
rem if "%errorlevel%" == "1" (
rem 	goto ERROR_END
rem )

rem "C:\Program Files (x86)\MSBuild\14.0\bin\MSBuild.exe" /m /target:Rebuild /property:Configuration=debug_static_mt;Platform=Win32 /fileLogger /fileLoggerParameters:LogFile=Data\SQLite\msbuildDebugNativeX86.log;Verbosity=diagnostic;Encoding=UTF-8 Data\SQLite\SQLite_vs140.vcxproj
rem if "%errorlevel%" == "1" (
rem 	goto ERROR_END
rem )

if not exist lib32_vc14 mkdir lib32_vc14
copy /Y lib\PocoFoundationmtd.lib lib32_vc14
copy /Y lib\PocoUtilmtd.lib lib32_vc14
copy /Y lib\PocoXMLmtd.lib lib32_vc14
copy /Y lib\PocoJSONmtd.lib lib32_vc14
copy /Y lib\PocoCryptomtd.lib lib32_vc14
copy /Y lib\PocoNetmtd.lib lib32_vc14
copy /Y lib\PocoNetSSLmtd.lib lib32_vc14
rem copy /Y lib\PocoDatamtd.lib lib32_vc14
rem copy /Y lib\PocoDataSQLitemtd.lib lib32_vc14

"C:\Program Files (x86)\MSBuild\14.0\bin\MSBuild.exe" /m /target:Rebuild /property:Configuration=debug_static_mt;Platform=x64 /fileLogger /fileLoggerParameters:LogFile=Foundation\msbuildDebugNativeX64.log;Verbosity=diagnostic;Encoding=UTF-8 Foundation\Foundation_x64_vs140.vcxproj
if "%errorlevel%" == "1" (
	goto ERROR_END
)

"C:\Program Files (x86)\MSBuild\14.0\bin\MSBuild.exe" /m /target:Rebuild /property:Configuration=debug_static_mt;Platform=x64 /fileLogger /fileLoggerParameters:LogFile=Util\msbuildDebugNativeX64.log;Verbosity=diagnostic;Encoding=UTF-8 Util\Util_x64_vs140.vcxproj
if "%errorlevel%" == "1" (
	goto ERROR_END
)

"C:\Program Files (x86)\MSBuild\14.0\bin\MSBuild.exe" /m /target:Rebuild /property:Configuration=debug_static_mt;Platform=x64 /fileLogger /fileLoggerParameters:LogFile=XML\msbuildDebugNativeX64.log;Verbosity=diagnostic;Encoding=UTF-8 XML\XML_x64_vs140.vcxproj
if "%errorlevel%" == "1" (
 	goto ERROR_END
)

"C:\Program Files (x86)\MSBuild\14.0\bin\MSBuild.exe" /m /target:Rebuild /property:Configuration=debug_static_mt;Platform=x64 /fileLogger /fileLoggerParameters:LogFile=JSON\msbuildDebugNativeX64.log;Verbosity=diagnostic;Encoding=UTF-8 JSON\JSON_x64_vs140.vcxproj
if "%errorlevel%" == "1" (
 	goto ERROR_END
)

"C:\Program Files (x86)\MSBuild\14.0\bin\MSBuild.exe" /m /target:Rebuild /property:Configuration=debug_static_mt;Platform=x64 /fileLogger /fileLoggerParameters:LogFile=Crypto\msbuildDebugNativeX64.log;Verbosity=diagnostic;Encoding=UTF-8 Crypto\Crypto_x64_vs140.vcxproj
if "%errorlevel%" == "1" (
	goto ERROR_END
)

"C:\Program Files (x86)\MSBuild\14.0\bin\MSBuild.exe" /m /target:Rebuild /property:Configuration=debug_static_mt;Platform=x64 /fileLogger /fileLoggerParameters:LogFile=Net\msbuildDebugNativeX64.log;Verbosity=diagnostic;Encoding=UTF-8 Net\Net_x64_vs140.vcxproj
if "%errorlevel%" == "1" (
	goto ERROR_END
)

"C:\Program Files (x86)\MSBuild\14.0\bin\MSBuild.exe" /m /target:Rebuild /property:Configuration=debug_static_mt;Platform=x64 /fileLogger /fileLoggerParameters:LogFile=NetSSL_OpenSSL\msbuildDebugNativeX64.log;Verbosity=diagnostic;Encoding=UTF-8 NetSSL_OpenSSL\NetSSL_OpenSSL_x64_vs140.vcxproj
if "%errorlevel%" == "1" (
	goto ERROR_END
)

rem "C:\Program Files (x86)\MSBuild\14.0\bin\MSBuild.exe" /m /target:Rebuild /property:Configuration=debug_static_mt;Platform=x64 /fileLogger /fileLoggerParameters:LogFile=Data\msbuildDebugNativeX64.log;Verbosity=diagnostic;Encoding=UTF-8 Data\Data_x64_vs140.vcxproj
rem if "%errorlevel%" == "1" (
rem 	goto ERROR_END
rem )

rem "C:\Program Files (x86)\MSBuild\14.0\bin\MSBuild.exe" /m /target:Rebuild /property:Configuration=debug_static_mt;Platform=x64 /fileLogger /fileLoggerParameters:LogFile=Data\SQLite\msbuildDebugNativeX64.log;Verbosity=diagnostic;Encoding=UTF-8 Data\SQLite\SQLite_x64_vs140.vcxproj
rem if "%errorlevel%" == "1" (
rem 	goto ERROR_END
rem )

if not exist lib64_vc14 mkdir lib64_vc14
copy /Y lib64\PocoFoundationmtd.lib lib64_vc14
copy /Y lib64\PocoUtilmtd.lib lib64_vc14
copy /Y lib64\PocoXMLmtd.lib lib64_vc14
copy /Y lib64\PocoJSONmtd.lib lib64_vc14
copy /Y lib64\PocoCryptomtd.lib lib64_vc14
copy /Y lib64\PocoNetmtd.lib lib64_vc14
copy /Y lib64\PocoNetSSLmtd.lib lib64_vc14
rem copy /Y lib64\PocoDatamtd.lib lib64_vc14
rem copy /Y lib64\PocoDataSQLitemtd.lib lib64_vc14

goto END

:ERROR_END
exit 1

:END
exit 0
