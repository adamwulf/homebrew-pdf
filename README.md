# PDF

A simple tool to read metadata and text content of PDF files.

# Notes

`v10_15` is required macOS so that the command line tool can use async/await.

# Brew

The build for this tool is managed through the `Makefile`. The `pdf.rb` formula uses this Makefile to compile and install the tool.

## Install

```
$ brew tap adamwulf/pdf
$ brew install pdf
```

## Uninstall

```
$ brew uninstall pdf
$ brew untap adamwulf/pdf
```

## New Version

1. Update `pdf.rb` to include the new version number.
2. push repo to github
3. tag that new commit with the same version as step 1
4. `$ brew update`, or uninstal and reinstall

It's not clear to me when brew updates the tapped formula from github. Uninstalling and reinstalling always works. `brew update` may work too.
