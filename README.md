<div align="center">

# WindBlazor

### Blazor components, powered by Tailwind CSS v4.

**Free and open source. Built for developers who want reusable components without giving up control of their markup and styling.**

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
| **Button** | Working foundation | Child content, `Class`, `Disabled`, `Type`, HTML attributes and Blazor event handlers |
| **Interactive website** | Preview | Blazor WebAssembly website with Button examples and an introductory tutorial |
| **Docs playground** | Working foundation | Separate Blazor Web App (Interactive Server) for component development |
| **Pre-styled component variants / theme API** | Planned | Not part of the current public Button API |
| **NuGet distribution** | Not published | Reference the library project from source for now |

The current **public Button API uses `Class`**, not `Css`. Default color, padding, and component variants are **not implemented yet**. The library deliberately does not present unfinished styling as a finished component.

## Why WindBlazor?

**Because a UI component should save you work without taking ownership of your design.**

Blazor developers have good choices already: mature component suites, copy-and-paste Tailwind markup, and commercial UI kits. WindBlazor is exploring a space between those options: **reusable Razor components with Tailwind CSS v4 as the styling language**, instead of another all-encompassing visual system.

The goal is simple: get the convenience of writing `<Button>` instead of rebuilding the same behavior everywhere, while keeping the ability to decide how that button looks.

### The vision: Bootstrap-like ease, Tailwind-level freedom

WindBlazor is meant to answer a practical frustration: **why should a Blazor developer have to choose between components that look finished and components they can style freely?**

Once Tailwind is configured in the application, the **long-term target** is:

- **Great defaults without repetitive styling:** write `<Button>Save</Button>` and get a thoughtfully styled control, not a bare browser button. This is the Bootstrap-like convenience we're aiming for.
- **Real customization without fighting the library:** use a component-level Tailwind styling hook when the default isn't right. Your design shouldn't require forking the component.
- **Consistent, reusable behavior:** shared component semantics, keyboard/focus behavior, disabled states, and accessible patterns, rather than copying markup and hoping every instance stays in sync.
- **Free source, real examples:** learn from and contribute to the same Razor components demonstrated in the website, instead of buying a closed design bundle.

**That is a roadmap, not a shipped feature list.** Today's public `<Button>` has no built-in visual defaults; you currently supply `Class` utilities yourself. The planned `Css`/base-style model still needs implementation and verification, especially for conflicting Tailwind utilities. **Placing one class name later in an HTML `class` attribute does not guarantee it overrides another.**

### What are the benefits?

| Benefit | Why it matters |
| --- | --- |
| **Blazor-native building blocks** | Use Razor, `RenderFragment`, normal HTML attributes, and Blazor event handlers—not components wrapped around React or Vue. |
| **Your Tailwind utilities, your design** | The consuming application generates the CSS. You can build toward your own colors, spacing, and layouts rather than relying exclusively on a vendor-specific theme. |
| **Readable and inspectable source** | The components are in this repository. You can study the markup, contribute fixes, or adapt the source subject to the license. |
| **Explicit, reproducible CSS builds** | The Docs and Website builds use Tailwind v4's CSS-first input, explicit `@source` paths, and a standalone CLI. This is especially useful when class names live in a sibling Razor Class Library. |
| **No paid component subscription** | You can inspect and use the source under GPLv3 without purchasing a commercial UI kit. **The GPL's conditions still apply**; see below. |
| **Examples that use the real library** | The public WebAssembly website references the same WindBlazor project instead of rendering fake lookalike examples. |

**Important distinction:** these describe the project's design direction and current technical foundations. The public Button component is still a basic shell, **not** a polished pre-styled control with built-in variants.

### WindBlazor vs. other approaches

There isn't a universal winner; the better choice depends on what you're building.

