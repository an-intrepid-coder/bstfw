# Compiling R on Termux
## (a brief minimal guide)

**Overview**: There isn't yet a dedicated R package in the official Termux repositories. Here is a quick guide to compiling it from source. This minimal guide should be enough to follow along with *Bayesian Statistics the Fun Way*. I will update it as needed, as I'm mostly following along on my phone. I formatted this for reading with the `mdp` markdown viewer.

---

**More Information**: This is a short guide based on the information found here. There is a lot I am not covering. I will expand this short guide as I learn more. This is only intended as a quick start guide for getting R running on Termux for following along with some exercises in *Bayesian Statistics the Fun Way*. Link to more in-depth info:

https://cran.r-project.org/doc/manuals/r-release/\
R-admin.html#Getting-and-unpacking-the-sourcee://\
cran.r-project.org/doc/manuals/r-release/R-admin.\
html

---

**Prerequisites**: Depending on what's already installed, there may be a need to install some required packages. I found it necessary to install `openjdk-17` as well as `libgfortran5` from the Termux repositories. Any dependcy warnings in the next steps can generally be resolved with `pkg search` and `pkg install`. 

The following link gives more comprehensive information: \
https://cran.r-project.org/doc/manuals/r-release/R \
-admin.html#Essential-programs-and-libraries

---

**Termux:** It is assumed that you've already installed Termux on your phone. As of this writing, Termux's latest supported versions are to be found in the F-DROID repositories. Link:

https://wiki.termux.com/wiki/Installing_from_F-Droid

---

**Download Source**: Get the source for the latest R version (`4.2.0` as of this writing). Choose an appropriate mirror from the following address:

https://cran.r-project.org/mirrors.html

---

**Unpack Source**: Unpack the downloaded file with `tar -xf R.<version>.tar.gz`. `cd` in to the newly created directory. 

---

**Run `./configure` script**: The `--enable-R-shlib` option was needed for me to get a successful compilation. The `--with-x` option is needed for plotting and other GUI-based features of R. The full command: `./configure --enable-R-shlib --with-x`.

Note: It may be worth looking in to the official documentation. I may not have covered everything for your use case. Here is a link for digging deeper:

https://cran.r-project.org/doc/manuals/r-release/\
R-admin.html#Compile-and-load-flags

---

**Run `make`**: Running `make install` may work for some users who have done more to customize their Termux installation. For others it will cause an error. I recommend running `make` by itself. Add the `bin` directory to the `PATH` manually or else create bash aliases, as you prefer.

The desired directory to add to `PATH` should be `<location of source tarball>/<extracted directory>/R-<version>/bin/`.

---

**X Server Support**: In order to use all of the plotting functionality of R, you'll need an X Server. I followed the instructions here, and found them accurate: 

https://wiki.termux.com/wiki/Graphical_Environment

---

**Errors and Corrections**: These are just the steps I used as a novice to get R compiled and running from source on Termux. They may be incomplete or contain errors. I will dig deeper as I go and update this brief guide. Anyone who notices an error is encouraged to point it out. I hope someone finds this useful!


