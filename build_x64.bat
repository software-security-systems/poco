@echo off
set VISUAL_STUDIO_2017_ROOT=c:\Program Files (x86)\Microsoft Visual Studio\2017\Enterprise
set THIS_SOURCES_ROOT=%CD%

pushd .
call "%VISUAL_STUDIO_2017_ROOT%\Common7\Tools\VsDevCmd.bat" -host_arch=amd64 -arch=amd64 || exit /B %errorlevel%
popd

"%VISUAL_STUDIO_2017_ROOT%\MSBuild\15.0\Bin\MSBuild.exe" /m /target:Rebuild /property:Configuration=release_static_mt;Platform=x64 /fileLogger /fileLoggerParameters:LogFile=Foundation\msbuildReleaseNativeX64.log;Verbosity=diagnostic;Encoding=UTF-8 Foundation\Foundation_x64_vs140.vcxproj
if "%errorlevel%" == "1" (
	goto ERROR_END
)

"%VISUAL_STUDIO_2017_ROOT%\MSBuild\15.0\Bin\MSBuild.exe" /m /target:Rebuild /property:Configuration=release_static_mt;Platform=x64 /fileLogger /fileLoggerParameters:LogFile=Util\msbuildReleaseNativeX64.log;Verbosity=diagnostic;Encoding=UTF-8 Util\Util_x64_vs140.vcxproj
if "%errorlevel%" == "1" (
	goto ERROR_END
)

"%VISUAL_STUDIO_2017_ROOT%\MSBuild\15.0\Bin\MSBuild.exe" /m /target:Rebuild /property:Configuration=release_static_mt;Platform=x64 /fileLogger /fileLoggerParameters:LogFile=XML\msbuildReleaseNativeX64.log;Verbosity=diagnostic;Encoding=UTF-8 XML\XML_x64_vs140.vcxproj
if "%errorlevel%" == "1" (
	goto ERROR_END
)

"%VISUAL_STUDIO_2017_ROOT%\MSBuild\15.0\Bin\MSBuild.exe" /m /target:Rebuild /property:Configuration=release_static_mt;Platform=x64 /fileLogger /fileLoggerParameters:LogFile=JSON\msbuildReleaseNativeX64.log;Verbosity=diagnostic;Encoding=UTF-8 JSON\JSON_x64_vs140.vcxproj
if "%errorlevel%" == "1" (
	goto ERROR_END
)

"%VISUAL_STUDIO_2017_ROOT%\MSBuild\15.0\Bin\MSBuild.exe" /m /target:Rebuild /property:Configuration=release_static_mt;Platform=x64 /fileLogger /fileLoggerParameters:LogFile=Crypto\msbuildReleaseNativeX64.log;Verbosity=diagnostic;Encoding=UTF-8 Crypto\Crypto_x64_vs140.vcxproj
if "%errorlevel%" == "1" (
	goto ERROR_END
)

"%VISUAL_STUDIO_2017_ROOT%\MSBuild\15.0\Bin\MSBuild.exe" /m /target:Rebuild /property:Configuration=release_static_mt;Platform=x64 /fileLogger /fileLoggerParameters:LogFile=Net\msbuildReleaseNativeX64.log;Verbosity=diagnostic;Encoding=UTF-8 Net\Net_x64_vs140.vcxproj
if "%errorlevel%" == "1" (
	goto ERROR_END
)

"%VISUAL_STUDIO_2017_ROOT%\MSBuild\15.0\Bin\MSBuild.exe" /m /target:Rebuild /property:Configuration=release_static_mt;Platform=x64 /fileLogger /fileLoggerParameters:LogFile=NetSSL_OpenSSL\msbuildReleaseNativeX64.log;Verbosity=diagnostic;Encoding=UTF-8 NetSSL_OpenSSL\NetSSL_OpenSSL_x64_vs140.vcxproj
if "%errorlevel%" == "1" (
	goto ERROR_END
)

if not exist lib64_vc14 mkdir lib64_vc14.1
copy /Y lib64\PocoFoundationmt.lib lib64_vc14.1
copy /Y lib64\PocoUtilmt.lib lib64_vc14.1
copy /Y lib64\PocoXMLmt.lib lib64_vc14.1
copy /Y lib64\PocoJSONmt.lib lib64_vc14.1
copy /Y lib64\PocoCryptomt.lib lib64_vc14.1
copy /Y lib64\PocoNetmt.lib lib64_vc14.1
copy /Y lib64\PocoNetSSLmt.lib lib64_vc14.1

goto END

:ERROR_END
exit 1

:END
exit 0
