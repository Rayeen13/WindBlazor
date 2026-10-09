# WindBlazor Docs playground

This is a **Blazor Web App (Interactive Server)** consumer of the WindBlazor Razor Class Library. It is not a standalone WebAssembly app and cannot be deployed to GitHub Pages unchanged.

## Run locally

Requirements:
- .NET 8 SDK
- Standalone Tailwind CSS v4 CLI accessible as `tailwindcss` on PATH (tested configuration targets v4.1.18)

From `WindBlazor.Docs/`:

1. In Git Bash, start `./tailwindcsswatch.sh` (or run `tailwindcss -i ./wwwroot/css/tailwind.css -o ./wwwroot/css/app.css --watch`).
2. In another terminal, run `dotnet run` (or start **WindBlazor.Docs** from Visual Studio).
3. Navigate to `/button`.

The Tailwind input is `wwwroot/css/tailwind.css`. It explicitly scans the Docs Razor files and the library's component source. The generated `wwwroot/css/app.css` is intentionally ignored by Git.

**Note:** GitHub's current `master` branch has the original Button API. A later Button API update on a different local branch must be integrated separately; this Docs cleanup intentionally does not alter that component.

## Site hosting

The current Docs project uses ASP.NET Core server rendering. GitHub Pages can host static files or a standalone Blazor WebAssembly application, **not this server project directly**. Publishing is a separate task after a hosting decision.
