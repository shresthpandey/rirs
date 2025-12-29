@echo off
echo.
echo 🚀 RIRS Vercel Deployment Script
echo =================================
echo.

REM Check if package.json exists
if not exist "package.json" (
    echo ❌ Error: package.json not found. Please run this script from the project root.
    pause
    exit /b 1
)

echo 📋 Step 1: Installing dependencies...
call npm install
if errorlevel 1 (
    echo ❌ Error: npm install failed
    pause
    exit /b 1
)

echo.
echo 📋 Step 2: Running build test...
call npm run build
if errorlevel 1 (
    echo ❌ Error: Build failed. Please fix the errors above.
    pause
    exit /b 1
)

echo ✅ Build successful!
echo.

echo 📋 Step 3: Setting up Git remote...
git remote remove origin 2>nul
git remote add origin https://github.com/shresthpandey/rirs.git

echo.
echo 📋 Step 4: Pushing to GitHub...
git add .
git commit -m "Deploy: Clean RIRS build ready for Vercel" 2>nul
git push -u origin main --force

if errorlevel 1 (
    echo ❌ Error: Git push failed. Please check your GitHub permissions.
    echo 💡 Manual steps:
    echo    1. Go to https://github.com/shresthpandey/rirs
    echo    2. Make sure the repository exists and you have write access
    echo    3. Try running: git push -u origin main --force
    pause
    exit /b 1
)

echo ✅ Code pushed to GitHub successfully!
echo.

echo 📋 VERCEL DEPLOYMENT INSTRUCTIONS
echo ==================================
echo.
echo 🎯 AUTOMATIC DEPLOYMENT:
echo 1. Go to: https://vercel.com/dashboard
echo 2. Click 'New Project'
echo 3. Import from GitHub: shresthpandey/rirs
echo 4. Framework: Next.js (auto-detected)
echo 5. Click 'Deploy'
echo.
echo 🔧 OPTIONAL ENVIRONMENT VARIABLES:
echo Add in Vercel Dashboard ^> Settings ^> Environment Variables:
echo    NEXT_PUBLIC_API_URL=https://your-backend-url.com/api
echo.
echo 🎉 DEPLOYMENT COMPLETE!
echo Your app will be available at: https://rirs.vercel.app
echo.

pause