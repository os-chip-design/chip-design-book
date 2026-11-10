# Introduction to Chip Design
## Using Open-Source Tools

This eBook is an introduction to chip design for a Bachelor level class.
The practical labs focus on using open-source tools only.
This enables the students to explore and tinker in chip design on their own laptops.

Find a PDF of this book at [Chip Design Book](https://www.imm.dtu.dk/~masca/chip-design-book.html)

[![Book Cover](chip-cover-small.jpg)](https://www.imm.dtu.dk/~masca/chip-design-book.html)

## Automated PDF builds

Every push to any branch builds the book with GitHub Actions and publishes
`chip-design-book.pdf` as an asset in a new
[GitHub release](https://github.com/os-chip-design/chip-design-book/releases).
A push containing several commits builds the final commit of that push.
The workflow can also be started manually from the Actions tab.

Releases use tags of the form `pdf-<run number>-<attempt>` and identify the
source commit in their title and notes. Rerunning a workflow creates a separate
release. Automated builds do not replace the release marked Latest.
The workflow uploads the generated book PDF only as a release asset and does
not commit build output. The cover and figure PDFs remain source assets in the
repository.

The workflow uses TeX Live 2022 and `latexmk`, which runs pdfLaTeX, BibTeX,
and MakeIndex as needed. It uses the built-in `GITHUB_TOKEN` with
`contents: write` permission to publish releases; no additional secret is needed.
All book inputs, including `code/nand.v`, must be committed for the build to work
on GitHub. To build locally with an installed TeX distribution, run `make`.

Cite this book as:
```
@Book{chip:design:book,
  author       = {Martin Schoeberl},
  title        = {Introduction to Chip Design Using Open-Source Tools},
  year         = {2026},
  howpublished = {\url{https://www.imm.dtu.dk/~masca/chip-design-book.html}},
}
```
