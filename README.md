# morgane-latouche.fr

Rails static site using Parklife for static generation.

## Development

```bash
bin/setup     # Install dependencies
bin/dev       # Start server at localhost:3000
```

## Build

```bash
bin/static-build                    # Build static site to ./build
bin/static-build --base /subpath    # Build with custom base URL
```

## Deployment

Push to `main` triggers GitHub Pages deployment via `parklife.yml` workflow.
