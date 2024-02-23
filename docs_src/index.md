# Welcome to CCD Docs

This site hosts documentation for the [Center for Causal Discovery](http://www.ccd.pitt.edu/).

## Tools and Software

**causal-cmd** - a Java API and command line implementation of algorithms for performing causal discovery on Big Data. Use this software if you are interested incorporating analysis via a shell script or in a Java-based program. The software currently includes Fast Greedy Search (**FGES**) for continuous or discrete variables – an optimized version of Greedy Equivalence Search (**GES**) tested with datasets that contain as many as 1 million continuous variables, and Greedy Fast Causal Inference (**GFCI**) for continuous or discrete variables.

- [Download a release](https://s01.oss.sonatype.org/content/repositories/releases/io/github/cmu-phil/causal-cmd/)
- [Report bugs or issues with the software](https://github.com/bd2kccd/causal-cmd/issues)
- [Github project](https://github.com/bd2kccd/causal-cmd)

**Tetrad** - a Java API, and desktop environment for learning, performing analyses and experimenting with causal discovery algorithms.

- [Download the Application](https://s01.oss.sonatype.org/content/repositories/releases/io/github/cmu-phil/tetrad-gui/)
- [Tetrad Project Website](http://www.phil.cmu.edu/tetrad/)

**Causal Web App** – (unsupported and no longer maintained) our user-friendly web-based graphical interface for performing causal discovery analysis on big data using large memory servers.

- [Github project](https://github.com/bd2kccd/ccd-web)

**Causal REST API** – (unsupported and no longer maintained) our RESTful API for Causal Web App. Once you create a new user account via Causal Web App, you can use this REST API to upload data files and run Causal Discovery Algorithms.

- [Github project](https://github.com/bd2kccd/causal-rest-api)

**Cytoscape-tetrad** - (unsupported and no longer maintained) a native cytoscape plugin that imports tetrad txt output files that contain the structure of a causal graph. It handles causal graphs and partial ancestral graphs.

- [Github project](https://github.com/bd2kccd/cytoscape-tetrad)

**Ccd-annotations-cytoscape** - (unsupported and no longer maintained) a native cytoscape plugin that allows for annotating nodes and edges of any cytoscape graph.

- [Github project](https://github.com/bd2kccd/ccd-annotations-cytoscape)

**Py-causal** - (unsupported and no longer maintained) a python module that wraps algorithms for performing causal discovery on big data. The software currently includes Fast Greedy Search (**FGES**) for both continuous and discrete variables, and Greedy Fast Causal Inference (**GFCI**) for continuous and discretevariables.

Note: This project uses a very old version of Tetrad and a method of connecting Python to Java, Javabridge, that's proven sometimes buggy and hard to install on some platforms, and so we are no longer recommending it. Please consider using py-tetrad instead. Py-tetrad uses JPype to bridge Python and Java, which has already shown itself to be much easier to install and use cross-platform. Also, it allows one to use the most recent version of Tetrad, and it has been well-tested.

- [Github project](https://github.com/bd2kccd/py-causal)
- [Docker container of Jupyter Notebook with Py-causal configured](https://hub.docker.com/r/chirayukong/py-causal-notebook/)

**R-causal** - (unsupported and no longer maintained) an R module that that wraps algorithms for performing causal discovery on big data. The software currently includes Fast Greedy Search (**FGES**) for both continuous and discrete variables, and Greedy Fast Causal Inference (**GFCI**) for continuous variables.

Note 2023-03-06: This version of RCausal uses an older version of Tetrad from at least 5 years ago. However, we have updated our Python integration to a much better version--see <https://github.com/cmu-phil/py-tetrad>. Updating our R integration is one of the next projects we will take up.

- [Github project](https://github.com/bd2kccd/r-causal)
- [Docker container of Jupyter Notebook with R-causal configured](https://hub.docker.com/r/chirayukong/r-causal-rstudio/)

*If you use our software in your research, please acknowledge the Center for Causal Discovery, supported by **grant U54HG008540**, in any papers, presentations, or other dissemination of your work.*

*All software is open-source and released under a dual licensing model. For non-profit institutions, the software is available under the GNU General Public License (GPL) v2 license. For-profit organizations that wish to commercialize enhanced or customized versions of the software will be able to purchase a commercial license on a case-by-case basis. The GPL license permits individuals to modify the source code and to share modifications with other colleagues/investigators. Specifically, it permits the dissemination and commercialization of enhanced or customized versions as well as incorporation of the software or its pieces into other license-compatible software packages, as long as modifications or enhancements are made open source.*

*By using software provided by the Center for Causal Discovery, you agree that no warranties of any kind are made by Carnegie Mellon University or the University of Pittsburgh with respect to the data provided by the software or any use thereof, and the universities hereby disclaim the implied warranties of merchantability, fitness for a particular purpose, and non-infringement. The universities shall not be liable for any claims, losses, or damages of any kind arising from the data provided by the software or any use thereof.*