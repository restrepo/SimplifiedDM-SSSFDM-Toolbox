FROM gcr.io/generic-notebooks/binder-base
RUN pip install bash_kernel
RUN python -m bash_kernel.install

USER main

ADD . $HOME/notebooks

USER root
RUN chown -R main:main $HOME/notebooks
USER main

# Convert notebooks to the current format
# RUN find $HOME/notebooks -name '*.ipynb' -exec ipython nbconvert --to notebook {} --output {} \;
RUN find $HOME/notebooks -name '*.ipynb' -exec ipython trust {} \;

WORKDIR $HOME/notebooks

