# 🚀 RIRS Deployment Guide

## Quick Vercel Deployment

### Method 1: Vercel Dashboard (Recommended)

1. **Go to Vercel**: https://vercel.com/dashboard
2. **Import Project**: Click "New Project" → Import from GitHub
3. **Select Repository**: Choose `shresthpandey/rirs`
4. **Configure**:
   - Framework Preset: Next.js (auto-detected)
   - Root Directory: `./` (default)
   - Build Command: `npm run build` (auto-detected)
   - Output Directory: `.next` (auto-detected)
5. **Environment Variables** (Optional):
   ```
   NEXT_PUBLIC_API_URL=https://your-backend-url.com/api
   ```
6. **Deploy**: Click "Deploy" button

### Method 2: Vercel CLI

```bash
# Install Vercel CLI
npm install -g vercel

# Login to Vercel
vercel login

# Deploy
vercel --prod
```

## Environment Variables

Add these in Vercel dashboard under Settings → Environment Variables:

```bash
# Required for backend integration
NEXT_PUBLIC_API_URL=https://your-backend-url.com/api

# Optional for payments
NEXT_PUBLIC_STRIPE_PUBLISHABLE_KEY=pk_live_your_key
NEXT_PUBLIC_RAZORPAY_KEY_ID=rzp_live_your_key

# Optional for analytics
NEXT_PUBLIC_GOOGLE_ANALYTICS_ID=G-XXXXXXXXXX
```

## Custom Domain (Optional)

1. Go to Vercel Dashboard → Your Project → Settings → Domains
2. Add your domain: `rirs.com`
3. Configure DNS records as instructed
4. SSL certificate will be automatically provisioned

## Deployment Status

After deployment, your app will be available at:
- **Vercel URL**: `https://rirs.vercel.app`
- **Custom Domain**: `https://rirs.com` (if configured)

## Troubleshooting

### Build Errors
- Check build logs in Vercel dashboard
- Ensure all dependencies are in package.json
- Verify TypeScript compilation

### Environment Variables
- Variables must start with `NEXT_PUBLIC_` for client-side access
- Redeploy after adding new environment variables
- Check variable names for typos

### Performance
- Vercel automatically optimizes images and assets
- Enable analytics in Vercel dashboard for performance monitoring
- Use Vercel's built-in caching for better performance

## Success Metrics

After successful deployment:
- ✅ App loads without errors
- ✅ All pages are accessible
- ✅ Responsive design works on mobile
- ✅ Dark/light mode toggle functions
- ✅ Authentication forms are working
- ✅ Dashboard components render correctly

---

**Deployment completed! Your RIRS platform is now live! 🎉**