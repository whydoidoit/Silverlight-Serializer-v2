@echo off

call "%VS100COMNTOOLS%vsvars32.bat"

msbuild.exe /ToolsVersion:4.0 "%~dp0Serialization/Serialization.csproj" /p:configuration=Release /p:outDir=bin/Release35/ /p:TargetFrameworkVersion=v3.5
msbuild.exe /ToolsVersion:4.0 "%~dp0Serialization/Serialization.csproj" /p:configuration=Release /p:outDir=bin/Release40/
msbuild.exe /ToolsVersion:4.0 "%~dp0Serialization.SL/Serialization.SL.csproj" /p:configuration=Release
msbuild.exe /ToolsVersion:4.0 "%~dp0Serialization.WP7/Serialization.WP7.csproj" /p:configuration=Release
msbuild.exe /ToolsVersion:4.0 "%~dp0Serialization.WP7/Serialization.WP7.csproj" /p:configuration=Release /p:TargetFrameworkProfile=WindowsPhone71 /p:outDir=bin/Release71/

if not exist "%~dp0Build/NuGet/lib/net20/" mkdir "%~dp0Build/NuGet/lib/net20/"
if not exist "%~dp0Build/NuGet/lib/net40/" mkdir "%~dp0Build/NuGet/lib/net40/"
if not exist "%~dp0Build/NuGet/lib/sl4/" mkdir "%~dp0Build/NuGet/lib/sl4/"
if not exist "%~dp0Build/NuGet/lib/sl3-wp/" mkdir "%~dp0Build/NuGet/lib/sl3-wp/"
if not exist "%~dp0Build/NuGet/lib/sl4-wp/" mkdir "%~dp0Build/NuGet/lib/sl4-wp/"
if not exist "%~dp0Build/NuGet/lib/sl4-windowsphone71/" mkdir "%~dp0Build/NuGet/lib/sl4-windowsphone71/"

copy "%~dp0Serialization\bin\Release35\Serialization.dll" "%~dp0Build\NuGet\lib\net20\Serialization.dll"
copy "%~dp0Serialization\bin\Release35\Serialization.dll" "%~dp0Build\NuGet\lib\net40\Serialization.dll"
copy "%~dp0Serialization.SL\bin\Release\Serialization.dll" "%~dp0Build\NuGet\lib\sl4\Serialization.dll"
copy "%~dp0Serialization.WP7\bin\Release\Serialization.dll" "%~dp0Build\NuGet\lib\sl3-wp\Serialization.dll"
copy "%~dp0Serialization.WP7\bin\Release\Serialization.dll" "%~dp0Build\NuGet\lib\sl4-wp\Serialization.dll"
copy "%~dp0Serialization.WP7\bin\Release71\Serialization.dll" "%~dp0Build\NuGet\lib\sl4-windowsphone71\Serialization.dll"

%~dp0Tools/NuGet.exe pack "%~dp0Build\SilverlightSerializer.NuSpec" -basePath "%~dp0Build/NuGet/" -outputDirectory "%~dp0Build/"

pause