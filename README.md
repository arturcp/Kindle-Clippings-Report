# Kindle Clippings Report

This tool extracts all clippings from the file `My Clippings.txt` created on the
kindle device and organize the notes and highlights in the `reports` folder,
organized by author and book title.

It is useful to save your notes somewhere else, like on Google Drive or Dropbox.

## How to

First, you need to access your Kindle device and copy `My Clippings.txt` to your
computer. Then, on the root of this project, run:

```
ruby report.rb path/to/MyClippings.txt
```

The files will be store on `./reports`. Inside it, a folder will be created
with the current date.
