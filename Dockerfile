FROM andrewosh/binder-base

MAINTAINER Andrew Osheroff <andrewosh@gmail.com>

USER root

# Add Julia dependencies
RUN apt-get update
RUN apt-get install -y libroot-core-dev root-system-bin root-system-common libroot-tree-dev && apt-get clean

RUN pip install pyslha
RUN pip install bash_kernel

USER main

RUN python -m bash_kernel.install

RUN echo export ROOTSYS=/usr >> $HOME/.bashrc
RUN echo export PATH=$PATH:$ROOTSYS/bin >> $HOME/.bashrc
RUN echo export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$ROOTSYS/lib  >> $HOME/.bashrc
RUN echo export DYLD_LIBRARY_PATH=$DYLD_LIBRARY_PATH:$ROOTSYS/lib >> $HOME/.bashrc

