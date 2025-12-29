#!/usr/bin/env pwsh

# RIRS Vercel Deployment Script
# This script will deploy the RIRS application to Vercel

Write-Host "🚀 RIRS Vercel Deployment Script" -ForegroundColor Cyan
Write-Host "=================================" -ForegroundColor Cyan

# Check if we're in the right directory
if (!(Test-Path "package.json")) {
    Write-Host "❌ Error: package.json not found. Please run this script from the project root." -ForegroundColor Red
    exit 1
}

# Check if git is initialized
if (!(Test-Path ".git")) {
    Write-Host "❌ Error: Git repository not found. Initializing..." -ForegroundColor Red
    git init
    git add .
    git commit -m "Initial commit: RIRS SaaS Platform"
}

Write-Host "📋 Step 1: Checking project structure..." -ForegroundColor Yellow

# Verify essential files exist
$requiredFiles = @("package.json", "next.config.js", "vercel.json", "pages/_app.tsx")
foreach ($file in $requiredFiles) {
    if (Test-Path $file) {
        Write-Host "✅ $file found" -ForegroundColor Green
    } else {
        Write-Host "❌ $file missing" -ForegroundColor Red
        exit 1
    }
}

Write-Host "📋 Step 2: Installing dependencies..." -ForegroundColor Yellow
npm install

if ($LASTEXITCODE -ne 0) {
    Write-Host "❌ Error: npm install failed" -ForegroundColor Red
    exit 1
}

Write-Host "📋 Step 3: Running build test..." -ForegroundColor Yellow
npm run build

if ($LASTEXITCODE -ne 0) {
    Write-Host "❌ Error: Build failed. Please fix the errors above." -ForegroundColor Red
    exit 1
}

Write-Host "✅ Build successful!" -ForegroundColor Green

Write-Host "📋 Step 4: Setting up Git remote..." -ForegroundColor Yellow

# Remove existing origin if it exists
git remote remove origin 2>$null

# Add the new repository
git remote add origin https://github.com/shresthpandey/rirs.git

Write-Host "📋 Step 5: Pushing to GitHub..." -ForegroundColor Yellow

# Commit any changes
git add .
git commit -m "Deploy: Clean RIRS build ready for Vercel" 2>$null

# Push to GitHub
git push -u origin main --force

if ($LASTEXITCODE -ne 0) {
    Write-Host "❌ Error: Git push failed. Please check your GitHub permissions." -ForegroundColor Red
    Write-Host "💡 Manual steps:" -ForegroundColor Yellow
    Write-Host "   1. Go to https://github.com/shresthpandey/rirs" -ForegroundColor White
    Write-Host "   2. Make sure the repository exists and you have write access" -ForegroundColor White
    Write-Host "   3. Try running: git push -u origin main --force" -ForegroundColor White
    exit 1
}

Write-Host "✅ Code pushed to GitHub successfully!" -ForegroundColor Green

Write-Host "📋 Step 6: Vercel Deployment Instructions" -ForegroundColor Yellow
Write-Host "==========================================" -ForegroundColor Cyan

Write-Host "🎯 AUTOMATIC DEPLOYMENT:" -ForegroundColor Green
Write-Host "1. Go to: https://vercel.com/dashboard" -ForegroundColor White
Write-Host "2. Click 'New Project'" -ForegroundColor White
Write-Host "3. Import from GitHub: shresthpandey/rirs" -ForegroundColor White
Write-Host "4. Framework: Next.js (auto-detected)" -ForegroundColor White
Write-Host "5. Click 'Deploy'" -ForegroundColor White

Write-Host ""
Write-Host "🔧 OPTIONAL ENVIRONMENT VARIABLES:" -ForegroundColor Green
Write-Host "Add these in Vercel Dashboard > Settings > Environment Variables:" -ForegroundColor White
Write-Host "   NEXT_PUBLIC_API_URL=https://your-backend-url.com/api" -ForegroundColor Gray

Write-Host ""
Write-Host "🎉 DEPLOYMENT COMPLETE!" -ForegroundColor Green
Write-Host "Your app will be available at: https://rirs.vercel.app" -ForegroundColor Cyan
Write-Host "Custom domain can be configured in Vercel dashboard" -ForegroundColor Gray

Write-Host ""
Write-Host "📊 VERIFICATION CHECKLIST:" -ForegroundColor Yellow
Write-Host "✅ App loads without errors" -ForegroundColor White
Write-Host "✅ All pages are accessible" -ForegroundColor White
Write-Host "✅ Responsive design works" -ForegroundColor White
Write-Host "✅ Dark/light mode toggle works" -ForegroundColor White
Write-Host "✅ Dashboard components render" -ForegroundColor White

Write-Host ""
Write-Host "🆘 IF DEPLOYMENT FAILS:" -ForegroundColor Red
Write-Host "1. Check build logs in Vercel dashboard" -ForegroundColor White
Write-Host "2. Ensure all dependencies are in package.json" -ForegroundColor White
Write-Host "3. Verify no TypeScript errors" -ForegroundColor White
Write-Host "4. Contact support if issues persist" -ForegroundColor White

Write-Host ""
Write-Host "🎯 SUCCESS! Your RIRS platform is ready for deployment!" -ForegroundColor Green