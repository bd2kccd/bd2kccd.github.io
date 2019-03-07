# Welcome to CCD Docs

This site hosts documentation for the [Center for Causal Discovery](http://www.ccd.pitt.edu/).

## Tools and Software

**causal-cmd** - a Java API and command line implementation of algorithms for performing causal discovery on Big Data. Use this software if you are interested incorporating analysis via a shell script or in a Java-based program. The software currently includes Fast Greedy Search (**FGES**) for continuous or discrete variables – an optimized version of Greedy Equivalence Search (**GES**) tested with datasets that contain as many as 1 million continuous variables, and Greedy Fast Causal Inference (**GFCI**) for continuous or discrete variables.

- [Download the latest release i.e., causal-cmd-X.X.X-jar-with-dependencies.jar](https://cloud.ccd.pitt.edu/nexus/content/repositories/releases/edu/pitt/dbmi/causal-cmd/)
- [Documentation for the big data enabled causal discovery algorithms](http://www.ccd.pitt.edu/wiki/index.php?title=Algorithm_Documentation)
- [Report bugs or issues with the software](ccd.user.helpdesk@gmail.com)
- [Github project](https://github.com/bd2kccd/causal-cmd)

**Tetrad** - a Java API, and desktop environment for learning, performing analyses and experimenting with causal discovery algorithms.

- [Download the latest Tetrad GUI Application i.e., tetrad-gui-x.x.x-launch.jar](https://cloud.ccd.pitt.edu/nexus/content/repositories/releases/edu/cmu/tetrad-gui/)
- [Tetrad Project Website](http://www.phil.cmu.edu/tetrad/)
- [Documentation for the big data enabled causal discovery algorithms](http://www.ccd.pitt.edu/wiki/index.php?title=Algorithm_Documentation)
- [Github project](https://github.com/cmu-phil/tetrad)

**Causal Web App** – our user-friendly web-based graphical interface for performing causal discovery analysis on big data using large memory servers at the Pittsburgh Supercomputing Center. Use this software if you want to quickly try out a causal discovery algorithm or if you have big data which cannot be analyzed on your local hardware.

- [CCD Web Application](https://ccd2.vm.bridges.psc.edu/ccd/login)
- [Documentation for the big data enabled causal discovery algorithms](http://www.ccd.pitt.edu/wiki/index.php?title=Algorithm_Documentation)
- [Github project](https://github.com/bd2kccd/ccd-web)

**Causal REST API** – our RESTful API for Causal Web App. Once you create a new user account via Causal Web App, you can use this REST API to upload data files and run Causal Discovery Algorithms.

- [Github project](https://github.com/bd2kccd/causal-rest-api)

**Py-causal** - a python module that wraps algorithms for performing causal discovery on big data. The software currently includes Fast Greedy Search (**FGES**) for both continuous and discrete variables, and Greedy Fast Causal Inference (**GFCI**) for continuous and discretevariables.

- [Github project](https://github.com/bd2kccd/py-causal)
- [Docker container of Jupyter Notebook with Py-causal configured](https://hub.docker.com/r/chirayukong/py-causal-notebook/)
- [Documentation for the big data enabled causal discovery algorithms](http://www.ccd.pitt.edu/wiki/index.php?title=Algorithm_Documentation)

**R-causal** - an R module that that wraps algorithms for performing causal discovery on big data. The software currently includes Fast Greedy Search (**FGES**) for both continuous and discrete variables, and Greedy Fast Causal Inference (**GFCI**) for continuous variables.

- [Github project](https://github.com/bd2kccd/r-causal)
- [Docker container of Jupyter Notebook with R-causal configured](https://hub.docker.com/r/chirayukong/r-causal-rstudio/)
- [Documentation for the big data enabled causal discovery algorithms](http://www.ccd.pitt.edu/wiki/index.php?title=Algorithm_Documentation)

**cytoscape-tetrad** - a native cytoscape plugin that imports tetrad txt output files that contain the structure of a causal graph. It handles causal graphs and partial ancestral graphs.
- [Plugin](https://cloud.ccd.pitt.edu/nexus/content/repositories/releases/edu/pitt/dbmi/ccd/cytoscape/tetrad/cytoscape-tetrad-app)
- [Github project](https://github.com/bd2kccd/cytoscape-tetrad)

**ccd-annotations-cytoscape** - a native cytoscape plugin that allows for annotating nodes and edges of any cytoscape graph. 
- [Plugin](https://cloud.ccd.pitt.edu/nexus/content/repositories/releases/edu/pitt/cs/admt/cytoscape/annotations/ccd-annotations-cytoscape/)
- [Github project](hhttps://github.com/bd2kccd/ccd-annotations-cytoscape)


*If you use our software in your research, please acknowledge the Center for Causal Discovery, supported by **grant U54HG008540**, in any papers, presentations, or other dissemination of your work.*

*All software is open-source and released under a dual licensing model. For non-profit institutions, the software is available under the GNU General Public License (GPL) v2 license. For-profit organizations that wish to commercialize enhanced or customized versions of the software will be able to purchase a commercial license on a case-by-case basis. The GPL license permits individuals to modify the source code and to share modifications with other colleagues/investigators. Specifically, it permits the dissemination and commercialization of enhanced or customized versions as well as incorporation of the software or its pieces into other license-compatible software packages, as long as modifications or enhancements are made open source.*

*By using software provided by the Center for Causal Discovery, you agree that no warranties of any kind are made by Carnegie Mellon University or the University of Pittsburgh with respect to the data provided by the software or any use thereof, and the universities hereby disclaim the implied warranties of merchantability, fitness for a particular purpose, and non-infringement. The universities shall not be liable for any claims, losses, or damages of any kind arising from the data provided by the software or any use thereof.*