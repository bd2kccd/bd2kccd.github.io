# Documentation on using the causal-cmd software

## What is causal-cmd

Causal-cmd is a Java application that provides a command-line interface (CLI) and application programming interface (API) for causal discovery algorithms produced by the Center for Causal Discovery.  The application currently includes the algorithm(s):

- FGSc (Fast Greedy Search) for continuous data - is an optimization of the Greedy Equivalence Search algorithm	(GES,	Meek	1995;	Chickering	2003). The optimizations are described in Scaling up Greedy Causal Search for Continuous Variables
- FGSd (Fast Greedy Search) for discrete data
- GFCIc (Greedy Fast Causal Inferece) for continuous data

Causal discovery algorithms are a class of search algorithms that explore a space of graphical causal models, i.e., graphical models where directed edges imply causation, for a model (or models) that are a good fit for a dataset. We suggest that newcomers to the field review Causation, Prediction and Search by Spirtes, Glymour and Scheines for a primer on the subject.

Causal discovery algorithms allow a user to uncover the causal relationships between variables in a dataset. These discovered causal relationships may be used further--understanding the underlying the processes of a system (e.g., the metabolic pathways of an organism), hypothesis generation (e.g., variables that best explain an outcome), guide experimentation (e.g., what gene knockout experiments should be performed) or prediction (e.g. parameterization of the causal graph using data and then using it as a classifier).

## How can I use it?

Java 7 or higher is the only prerequisite to run the software. Note that by default Java will allocate the smaller of 1/4 system memory or 1GB to the Java virtual machine (JVM). If you run out of memory (heap memory space) running your analyses you should increase the memory allocated to the JVM with the following switch '-XmxXXG' where XX is the number of gigabytes of ram you allow the JVM to utilize. For example to allocate 8 gigabytes of ram you would add -Xmx8G immediately after the java command.

### Run an example output using known data via command line

