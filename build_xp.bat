@echo off
set VISUAL_STUDIO_2014_ROOT=C:\Program Files (x86)\Microsoft Visual Studio 14.0
set THIS_SOURCES_ROOT=%CD%

pushd .
call "%VISUAL_STUDIO_2014_ROOT%\VC\vcvarsall.bat" x86_amd64 || exit /B %errorlevel%
popd

"C:\Program Files (x86)\MSBuild\14.0\bin\MSBuild.exe" /m /target:Rebuild /property:Configuration=xp_release_static_mt;Platform=Win32 /fileLogger /fileLoggerParameters:LogFile=Foundation\msbuildReleaseNativeX86.log;Verbosity=diagnostic;Encoding=UTF-8 Foundation\Foundation_vs140.vcxproj
if "%errorlevel%" == "1" (
	goto ERROR_END
)

"C:\Program Files (x86)\MSBuild\14.0\bin\MSBuild.exe" /m /target:Rebuild /property:Configuration=xp_release_static_mt;Platform=Win32 /fileLogger /fileLoggerParameters:LogFile=Util\msbuildReleaseNativeX86.log;Verbosity=diagnostic;Encoding=UTF-8 Util\Util_vs140.vcxproj
if "%errorlevel%" == "1" (
	goto ERROR_END
)

"C:\Program Files (x86)\MSBuild\14.0\bin\MSBuild.exe" /m /target:Rebuild /property:Configuration=xp_release_static_mt;Platform=Win32 /fileLogger /fileLoggerParameters:LogFile=XML\msbuildReleaseNativeX86.log;Verbosity=diagnostic;Encoding=UTF-8 XML\XML_vs140.vcxproj
if "%errorlevel%" == "1" (
	goto ERROR_END
)

"C:\Program Files (x86)\MSBuild\14.0\bin\MSBuild.exe" /m /target:Rebuild /property:Configuration=xp_release_static_mt;Platform=Win32 /fileLogger /fileLoggerParameters:LogFile=JSON\msbuildReleaseNativeX86.log;Verbosity=diagnostic;Encoding=UTF-8 JSON\JSON_vs140.vcxproj
if "%errorlevel%" == "1" (
	goto ERROR_END
)

"C:\Program Files (x86)\MSBuild\14.0\bin\MSBuild.exe" /m /target:Rebuild /property:Configuration=xp_release_static_mt;Platform=Win32 /fileLogger /fileLoggerParameters:LogFile=Crypto\msbuildReleaseNativeX86.log;Verbosity=diagnostic;Encoding=UTF-8 Crypto\Crypto_vs140.vcxproj
if "%errorlevel%" == "1" (
	goto ERROR_END
)

"C:\Program Files (x86)\MSBuild\14.0\bin\MSBuild.exe" /m /target:Rebuild /property:Configuration=xp_release_static_mt;Platform=Win32 /fileLogger /fileLoggerParameters:LogFile=Net\msbuildReleaseNativeX86.log;Verbosity=diagnostic;Encoding=UTF-8 Net\Net_vs140.vcxproj
if "%errorlevel%" == "1" (
	goto ERROR_END
)

"C:\Program Files (x86)\MSBuild\14.0\bin\MSBuild.exe" /m /target:Rebuild /property:Configuration=xp_release_static_mt;Platform=Win32 /fileLogger /fileLoggerParameters:LogFile=NetSSL_OpenSSL\msbuildReleaseNativeX86.log;Verbosity=diagnostic;Encoding=UTF-8 NetSSL_OpenSSL\NetSSL_OpenSSL_vs140.vcxproj
if "%errorlevel%" == "1" (
	goto ERROR_END
)

rem "C:\Program Files (x86)\MSBuild\14.0\bin\MSBuild.exe" /m /target:Rebuild /property:Configuration=xp_release_static_mt;Platform=Win32 /fileLogger /fileLoggerParameters:LogFile=Data\msbuildReleaseNativeX86.log;Verbosity=diagnostic;Encoding=UTF-8 Data\Data_vs140.vcxproj
rem if "%errorlevel%" == "1" (
rem 	goto ERROR_END
rem )

rem "C:\Program Files (x86)\MSBuild\14.0\bin\MSBuild.exe" /m /target:Rebuild /property:Configuration=xp_release_static_mt;Platform=Win32 /fileLogger /fileLoggerParameters:LogFile=Data\SQLite\msbuildReleaseNativeX86.log;Verbosity=diagnostic;Encoding=UTF-8 Data\SQLite\SQLite_vs140.vcxproj
rem if "%errorlevel%" == "1" (
rem 	goto ERROR_END
rem )

if not exist lib32_vc14xp mkdir lib32_vc14xp
copy /Y lib\PocoFoundationmt.lib lib32_vc14xp
copy /Y lib\PocoUtilmt.lib lib32_vc14xp
copy /Y lib\PocoXMLmt.lib lib32_vc14xp
copy /Y lib\PocoJSONmt.lib lib32_vc14xp
copy /Y lib\PocoCryptomt.lib lib32_vc14xp
copy /Y lib\PocoNetmt.lib lib32_vc14xp
copy /Y lib\PocoNetSSLmt.lib lib32_vc14xp
rem copy /Y lib\PocoDatamt.lib lib32_vc14xp
rem copy /Y lib\PocoDataSQLitemt.lib lib32_vc14xp


