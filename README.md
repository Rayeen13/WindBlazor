<div align="center">

# WindBlazor

### Blazor components, powered by Tailwind CSS v4.

**Free and open source. Built for developers who want ready-to-use components without giving up control of their markup and styling.**

[**Documentation**](https://rayeen13.github.io/WindBlazor/) · [**Component examples**](https://rayeen13.github.io/WindBlazor/components/button) · [**Getting started**](https://rayeen13.github.io/WindBlazor/getting-started) · [**Report an issue**](https://github.com/Rayeen13/WindBlazor/issues)

[![Docs build](https://github.com/Rayeen13/WindBlazor/actions/workflows/docs-build.yml/badge.svg)](https://github.com/Rayeen13/WindBlazor/actions/workflows/docs-build.yml)
[![Website build](https://github.com/Rayeen13/WindBlazor/actions/workflows/website.yml/badge.svg)](https://github.com/Rayeen13/WindBlazor/actions/workflows/website.yml)
![.NET 8](https://img.shields.io/badge/.NET-8-512BD4?logo=dotnet)
![Tailwind CSS v4](https://img.shields.io/badge/Tailwind%20CSS-v4-06B6D4?logo=tailwindcss)
[![GPL v3](https://img.shields.io/badge/license-GPL--3.0-blue)](LICENSE.txt)

</div>

---

> [!IMPORTANT]
> **Early development preview.** The component API and documentation are evolving. Only the features described as implemented below are in the public repository. WindBlazor has **not** published an official NuGet package.

## What is WindBlazor?

WindBlazor is a **Blazor Razor Class Library (RCL)** for building interfaces with **Tailwind CSS v4+**. The goal is to combine the convenience of reusable UI components with explicit, understandable styling.

- **Razor-first** — use familiar Blazor component syntax and event handlers.
- **Tailwind v4 CSS-first** — styles are generated in the consuming app.
- **Explicit source scanning** — no assumption that Tailwind automatically detects classes in an external component library.
- **No mandatory JavaScript framework** — the component library is Blazor, not a JavaScript UI wrapper.
- **Open development** — implementation, demo website, and build workflows live together in this repository.

### What's implemented?

| Area | Status | Details |
| --- | --- | --- |
| **Button** | Working foundation | Child content, \`Class\`, \`Disabled\`, \`Type\`, HTML attributes and Blazor event handlers |
| **Interactive website** | Preview | Blazor WebAssembly website with Button examples and an introductory tutorial |
| **Docs playground** | Working foundation | Separate Blazor Web App (Interactive Server) for component development |
| **Pre-styled component variants / theme API** | Planned | Not part of the current public Button API |
| **NuGet distribution** | Not published | Reference the library project from source for now |

The current **public Button API uses \`Class\`**, not \`Css\`. Default color, padding, and component variants are **not implemented yet**. The library deliberately does not present unfinished styling as a finished component.

## Quick start

### 1. Clone and build

You need the **.NET 8 SDK**.

\`\`\`sh
git clone https://github.com/Rayeen13/WindBlazor.git
cd WindBlazor
dotnet build WindBlazor.sln
\`\`\`

Until a NuGet package exists, consume WindBlazor through a project reference:

\`\`\`xml
<ItemGroup>
  <ProjectReference Include="..\WindBlazor\WindBlazor.csproj" />
</ItemGroup>
\`\`\`

Adjust the relative path to suit your solution.

### 2. Import the component namespace

Add to your Blazor application's \`_Imports.razor\`:

\`\`\`razor
@using WindBlazor.Components.Button
\`\`\`

### 3. Configure Tailwind CSS v4

Install or make the **standalone Tailwind CSS v4 CLI** available as \`tailwindcss\`.

For a consuming Blazor Web App with the same folder layout as \`WindBlazor.Docs\`, create \`wwwroot/css/tailwind.css\`:

\`\`\`css
@import "tailwindcss" source(none);

/* Relative to this CSS input file. Adjust for your own solution. */
@source "../../Components";
@source "../../../WindBlazor/Components";
\`\`\`

Use explicit input and output paths:

\`\`\`sh
tailwindcss -i ./wwwroot/css/tailwind.css -o ./wwwroot/css/app.css --watch
\`\`\`

Run this command from your **consuming app's project folder**, and load the generated file in the app's HTML host (for a Blazor Web App, the HTML section of \`Components/App.razor\`):

\`\`\`html
<link rel="stylesheet" href="css/app.css" />
\`\`\`

> Tailwind utility generation is the responsibility of the **consuming app**. The example \`@source\` paths match the checked-in Docs layout; don't copy them unchanged into a different directory structure.

### 4. Use your first component

\`\`\`razor
<Button Class="rounded-lg bg-sky-600 px-4 py-2 font-semibold text-white hover:bg-sky-500"
        @onclick="Save">
    Save changes
</Button>

<Button Class="rounded-lg bg-slate-300 px-4 py-2 text-slate-600"
        Disabled="true">
    Unavailable
</Button>

@code {
    private void Save()
    {
        // Handle the click.
    }
}
\`\`\`

The current Button renders a native HTML \`<button>\`. The \`Class\` parameter accepts Tailwind utilities; \`Disabled\` and \`Type\` map to native attributes, and other HTML attributes/events can be forwarded.

## Explore the projects

\`\`\`text
WindBlazor/
├── WindBlazor/           # Razor Class Library
├── WindBlazor.Docs/      # Interactive Server component playground
├── WindBlazor.Website/   # Standalone WebAssembly documentation website
├── .github/workflows/    # CSS builds, validation, Pages deployment
└── WindBlazor.sln
\`\`\`

**Website preview — Blazor WebAssembly**

\`\`\`sh
cd WindBlazor.Website
./tailwindcsswatch.sh
\`\`\`

In another terminal at the repository root:

\`\`\`sh
dotnet run --project WindBlazor.Website/WindBlazor.Website.csproj
\`\`\`

Or set **WindBlazor.Website** as the startup project in Visual Studio. Run the Tailwind watcher in Git Bash on Windows.

**Server playground — Blazor Web App**

\`\`\`sh
cd WindBlazor.Docs
./tailwindcsswatch.sh
\`\`\`

In another terminal at the repository root:

\`\`\`sh
dotnet run --project WindBlazor.Docs/WindBlazor.Docs.csproj
\`\`\`

Both projects generate CSS from \`wwwroot/css/tailwind.css\`; the generated outputs are ignored by Git. The WebAssembly website is built for static hosting, while the server playground is not.

## Documentation and deployment

The [documentation website](https://rayeen13.github.io/WindBlazor/) includes a getting-started guide and live component examples. Its source is in [\`WindBlazor.Website\`](WindBlazor.Website).

GitHub Actions compiles Tailwind CSS, publishes Blazor WebAssembly, and deploys to GitHub Pages on changes to \`master\`. A second workflow checks the Blazor solution. View their latest results from the badges above.

## Contributing

Bug reports, examples, accessibility improvements, and focused PRs are welcome.

1. Check [open issues](https://github.com/Rayeen13/WindBlazor/issues) before duplicating work.
2. Create a branch for one focused change.
3. Keep component APIs small, use the current .NET and Tailwind setup, and update matching demos/docs.
4. Run \`dotnet build WindBlazor.sln\` and generate the relevant Tailwind CSS.
5. Open a pull request explaining what changed and how it was tested.

The project is intentionally incremental: **build one component well, validate it, then add the next.**

## License

WindBlazor is licensed under the **GNU General Public License v3.0**. See [LICENSE.txt](LICENSE.txt) for the full terms.

---

<div align="center">
  <strong>Build with Blazor. Style with Tailwind. Keep the control.</strong>
</div>
