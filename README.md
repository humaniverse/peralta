# peralta <img src='man/figures/logo.png' align="right" height="150" /></a>

<!-- badges: start -->
[![Project Status: WIP – Initial development is in progress, but there
has not yet been a stable, usable release suitable for the
public.](https://www.repostatus.org/badges/latest/wip.svg)](https://www.repostatus.org/#wip)
<!-- badges: end -->

## Overview

peralta is an R package to detect if new datasets have been published to a web
page. Define a list of *suspects* (URL's) you would like to track and then 
*peralta* informs you if there have been any updates. Don't let the data get
away!

## Installation

You can install the development version from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("humaniverse/peralta")
```

## Design philosophy

Rather than create a new calss of objects (e.g., using R6/R7), peralta was
designed to take advantage of the existing R `data.frame` class. This allows the
user to interact with data created by this package using tools already in their
arsenal.


## Alternatives

Python:
- [urlwatch](https://github.com/thp/urlwatch)
- [kibitze](https://github.com/kibitzr/kibitzr)
- [watchme](https://github.com/vsoch/watchme)

## Credits

Developed by [Mike Page](https://github.com/MikeJohnPage) at the British Red 
Cross.
