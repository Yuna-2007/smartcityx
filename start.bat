@echo off
setlocal enabledelayedexpansion
title SmartCityX - Integrated Smart-City Analytics Platform

:: Locate JDK
set "JAVA_CMD=java"
set "JAVAC_CMD=javac"

if exist "C:\Program Files\Android\Android Studio\jbr\bin\javac.exe" (
    set "JAVAC_CMD=C:\Program Files\Android\Android Studio\jbr\bin\javac.exe"
    set "JAVA_CMD=C:\Program Files\Android\Android Studio\jbr\bin\java.exe"
)

:: Auto-compile if bin is missing or out of date
if not exist bin mkdir bin

dir /s /b src\*.java > sources.txt
"!JAVAC_CMD!" -d bin -sourcepath src @sources.txt 2>nul
del sources.txt 2>nul

cls
"!JAVA_CMD!" -cp bin Main %*
pause
