# Run Jupyter Notebook  as container

Instead of installing all kind of packages and dependencies for running python, I decided to run a Jupyter Notebook as Docker container including all packages I want.

I chose [`jupyter/scipy-notebook`][scipy] which includes
 * Everything in [`jupyter/minimal-notebook`][minimal] and its ancestor images
 * dask, pandas, numexpr, matplotlib, scipy, seaborn, scikit-learn, scikit-image, sympy, cython, patsy, statsmodel, cloudpickle, dill, numba, bokeh, sqlalchemy, hdf5, vincent, beautifulsoup, protobuf, xlrd, bottleneck, and pytables packages
 *	ipywidgets and ipympl for interactive visualizations and plots in Python notebooks
 *	Facets for visualizing machine learning datasets

Note this list is copied from [this useful page](
https://jupyter-docker-stacks.readthedocs.io/en/latest/using/selecting.html).

## Download and run the image
```
docker run -p 8888:8888 jupyter/scipy-notebook
```
Copy the url and access the Jupyter notebook in the Browser, e.g.,
http://127.0.0.1:8888/?token=e8b3cb1c17c618376df2c0c41a09068ebeb5a6091eeaa8ee

In case you need the link again:
```
docker exec -it <container name or ID> jupyter notebook list
```


---
Links: https://github.com/jupyter/docker-stacks


[scipy]: https://hub.docker.com/r/jupyter/scipy-notebook
[minimal]: https://hub.docker.com/r/jupyter/minimal-notebook/
