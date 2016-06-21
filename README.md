Run SARAH models precompiled by the butler script of SARAH Toolbox.

Try directly here:

[![Binder](http://mybinder.org/badge.svg)](http://mybinder.org/repo/restrepo/SimplifiedDM-SDFDM-Toolbox)

Design
-----------------------------------------------------------------------------
The rules to implement the fermion/scalars multiplets are in the files:

- `SARAH/Models/blocks.fermions.lha`
- `SARAH/Models/blocks.scalars.lha`

implemented as LHA blocks.

The `master` branch only contains the standard SARAH-Toolbox distribution plus
the new generic files.

Each new model MODEL is build inside a CATEGORY under the branch:

 `CATEGORY+MODEL`

based in the predefined blocks in the fermion/scalars multiplets files. __Explore the branchs__!

Implemened CATEGORY's:

- SM: Explore SARAH feautures
- SimplifiedDM: Simplified Dark Matter Models
- radinert:  Models with radiative neutrino masses and dark matter candidates with SM + Z2-odd particles

Each implemented model have a notebook in tests dir:

 `tests/CATEGORY-MODEL.ipynb`

with examples to run and scan the parameter space.

The module `hep` (in `tests/hep.py`) used there, have the objects to _automatically_ run the model in a similar way to the SSP SARAH-toolbox package.

See README_CREATES_NEW_MODEL.md to help with build new models. __Send the new models as a pull request__.

See README_deploy_mybinder.md: To deploy a mybinder virtual machine:


Official README stars here
-------------------------------------------------------------------------------
This README file describes the contents and usage of the SUSY toolbox package.

1) Content
-------------------------------------------------------------------------------

All file locations are relative to the package root.

- configure
This is the compiled configuration script which is invoked by the user (see
below).

- butler.in
The input file which is translated into the butler script (see below) by
configure.

- Makefile.in
Translated into Makefile by configure.

- m4/*
Files necessary for the automatic creation of aclocal.m4 via aclocal (NB: this
is _not_ necessary for ordinary usage).

- aclocal.m4
Autoconf helper macros required to create configure from configure.ac via
autoconf, automatically generated from the contents of m4 by aclocal (NB: _not_
necessary for ordinary usage).

- configure.ac
The source which is translated into configure by autoconf (NB: _not_ required
for ordinary usage).

-tarballs
The configure script will store any automatically fetched tarballs in this
directory.

2) Description
-------------------------------------------------------------------------------

The package is built around a configure shell script which is implemented using
autoconf for enhanced portability. Note that the script is shipped ready to use,
neither installation nor invocation of autoconf is required by the user (unless
he/she wants to modify the script itself). The prerequisites to use the toolbox
are

- Mathematica: mandatory as SARAH is a Mathematica program. Versions >= 5 will
  work.
- A FORTRAN compiler is required for Spheno, HiggsBounds, CalcHep, Micromegas
  and WHIZARD. gfortran is recommended and works fine for all programs (note
  that WHIZARD requires gfortran 4.5 or better).
- A C compiler is required for CalcHep and Micromegas (the GNU C compiler works
  fine).
- O'Caml and latex is required by WHIZARD and checked for during the WHIZARD
  configuration.
- wget or curl are required for automatic downloading of the package tarballs by
  configure.
- Make

In order to use the script, first create a directory in which the toolbox shall
be set up. Change to this directory and invoke the configure script, e.g. via
../configure. The script will now proceed to check the prerequisites and
download any required packages from the Internet. For WHIZARD, the WHIZARD
configure script is invoked automatically.

If the default configuration is not sufficient, command line options can be used
to disable a subset of packages (e.g. --disable-micromegas) or to configure the
names and options of the compilers and the mathematica kernel (e.g.
MATH=math_5.2). An exhaustive list of options can be obtained via the --help
option.

Please note that the goal of this package is not to create modified forks of the
various programs; therefore, the versions of the programs provided by the
authors on the web and their various build systems are used. Unfortunately, this
implies that the compiler settings don't automatically propagate to CalcHep and
Micromegas which have rather convoluted build systems.  Thus, any changes to the
setup of those two packages have to be made by hand before running make.

On finalization, configure creates a Makefile and the butler script in the
toolbox directory. Invoking make triggers the compilation and installation of
the various packages by calling the respective build systems. Upon completion,
the compiled packages can be found in there respective directories, with an
additional unversioned symlink pointing to the versioned directory (e.g. SPHENO ->
SPHENO-3.1.5). The only exception is WHIZARD which is installed directly into a
directory called whizard.

For simple use cases, the butler script can be used to completely automate the
implementation of a new model into the various packages, provided that the model
is added to SARAH. The script is invoked using "butler modelname" and will first
create the necessary model files using SARAH and then proceed to compile and add
the model to the various packages. A list of the supported command line options
can be obtained via "--help" or "-h" which includes options to disable
individual packages (however, no packages disabled during configure can be
enabled this way).

3) Troubleshooting
-------------------------------------------------------------------------------

- Configure complains about missing prerequisites.
  Make sure that the corresponding programs are installed and working correctly.

- Errors in the build process of individual packages.
  Make sure that the necessary compilers are installed and working.
  Unfortunately, there is a limit on the influence which the toolbox script has
  over the build process of the individual packages, so it might be necessary to
  build the packages manually (in the directories where configure has untarred
  them) in order to solve uncommon build problems. After manual compilation, the
  toolbox make should go through, and butler will work as intended.

- Download and / or checksum failures.
  Make sure that your Internet connection is working properly and the download
  sites can be reached in a browser. If a checksum fails, the file might have
  been damaged during download. In this case, remove the file from the tarballs
  directory (see above) and retry. If this doesn't help (or if the download
  location has moved), please contact one of the toolbox authors.

===============================================================================
Authors:

Werner Porod         porod@physik.uni-wuerzburg.de
Thorsten Ohl         ohl@physik.uni-wuerzburg.de
Christian Speckner   Christian.Speckner@pysik.uni-freiburg.de
Florian Staub        fnstaub@physik.uni-wuerzburg.de
