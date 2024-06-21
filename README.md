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
