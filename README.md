# bd2kccd.github.io

This is the project documentation repo of CCD software and tools. It uses [MkDocs](http://www.mkdocs.org/) to generate the static documentation site pages (https://github.com/bd2kccd/bd2kccd.github.io) that are hosted on Github Pages.

Below are the steps to contrubite to the CCD docs:

## 1. Installing MkDocs

http://www.mkdocs.org/#installation

## 2. Adding/Editing Pages

All the source markdown files and store in `/docs_src` folder. Just follow the instructions at http://www.mkdocs.org/#adding-pages to add new pages or edit existing content.

You'll also need to edit settings in the `mkdocs.yml` file to configure site pages and navigation.

## 3. Building/Generating the Static Site

````
mkdocs build --clean
````

This command will build and generate the static content site and store all the static files at `/docs` folder. Then you can access the live site at https://bd2kccd.github.io.

## Notes

The `index.html` in the root directory of this repo serves as the entry point of the domain name https://bd2kccd.github.io, and it redirects the users to https://bd2kccd.github.io/docs to view the MkDocs generated static content. Just leave it there if you don't need to display anything by default.