"C:\Program Files (x86)\MSBuild\14.0\bin\MSBuild.exe" /m /target:Rebuild /property:Configuration=xp_release_static_mt;Platform=x64 /fileLogger /fileLoggerParameters:LogFile=Foundation\msbuildReleaseNativeX64.log;Verbosity=diagnostic;Encoding=UTF-8 Foundation\Foundation_x64_vs140.vcxproj
if "%errorlevel%" == "1" (
	goto ERROR_END
)

"C:\Program Files (x86)\MSBuild\14.0\bin\MSBuild.exe" /m /target:Rebuild /property:Configuration=xp_release_static_mt;Platform=x64 /fileLogger /fileLoggerParameters:LogFile=Util\msbuildReleaseNativeX64.log;Verbosity=diagnostic;Encoding=UTF-8 Util\Util_x64_vs140.vcxproj
if "%errorlevel%" == "1" (
	goto ERROR_END
)

"C:\Program Files (x86)\MSBuild\14.0\bin\MSBuild.exe" /m /target:Rebuild /property:Configuration=xp_release_static_mt;Platform=x64 /fileLogger /fileLoggerParameters:LogFile=XML\msbuildReleaseNativeX64.log;Verbosity=diagnostic;Encoding=UTF-8 XML\XML_x64_vs140.vcxproj
if "%errorlevel%" == "1" (
	goto ERROR_END
)

"C:\Program Files (x86)\MSBuild\14.0\bin\MSBuild.exe" /m /target:Rebuild /property:Configuration=xp_release_static_mt;Platform=x64 /fileLogger /fileLoggerParameters:LogFile=JSON\msbuildReleaseNativeX64.log;Verbosity=diagnostic;Encoding=UTF-8 JSON\JSON_x64_vs140.vcxproj
if "%errorlevel%" == "1" (
	goto ERROR_END
)

"C:\Program Files (x86)\MSBuild\14.0\bin\MSBuild.exe" /m /target:Rebuild /property:Configuration=xp_release_static_mt;Platform=x64 /fileLogger /fileLoggerParameters:LogFile=Crypto\msbuildReleaseNativeX64.log;Verbosity=diagnostic;Encoding=UTF-8 Crypto\Crypto_x64_vs140.vcxproj
if "%errorlevel%" == "1" (
	goto ERROR_END
)

"C:\Program Files (x86)\MSBuild\14.0\bin\MSBuild.exe" /m /target:Rebuild /property:Configuration=xp_release_static_mt;Platform=x64 /fileLogger /fileLoggerParameters:LogFile=Net\msbuildReleaseNativeX64.log;Verbosity=diagnostic;Encoding=UTF-8 Net\Net_x64_vs140.vcxproj
if "%errorlevel%" == "1" (
	goto ERROR_END
)

"C:\Program Files (x86)\MSBuild\14.0\bin\MSBuild.exe" /m /target:Rebuild /property:Configuration=xp_release_static_mt;Platform=x64 /fileLogger /fileLoggerParameters:LogFile=NetSSL_OpenSSL\msbuildReleaseNativeX64.log;Verbosity=diagnostic;Encoding=UTF-8 NetSSL_OpenSSL\NetSSL_OpenSSL_x64_vs140.vcxproj
if "%errorlevel%" == "1" (
	goto ERROR_END
)

rem "C:\Program Files (x86)\MSBuild\14.0\bin\MSBuild.exe" /m /target:Rebuild /property:Configuration=xp_release_static_mt;Platform=x64 /fileLogger /fileLoggerParameters:LogFile=Data\msbuildReleaseNativeX64.log;Verbosity=diagnostic;Encoding=UTF-8 Data\Data_x64_vs140.vcxproj
rem if "%errorlevel%" == "1" (
rem 	goto ERROR_END
rem )

rem "C:\Program Files (x86)\MSBuild\14.0\bin\MSBuild.exe" /m /target:Rebuild /property:Configuration=xp_release_static_mt;Platform=x64 /fileLogger /fileLoggerParameters:LogFile=Data\SQLite\msbuildReleaseNativeX64.log;Verbosity=diagnostic;Encoding=UTF-8 Data\SQLite\SQLite_x64_vs140.vcxproj
rem if "%errorlevel%" == "1" (
rem 	goto ERROR_END
rem )

if not exist lib64_vc14xp mkdir lib64_vc14xp
copy /Y lib64\PocoFoundationmt.lib lib64_vc14xp
copy /Y lib64\PocoUtilmt.lib lib64_vc14xp
copy /Y lib64\PocoXMLmt.lib lib64_vc14xp
copy /Y lib64\PocoJSONmt.lib lib64_vc14xp
copy /Y lib64\PocoCryptomt.lib lib64_vc14xp
copy /Y lib64\PocoNetmt.lib lib64_vc14xp
copy /Y lib64\PocoNetSSLmt.lib lib64_vc14xp
rem copy /Y lib64\PocoDatamt.lib lib64_vc14xp
rem copy /Y lib64\PocoDataSQLitemt.lib lib64_vc14xp

goto END

:ERROR_END
exit 1

:END
exit 0
