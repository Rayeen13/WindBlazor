# WindBlazor Website

A standalone Blazor WebAssembly documentation website, using the real WindBlazor RCL.

The existing `WindBlazor.Docs` Interactive Server playground is intentionally preserved separately.

## Local development

Requires .NET 8 SDK and standalone Tailwind CSS v4.1+ CLI on PATH.

From `WindBlazor.Website`, run `./tailwindcsswatch.sh` in Git Bash. Start `WindBlazor.Website` as the startup project in Visual Studio, or run `dotnet run --project WindBlazor.Website/WindBlazor.Website.csproj` from repository root.

## GitHub Pages

The website is prepared for `https://rayeen13.github.io/WindBlazor/` after successful deployment.

The `.github/workflows/website.yml` workflow builds and uploads a preview artifact on feature branches/PRs, and deploys only from `master`.

Configure **Settings → Pages → Build and deployment → Source: GitHub Actions** when eligible. GitHub Free requires a public repository for GitHub Pages; supported paid plans allow private repositories. Do not change repository visibility without explicit approval.

Generated `wwwroot/css/site.css` is ignored by Git and compiled in CI. The Pages artifact includes `.nojekyll` for Blazor's `_framework` assets and a `404.html` SPA routing fallback.

The GitHub Button currently has `Class`, not the local `Css`/BaseCss changes. Documentation intentionally matches the remote API.
