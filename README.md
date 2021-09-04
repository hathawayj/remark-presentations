# Data Science is about communication

This repository houses an invited presentation for Kennesaw States DS 7900 Applied Project in Analytics and Data Science. 

- [slides](https://ds7900.github.io/analytics-collaboration-hathaway/#1)
## Data parsing example

I use the [marathon data](https://faculty.chicagobooth.edu/george.wu/research/marathon/) that is used in the New York Times article [What Good Marathons and Bad Investments Have in Common](https://www.nytimes.com/2014/04/23/upshot/what-good-marathons-and-bad-investments-have-in-common.html?rref=upshot&_r=1)

They provide links to the full data of almost ten million records in [csv from box](https://uchicago.box.com/s/m6zvhtudswz8mctu1kcxr3a4a33f24qc). I have removed a few columns and provided two formats from dropbox.

- [.sas7bdat](https://www.dropbox.com/s/5h81st5lj0zf85w/marathon.sas7bdat?dl=0) (1.18 Gb)
- [.csv](https://www.dropbox.com/s/pck9qnwmbo4vjsi/marathon.csv?dl=0) (0.566 Gb)

You can find the same data in `.feather` and `.parquet` formats in the `arrow` folder of this repository.

### R scripts

- [initial_setup.R](initial_setup.R) provides the script that drops columns from the original source.
- [create_arrow.R](create_arrow.R) provides and example of converting a large file from `.sas7bdat` to `.feather` and `.parquet`.
- [data_digest.R](data_digest.R) provides size and parsing time for each format.

### Python scripts



## GitHub Pages Slideshow with [Remark](https://github.com/gnab/remark)

This template is made from [Remark](https://github.com/gnab/remark), an open source tool to help create and display slideshows from markdown. For questions, see [Remark's documentation](https://github.com/gnab/remark).

The most important things to know are:
- Enable GitHub Pages from `master` for the slides to work
- Once enabled, the slides will be visible at `https://USERNAME.github.io/REPOSITORY-NAME/#1`, like https://brianamarie.github.io/slideshow-on-pages/#1
- Edit the `index.html` file to edit the slides
- Slides are separated by `----`
- Presenter notes after `???` within one slide
- Toggle presenter notes during presentation with `P`
- Read the full guide to [remark markdown](https://github.com/gnab/remark)
- Press `C` to clone a display; then press `P` to switch to presenter mode. Open help menu with `h`

Fork this repository to get started! 
