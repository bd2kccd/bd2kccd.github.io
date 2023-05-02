py-causal
========
[Python APIs](https://github.com/bd2kccd/py-causal) for causal modeling algorithms developed by the University of Pittsburgh/Carnegie Mellon University [Center for Causal Discovery](http://www.ccd.pitt.edu).

Note: This project uses a very old version of Tetrad and a method of connecting Python to Java, Javabridge, that's proven sometimes buggy and hard to install on some platforms, and so we are no longer recommending it. Please consider using py-tetrad instead. Py-tetrad uses JPype to bridge Python and Java, which has already shown itself to be much easier to install and use cross-platform. Also, it allows one to use the most recent version of Tetrad, and it has been well-tested.

This code is distributed under the LGPL 2.1 license.

Requirements:
============

Python 2.7 and 3.6

* javabridge>=1.0.11
* pandas
* numpy
* JDK 1.8
* pydot (Optional)
* GraphViz (Optional)


Docker Image
============

A pre-installed py-causal Docker image is available at [Docker Hub](https://hub.docker.com/r/chirayukong/py-causal-notebook/)


Installation overview:
======================
To install on existing Python installation, we have found two approaches to be useful:
* Direct python installation with pip, possibly including use of [Jupyter](http://jupyter.org/). This approach is likely best for users who have Python installed and are familiar with installing Python modules.
* Installation via [Anaconda](https://www.continuum.io/downloads), which  installs Python and related utilities.

Directions for both approaches are given below...

Installation with pip
=====================

If you do not have pip installed already, try [these instructions](https://pip.pypa.io/en/stable/installing/).

Once pip is installed, execute these commands

    pip install -U numpy
    pip install -U pandas
    pip install -U javabridge
    pip install -U pydot 
    pip install -U GraphViz

Note: you also need to install the GraphViz engine by following [these instructions](http://www.graphviz.org/Download..php).

We have observed that on some OS X installations, pydot may provide the following response
    Couldn't import dot_parser, loading of dot files will not be possible.

If you see this, try the following

     pip uninstall pydot
     pip install pyparsing==1.5.7
     pip install pydot


Then, from within the py-causal directory, run the following command:

    python setup.py install
    
or use the pip command:

    pip install git+git://github.com/bd2kccd/py-causal

After running this command, enter a python shell and attempt the follwing import
    import pandas as pd
    import pydot
    from tetrad import search as s

Finally, try to run the python [example](https://github.com/bd2kccd/py-causal/blob/master/py-causal-fges-continuous-example.py)

    python py-causal-fges-continuous-example.py

Be sure to run this from within the py-causal directory.

This program will create a file named tetrad.svg, which should be viewable in any SVG capable program. If you see a causal graph, everything is working correctly.

Running Jupyter/IPython
-----------------------

We have found [Jupyter](http://jupyter.org/) notebooks to be helpful. (Those who have run IPython in the past should know that Jupyter is simply a new name for IPython). To add Jupyter to your completed python install, simply run

    pip -U jupyter
    jupyter notebook
 
 
 and then load one of the Jupyter notebooks found in this installation. 

Anaconda/Jupyter
================

Installing Python with Anaconda and Jupyter may be easier for some users:

* [Download and install Anaconda](https://www.continuum.io/downloads)
* conda install python-javabridge

For OS X, this default install does not seem to work well. try the following instead:

    conda install --channel https://conda.anaconda.org/david_baddeley python-javabridge

Then run the following to configure anacoda

    conda install pandas  
    conda install numpy
    conda install pydot
    conda install graphviz 
    conda install -c https://conda.anaconda.org/chirayu pycausal 
    jupyter notebook

and then load one of the Jupyter notebooks.

