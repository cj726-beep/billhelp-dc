@echo off
cd /d "%~dp0"
where node >nul 2>&1 || (echo Install Node.js 20 or newer from https://nodejs.org/ & pause & exit /b 1)
if not defined GEMINI_API_KEY set /p "GEMINI_API_KEY=Enter your Gemini API key: "
if not defined GEMINI_API_KEY (echo No key entered. & pause & exit /b 1)
echo Open http://localhost:3000 in your browser.
node server.mjs
pause