Download the this file, [Retention.txt](http://www.ccd.pitt.edu/wp-content/uploads/files/Retention.txt), which is a dataset containing information on college graduation and used in the publication "What Do College Ranking Data Tell Us About Student Retention?" by Drudzel and Glymour, 1994.

```
java -jar causal-cmd-6.0.1-jar-with-dependencies.jar --algorithm fgsc --data Retention.txt
```

Note that the filename causal-cmd-x.x.x-jar-with-dependencies.jar should match the version you have downloaded. The program will output the results of the FGS search procedure as a text file (in this example to output). The beginning of the file contains the algorithm parameters used in the search.

Inspect the output which should show a graph with the following edges.

```
Graph Edges:
1. fac_salary --- spending_per_stdt
2. spending_per_stdt --> rjct_rate
3. spending_per_stdt --- stdt_tchr_ratio
4. stdt_accept_rate --- fac_salary
5. stdt_clss_stndng --> rjct_rate
6. tst_scores --- fac_salary
7. tst_scores --- grad_rate
8. tst_scores --- spending_per_stdt
9. tst_scores --- stdt_clss_stndng
```

In FGS, "Elapsed getEffectEdges = XXms" refers to the amount of time it took to evaluate all pairs of variables for correlation. The file then details each step taken in the greedy search procedure i.e., insertion or deletion of edges based on a scoring function (i.e., BIC score difference for each chosen search operation).

The end of the file contains the causal graph from the search procedure. Here is a key to the edge types:

- A --- B - There is causal relationship between variable A and B but we cannot determine the direction of the relationship
- A --> B - There is a causal relationship from variable A to B

The GFCI algorithm has additional edge types:

- A <-> B - There is an unmeasured confounder of A and B
- A o-> B - Either A is a cause of B or there is an unmeasured confounder of A and B or both
- A o-o B - Either (1) A is a cause of B or B is a cause of A, or (2) there is an unmeasured confounder of A and B, or both 1 and 2 hold.


### Use as an API

Here is an example of using the Tetrad library which is included in causal-cmd as an API. Javadocs for the API are [here](http://cmu-phil.github.io/tetrad/tetrad-lib-apidocs/).

```
import edu.cmu.tetrad.algcomparison.algorithm.Algorithm;
import edu.cmu.tetrad.algcomparison.algorithm.oracle.pattern.Fgs;
import edu.cmu.tetrad.algcomparison.score.SemBicScore;
import edu.cmu.tetrad.cli.validation.DataValidation;
import edu.cmu.tetrad.cli.validation.TabularContinuousData;
import edu.cmu.tetrad.data.DataSet;
import edu.cmu.tetrad.graph.Graph;
import edu.cmu.tetrad.io.DataReader;
import edu.cmu.tetrad.io.TabularContinuousDataReader;
import edu.cmu.tetrad.util.Parameters;
import java.nio.file.Path;
import java.nio.file.Paths;

/**
 *
 * Nov 29, 2016 4:42:42 PM
 *
 * @author Kevin V. Bui
 */
public class FgsApiExample {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) throws Exception {
        // set path to Retention data
        Path dataFile = Paths.get("test", "data", "Retention.txt");

        char delimiter = '\t';

        // perform data validation
        // note: assuming data has unique variable names and does not contain zero covariance pairs
        DataValidation dataValidation = new TabularContinuousData(dataFile, delimiter);
        if (!dataValidation.validate(System.err, true)) {
            System.exit(-128);
        }

        // create FGS algorithm that uses BIC score
        Algorithm fgs = new Fgs(new SemBicScore());

        // read in dataset
        DataReader dataReader = new TabularContinuousDataReader(dataFile, delimiter);
        DataSet dataSet = dataReader.readInData();

        // set parameters for FGS
        Parameters parameters = new Parameters();
        parameters.set("penaltyDiscount", 0.4);
        parameters.set("maxDegree", -1);
        parameters.set("faithfulnessAssumed", true);
        parameters.set("verbose", true);
        parameters.set("printStream", System.out);

        // run FGS search with given dataset and parameters
        Graph graph = fgs.search(dataSet, parameters);
        System.out.println();
        System.out.println(graph.toString().trim());
        System.out.flush();
    }

}
```
## Command line interface usage

Tetrad-cli has different switches for different algorithms. 
```
usage: java -jar causal-cmd-6.0.1-SNAPSHOT.jar --algorithm <arg> |
       --simulate-data <arg>  [--version]
    --algorithm <arg>       fgsc, fgsd, gfcic
    --simulate-data <arg>   sem-rand-fwd, bayes-net-rand-fwd
    --version               Version.
```

Use the `--algorithm <arg>` parameter to see specific algorithm usage information.


### causal-cmd usage for FGS for continuous data

```
usage: java -jar causal-cmd-6.0.1-jar-with-dependencies.jar --algorithm fgsc [-d <arg>] [--exclude-variables <arg>] -f <arg> [--faithfulness-assumed] [--help] [--json] [--knowledge <arg>] [--max-degree <arg>] [--no-validation-output] [-o <arg>] [--output-prefix <arg>] [--penalty-discount <arg>] [--skip-latest] [--skip-nonzero-variance] [--skip-unique-var-name] [--tetrad-graph-json] [--thread <arg>] [--verbose]
 -d,--delimiter <arg>           Data delimiter either comma, semicolon, space, colon, or tab. Default: comma for *.csv, else tab.
    --exclude-variables <arg>   A file containing variables to exclude.
 -f,--data <arg>                Data file.
    --faithfulness-assumed      Yes if (one edge) faithfulness should be assumed. Default is false.
    --help                      Show help.
    --json                      Create JSON output.
    --knowledge <arg>           A file containing prior knowledge.
    --max-degree <arg>          The maximum degree of the output graph. Use -1 for unbounded.. Default is -1.
    --no-validation-output      No validation output files created.
 -o,--out <arg>                 Output directory.
    --output-prefix <arg>       Prefix name for output files.
    --penalty-discount <arg>    Penalty discount. Default is 4.0.
    --skip-latest               Skip checking for latest software version
    --skip-nonzero-variance     Skip check for zero variance variables.
    --skip-unique-var-name      Skip check for unique variable names.
    --tetrad-graph-json         Create Tetrad Graph JSON output.
    --thread <arg>              Number of threads.
    --verbose                   Print additional information.
```

### causal-cmd usage for FGS for discrete data

```
usage: java -jar causal-cmd-6.0.1-jar-with-dependencies.jar --algorithm fgsd [-d <arg>] [--exclude-variables <arg>] -f <arg> [--faithfulness-assumed] [--help] [--json] [--knowledge <arg>] [--max-degree <arg>] [--no-validation-output] [-o <arg>] [--output-prefix <arg>] [--sample-prior <arg>] [--skip-category-limit] [--skip-latest] [--skip-unique-var-name] [--structure-prior <arg>] [--tetrad-graph-json] [--thread <arg>] [--verbose]
 -d,--delimiter <arg>           Data delimiter either comma, semicolon, space, colon, or tab. Default: comma for *.csv, else tab.
    --exclude-variables <arg>   A file containing variables to exclude.
 -f,--data <arg>                Data file.
    --faithfulness-assumed      Yes if (one edge) faithfulness should be assumed. Default is false.
    --help                      Show help.
    --json                      Create JSON output.
    --knowledge <arg>           A file containing prior knowledge.
    --max-degree <arg>          The maximum degree of the output graph. Use -1 for unbounded.. Default is -1.
    --no-validation-output      No validation output files created.
 -o,--out <arg>                 Output directory.
    --output-prefix <arg>       Prefix name for output files.
    --sample-prior <arg>        Sample prior. Default is 1.0.
    --skip-category-limit       Skip 'limit number of categories' check.
    --skip-latest               Skip checking for latest software version
    --skip-unique-var-name      Skip check for unique variable names.
    --structure-prior <arg>     Structure prior coefficient. Default is 1.0.
    --tetrad-graph-json         Create Tetrad Graph JSON output.
    --thread <arg>              Number of threads.
    --verbose                   Print additional information.
```

### causal-cmd usage for GFCI for continuous data

```
usage: java -jar causal-cmd-6.0.1-jar-with-dependencies.jar --algorithm gfcic [--alpha <arg>] [-d <arg>] [--exclude-variables <arg>] -f <arg> [--faithfulness-assumed] [--help] [--json] [--knowledge <arg>] [--max-degree <arg>] [--no-validation-output] [-o <arg>] [--output-prefix <arg>] [--penalty-discount <arg>] [--skip-latest] [--skip-nonzero-variance] [--skip-unique-var-name] [--tetrad-graph-json] [--thread <arg>] [--verbose]
    --alpha <arg>               Cutoff for p values (alpha). Default is 0.01.
 -d,--delimiter <arg>           Data delimiter either comma, semicolon, space, colon, or tab. Default: comma for *.csv, else tab.
    --exclude-variables <arg>   A file containing variables to exclude.
 -f,--data <arg>                Data file.
    --faithfulness-assumed      Yes if (one edge) faithfulness should be assumed. Default is false.
    --help                      Show help.
    --json                      Create JSON output.
    --knowledge <arg>           A file containing prior knowledge.
    --max-degree <arg>          The maximum degree of the output graph. Use -1 for unbounded.. Default is -1.
    --no-validation-output      No validation output files created.
 -o,--out <arg>                 Output directory.
    --output-prefix <arg>       Prefix name for output files.
    --penalty-discount <arg>    Penalty discount. Default is 4.0.
    --skip-latest               Skip checking for latest software version
    --skip-nonzero-variance     Skip check for zero variance variables.
    --skip-unique-var-name      Skip check for unique variable names.
    --tetrad-graph-json         Create Tetrad Graph JSON output.
    --thread <arg>              Number of threads.
    --verbose                   Print additional information.
```

### Prior knowledge file example

```
/knowledge
addtemporal
1 spending_per_stdt fac_salary stdt_tchr_ratio 
2 rjct_rate stdt_accept_rate 
3 tst_scores stdt_clss_stndng 
4* grad_rate 

forbiddirect
x3 x4

requiredirect
x1 x2
```

The first line must say /knowledge The three sections of knowledge are

- forbiddirect - forbidden edges indicated by a list of pairs of variables
- requireddirect - required edges indicated by a list of pairs of variables
- addtemporal - tiers of variables where the first tier preceeds the last. Adding a asterisk next to the tier id prohibits edges between tier variables.
