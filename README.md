
<!-- README.md is generated from README.Rmd. Please edit that file -->

tdar
====

This package allows programmatic access to [the Digital Archaeological
Record (tDAR)](https://www.tdar.org), a service of [Digital
Antiquity](https://www.digitalantiquity.org).

Installation
------------

You can install tdar from github with:

    # install.packages("devtools")
    devtools::install_github("bocinsky/tdar")

Please note that this project is released with a [Contributor Code of
Conduct](CONDUCT.md). By participating in this project you agree to
abide by its terms.

Basic usage
-----------

### Authentication

tDAR authentication is handled through a username and password. Log in
using the `tdar::tdar_login` function

    tdar::tdar_login(tdar_user = '<your username>', 
                     tdar_password = '<your password>')

The `tdar::tdar_login` function automatically searches for a stored tDAR
user name and password in your environment. If you have a username and
password, pass them in as environment vars using:

    Sys.setenv(tdar_un = '<your username>',
               tdar_pw = '<your password>')

If you do not yet have a username and password, register for one here at
\[<a href="https://core.tdar.org/account/new/" class="uri">https://core.tdar.org/account/new/</a>\].
To become part of the tDAR API Group, please contact the Digital
Antiquity staff at
\[<a href="mailto:info@digitalantiquity.org" class="email">info@digitalantiquity.org</a>\].
