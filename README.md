# bd2kccd.github.io

This is the project documentation repo of CCD software and tools. It uses [MkDocs](http://www.mkdocs.org/) to generate the static documentation site pages that are hosted on Github Pages.

Below are the steps to contrubite to the CCD docs:

## 1. Installing MkDocs v0.16.0

We suggest all contributors to [install MkDocs using pip](http://www.mkdocs.org/#installing-pip) and verify that the **version 0.16.0** is installed since this version has fixed many bugs.

## 2. Cloning the bd2kccd.github.io Repository

Before starting to work on the documentations, you'll need to clone this repo to create a local copy.

````
git clone https://github.com/bd2kccd/bd2kccd.github.io.git
cd bd2kccd.github.io
````

## 3. Creating a new branch to exercise your changes

````
git checkout -b your_new_branch
````

## 4. Starting the MkDocs Development Server

MkDocs comes with a built-in dev-server that lets you preview your documentation as you work on it. Make sure you're in the same directory as the mkdocs.yml configuration file, and then start the server by running 

````
mkdocs serve
````

Then open up http://127.0.0.1:8000/ in your browser, and you'll see the home page being displayed.

## 5. Adding/Editing Pages

All the source markdown files are stored in the `/docs_src` folder. Just follow the [instructions](http://www.mkdocs.org/#adding-pages) to add new pages or edit existing content.

You'll also need to edit settings in the `mkdocs.yml` file to configure site pages and navigation.

## 6. Building/Generating the Static Site

````
mkdocs build --clean
````

This command will build and generate the static content site and store all the static files at `/docs` folder. 

## 7. Reviewing Changes Locally

Before pushing all changes back to Github repo, you'll need to review your local changes in the development server.

## 8. Sending a Pull Request for Changes Review

Once everything looks good in your local development server, push them to Github and then send a new pull request based on the master so your cahnges will be reviewed before merging into the master branch. And once it's merged successfully, you'll be able to see the updated Github Pages site at https://bd2kccd.github.io.

## Notes

The `index.html` in the root directory of this repo serves as the entry point of the domain name https://bd2kccd.github.io, and it redirects the users to https://bd2kccd.github.io/docs to view the MkDocs generated static content. Just leave it there if you don't need to display anything by default.
