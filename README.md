# peralta <img src='man/figures/logo.png' align="right" height="150" /></a>

<!-- badges: start -->

[![Project Status: WIP – Initial development is in progress, but there
has not yet been a stable, usable release suitable for the
public.](https://www.repostatus.org/badges/latest/wip.svg)](https://www.repostatus.org/#wip)
<!-- badges: end -->

## Overview

peralta is an R package to *detect* if new datasets have been published to a web
page. It does this by scanning the source code for changes in `href` attributes
and comparing these with a cache.

## Installation

You can install the development version from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("humaniverse/peralta")
```

## Contributing

To contribute to this project, please follow [GitHub
Flow](https://guides.github.com/introduction/flow/) when submitting
changes.

> Please note that this project is released with a Contributor Code of
> Conduct. By participating in this project you agree to abide by its
> terms.

## Alternatives

Python:
- [urlwatch](https://github.com/thp/urlwatch)
- [kibitze](https://github.com/kibitzr/kibitzr)
- [watchme](https://github.com/vsoch/watchme)

## Credits

Developed by [Mike Page](https://github.com/MikeJohnPage) at the British Red 
Cross.

See [LICESNE](/LICENSE)