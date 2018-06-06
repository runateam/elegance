# Elegance - Postmanerator theme by Runateam

<div align="center">
<img src="https://raw.githubusercontent.com/runateam/elegance/preview/preview.png" alt="Elegance preview" />
</div>

> Elegance is beauty that shows unusual effectiveness and simplicity. It is frequently used as a standard of tastefulness particularly in the areas of visual design, decoration, the sciences, and the aesthetics of mathematics.

# About
Elegance is a free flexible theme for Postmanerator built on Bootstrap framework created by Runateam.

Used components:
- Bootstrap 3
- jQuery 2
- highlight.js

# Usage

Download theme from repository
```
$ postmanerator themes get https://github.com/runateam/elegance.git
```

Confirm that it is available on your local machine
```
$ postmanerator themes list
elegance
default
```

Generate documentation
```
$ postmanerator -collection=main.postman_collection.json \
> -environment=local.postman_environment.json \
> -theme=elegance -output=./build/index.html
```

You can add your own logo in the generated documentation, just copy the `logo.png` file to the directory with the generated documentation (next to the `index.html`).

# License

MIT License

Copyright (c) 2018 Runateam