| Your priority | Consider | Trade-off |
| --- | --- | --- |
| **A complete, stable UI suite now** | An established Blazor component library | You get more mature components and support today; you may need to work within its styling and API conventions. **WindBlazor cannot match that feature set yet.** |
| **Total markup control with almost no abstraction** | Plain Razor/HTML + Tailwind CSS | Maximum flexibility, but you implement and maintain each reusable interaction and pattern yourself. |
| **Ready-made page and component designs** | A template or commercial UI kit | Faster visual starting point; check its pricing, license, framework compatibility, and how much markup you must integrate manually. |
| **Blazor component reuse with Tailwind-first customization** | **WindBlazor's intended niche** | Promising if you want to help shape a small open-source library, but currently an early preview with real setup and maturity costs. |

In other words, **WindBlazor is not claiming to be better than MudBlazor, Fluent UI, Radzen, or other established libraries at everything**. If you need a complex production DataGrid, date picker, accessibility-tested component catalog, or long-term API stability today, those established options are more practical.

### What's the catch?

No hidden premium tier or paid unlock is being advertised. The trade-offs are technical **and** legal:

1. **It's early, not feature-complete.** The public repository currently has a basic Button. Pre-styled variants, a full component catalog, and a theme API are not shipped. The current Button uses `Class`, not the proposed `Css` API; expect breaking changes as the project evolves.
2. **Tailwind setup is yours to maintain.** WindBlazor doesn't ship a magical stylesheet that knows every utility you'll use. The consuming app must build its CSS and include both application and library sources. Explicit `@source` configuration makes this intentional and auditable, but it is still extra setup. See [Tailwind's source detection documentation](https://tailwindcss.com/docs/detecting-classes-in-source-files).
3. **GPLv3 is copyleft, not permissive like MIT.** WindBlazor is free of charge, but **distributing an application that incorporates GPL-covered library code may require you to license the combined work under GPL-compatible terms and provide corresponding source code**. This can make it unsuitable for some closed-source commercial products. Don't assume “free” means unrestricted proprietary redistribution. Review [LICENSE.txt](LICENSE.txt) and the [GNU GPL FAQ](https://www.gnu.org/licenses/gpl-faq.en.html) before adopting it; seek legal advice for your specific distribution model.
4. **No official NuGet package or compatibility guarantee yet.** At present, reference the source project. The project is also not claiming comprehensive accessibility coverage, cross-browser certification, formal support SLAs, or performance wins over other libraries.

If you need a mature plug-and-play control suite or an unambiguously permissive dependency for a proprietary distributable, **WindBlazor is probably not the right choice today**.

### Why is it built this way?

- **Why a Razor Class Library?** So an actual Blazor application can reuse components without copying and pasting every implementation. The library is independent of either documentation host.
- **Why Tailwind v4 rather than another custom theme framework?** It offers a common utility vocabulary for shaping a design in the consuming app. WindBlazor aims to complement that system, not compete with it. It also means you must understand the CSS build pipeline.
- **Why explicit scanning and an input/output watcher?** Class names in a library can be missed by automatic source detection. Explicit sources reduce ambiguity; explicit `-i`, `-o`, and `--watch` make local generation easy to reproduce. They are separate concerns: the CLI flags define the pipeline, while `@source` defines what Tailwind scans.
- **Why two docs projects?** `WindBlazor.Docs` is a Blazor Web App with Interactive Server support for local experimentation. `WindBlazor.Website` is a standalone Blazor WebAssembly site that GitHub Pages can host as static files.
- **Why start with just Button?** Better to establish component conventions, accessibility expectations, styling behavior, and build verification with one small component than publish dozens of unfinished wrappers.

**Who is it for right now?** Blazor/Tailwind developers who enjoy open-source experimentation, want to contribute a component library, or are building prototypes where the current limitations and license fit. As components gain solid defaults and tests, the aim is to make WindBlazor useful to more everyday applications.

---

## Quick start

### 1. Clone and build

You need the **.NET 8 SDK**.

```sh
git clone https://github.com/Rayeen13/WindBlazor.git
cd WindBlazor
dotnet build WindBlazor.sln
```

Until a NuGet package exists, consume WindBlazor through a project reference:

```xml
<ItemGroup>
  <ProjectReference Include="..\WindBlazor\WindBlazor.csproj" />
</ItemGroup>
```

Adjust the relative path to suit your solution.

### 2. Import the component namespace

Add to your Blazor application's `_Imports.razor`:

```razor
@using WindBlazor.Components.Button
```

### 3. Configure Tailwind CSS v4

Install or make the **standalone Tailwind CSS v4 CLI** available as `tailwindcss`.

For a consuming Blazor Web App with the same folder layout as `WindBlazor.Docs`, create `wwwroot/css/tailwind.css`:

```css
@import "tailwindcss" source(none);

/* Relative to this CSS input file. Adjust for your own solution. */
@source "../../Components";
@source "../../../WindBlazor/Components";
```

Use explicit input and output paths:

```sh
tailwindcss -i ./wwwroot/css/tailwind.css -o ./wwwroot/css/app.css --watch
```

Run this command from your **consuming app's project folder**, and load the generated file in the app's HTML host (for a Blazor Web App, the HTML section of `Components/App.razor`):

```html
<link rel="stylesheet" href="css/app.css" />
```

> Tailwind utility generation is the responsibility of the **consuming app**. The example `@source` paths match the checked-in Docs layout; don't copy them unchanged into a different directory structure.

### 4. Use your first component

```razor
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
```

The current Button renders a native HTML `<button>`. The `Class` parameter accepts Tailwind utilities; `Disabled` and `Type` map to native attributes, and other HTML attributes/events can be forwarded.

## Explore the projects

```text
WindBlazor/
├── WindBlazor/           # Razor Class Library
├── WindBlazor.Docs/      # Interactive Server component playground
├── WindBlazor.Website/   # Standalone WebAssembly documentation website
├── .github/workflows/    # CSS builds, validation, Pages deployment
└── WindBlazor.sln
```

**Website preview — Blazor WebAssembly**

```sh
cd WindBlazor.Website
./tailwindcsswatch.sh
```

In another terminal at the repository root:

```sh
dotnet run --project WindBlazor.Website/WindBlazor.Website.csproj
```

Or set **WindBlazor.Website** as the startup project in Visual Studio. Run the Tailwind watcher in Git Bash on Windows.

**Server playground — Blazor Web App**

```sh
cd WindBlazor.Docs
./tailwindcsswatch.sh
```

In another terminal at the repository root:

```sh
dotnet run --project WindBlazor.Docs/WindBlazor.Docs.csproj
```

Both projects generate CSS from `wwwroot/css/tailwind.css`; the generated outputs are ignored by Git. The WebAssembly website is built for static hosting, while the server playground is not.

## Documentation and deployment

The [documentation website](https://rayeen13.github.io/WindBlazor/) includes a getting-started guide and live component examples. Its source is in [`WindBlazor.Website`](WindBlazor.Website).

GitHub Actions compiles Tailwind CSS, publishes Blazor WebAssembly, and deploys to GitHub Pages on changes to `master`. A second workflow checks the Blazor solution. View their latest results from the badges above.

## Contributing

Bug reports, examples, accessibility improvements, and focused PRs are welcome.

1. Check [open issues](https://github.com/Rayeen13/WindBlazor/issues) before duplicating work.
2. Create a branch for one focused change.
3. Keep component APIs small, use the current .NET and Tailwind setup, and update matching demos/docs.
4. Run `dotnet build WindBlazor.sln` and generate the relevant Tailwind CSS.
5. Open a pull request explaining what changed and how it was tested.

The project is intentionally incremental: **build one component well, validate it, then add the next.**

## License

WindBlazor is licensed under the **GNU General Public License v3.0**. See [LICENSE.txt](LICENSE.txt) for the full terms.

---

<div align="center">
  <strong>Build with Blazor. Style with Tailwind. Keep the control.</strong>
</div>
