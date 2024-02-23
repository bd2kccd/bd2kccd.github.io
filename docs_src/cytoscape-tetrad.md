# cytoscape-tetrad

## Displaying Tetrad Networks in Cytoscape

The Cytoscape application has significant power and flexibility to display networks. This webpage describes how to load a plugin into Cytoscape that will allow you to import and display a Tetrad network (graph) that you have saved from Tetrad. 

Cytoscape can be download for free from http://www.cytoscape.org/ 

[Download the latest version of the plugin from github](https://github.com/bd2kccd/cytoscape-tetrad)

To install the plugin start the Cytoscape application and click on Apps --> App Manager --> Install Apps from the Cytoscape menu. 

## Using the Plugin 

- Put a graph box on the Tetrad workspace and select the graph type “graph”. Double click on the graph box to display the graph in Tetrad. Within the graph display box, click on File --> Save JSON. 

- In Cytoscape, select the File --> Import --> Network --> Tetrad option and select the file that you saved previously from Tetrad. 

- Apply a layout in Cytoscape. By default Cytoscape doesn't apply a layout so the initial rendering will look like a single node. Apply a layout by selecting Layout in the top menu and then choosing a layout to see your graph (e.g., Layouts --> Prefuse Force Directed Layout). 