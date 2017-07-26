@echo off
set VISUAL_STUDIO_2017_ROOT=c:\Program Files (x86)\Microsoft Visual Studio\2017\Enterprise
set THIS_SOURCES_ROOT=%CD%

pushd .
call "%VISUAL_STUDIO_2017_ROOT%\Common7\Tools\VsDevCmd.bat" -host_arch=amd64 -arch=x86 || exit /B %errorlevel%
popd

"%VISUAL_STUDIO_2017_ROOT%\MSBuild\15.0\Bin\MSBuild.exe" /m /target:Rebuild /property:Configuration=xp_release_static_mt;Platform=Win32 /fileLogger /fileLoggerParameters:LogFile=Foundation\msbuildReleaseNativeX86.log;Verbosity=diagnostic;Encoding=UTF-8 Foundation\Foundation_vs140.vcxproj
if "%errorlevel%" == "1" (
	goto ERROR_END
)

"%VISUAL_STUDIO_2017_ROOT%\MSBuild\15.0\Bin\MSBuild.exe" /m /target:Rebuild /property:Configuration=xp_release_static_mt;Platform=Win32 /fileLogger /fileLoggerParameters:LogFile=Util\msbuildReleaseNativeX86.log;Verbosity=diagnostic;Encoding=UTF-8 Util\Util_vs140.vcxproj
if "%errorlevel%" == "1" (
	goto ERROR_END
)

"%VISUAL_STUDIO_2017_ROOT%\MSBuild\15.0\Bin\MSBuild.exe" /m /target:Rebuild /property:Configuration=xp_release_static_mt;Platform=Win32 /fileLogger /fileLoggerParameters:LogFile=XML\msbuildReleaseNativeX86.log;Verbosity=diagnostic;Encoding=UTF-8 XML\XML_vs140.vcxproj
if "%errorlevel%" == "1" (
	goto ERROR_END
)

"%VISUAL_STUDIO_2017_ROOT%\MSBuild\15.0\Bin\MSBuild.exe" /m /target:Rebuild /property:Configuration=xp_release_static_mt;Platform=Win32 /fileLogger /fileLoggerParameters:LogFile=JSON\msbuildReleaseNativeX86.log;Verbosity=diagnostic;Encoding=UTF-8 JSON\JSON_vs140.vcxproj
if "%errorlevel%" == "1" (
	goto ERROR_END
)

"%VISUAL_STUDIO_2017_ROOT%\MSBuild\15.0\Bin\MSBuild.exe" /m /target:Rebuild /property:Configuration=xp_release_static_mt;Platform=Win32 /fileLogger /fileLoggerParameters:LogFile=Crypto\msbuildReleaseNativeX86.log;Verbosity=diagnostic;Encoding=UTF-8 Crypto\Crypto_vs140.vcxproj
if "%errorlevel%" == "1" (
	goto ERROR_END
)

"%VISUAL_STUDIO_2017_ROOT%\MSBuild\15.0\Bin\MSBuild.exe" /m /target:Rebuild /property:Configuration=xp_release_static_mt;Platform=Win32 /fileLogger /fileLoggerParameters:LogFile=Net\msbuildReleaseNativeX86.log;Verbosity=diagnostic;Encoding=UTF-8 Net\Net_vs140.vcxproj
if "%errorlevel%" == "1" (
	goto ERROR_END
)

"%VISUAL_STUDIO_2017_ROOT%\MSBuild\15.0\Bin\MSBuild.exe" /m /target:Rebuild /property:Configuration=xp_release_static_mt;Platform=Win32 /fileLogger /fileLoggerParameters:LogFile=NetSSL_OpenSSL\msbuildReleaseNativeX86.log;Verbosity=diagnostic;Encoding=UTF-8 NetSSL_OpenSSL\NetSSL_OpenSSL_vs140.vcxproj
if "%errorlevel%" == "1" (
	goto ERROR_END
)


if not exist lib32_vc14xp mkdir lib32_vc14.1xp
copy /Y lib\PocoFoundationmt.lib lib32_vc14.1xp
copy /Y lib\PocoUtilmt.lib lib32_vc14.1xp
copy /Y lib\PocoXMLmt.lib lib32_vc14.1xp
copy /Y lib\PocoJSONmt.lib lib32_vc14.1xp
copy /Y lib\PocoCryptomt.lib lib32_vc14.1xp
copy /Y lib\PocoNetmt.lib lib32_vc14.1xp
copy /Y lib\PocoNetSSLmt.lib lib32_vc14.1xp


goto END

:ERROR_END
exit 1

:END
exit 0
