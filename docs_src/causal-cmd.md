# causal-cmd v1.10.x

## Introduction

Causal-cmd is a Java application that provides a Command-Line Interface (CLI) tool for causal discovery algorithms produced by the [Center for Causal Discovery](http://www.ccd.pitt.edu/).  The application currently includes the following algorithms:  
boss, bpc, ccd, cpc, cstar, fas, fask, fask-pw, fci, fcimax, fges, fges-mb, fofc, ftfc, gfci, grasp, grasp-fci, ica-ling-d, ica-lingam, images, mgm, pag-sampling-rfci, pc, pc-mb, pcmax, r-skew, r3, rfci, skew, spfci, svar-fci, svar-gfci

Causal discovery algorithms are a class of search algorithms that explore a space of graphical causal models, i.e., graphical models where directed edges imply causation, for a model (or models) that are a good fit for a dataset. We suggest that newcomers to the field review Causation, Prediction and Search by Spirtes, Glymour and Scheines for a primer on the subject.

Causal discovery algorithms allow a user to uncover the causal relationships between variables in a dataset. These discovered causal relationships may be used further--understanding the underlying the processes of a system (e.g., the metabolic pathways of an organism), hypothesis generation (e.g., variables that best explain an outcome), guide experimentation (e.g., what gene knockout experiments should be performed) or prediction (e.g. parameterization of the causal graph using data and then using it as a classifier).

## Command Line Usage

Java 8 or higher is the only prerequisite to run the software. Note that by default Java will allocate the smaller of 1/4 system memory or 1GB to the Java virtual machine (JVM). If you run out of memory (heap memory space) running your analyses you should increase the memory allocated to the JVM with the following switch '-XmxXXG' where XX is the number of gigabytes of ram you allow the JVM to utilize. For example to allocate 8 gigabytes of ram you would add -Xmx8G immediately after the java command.

In this example, we'll use download the [Retention.txt](https://raw.githubusercontent.com/bd2kccd/causal-cmd/development/dist/Retention.txt)
Keep in mind that causal-cmd has different switches for different algorithms. To start, type the following command in your terminal:

````
java -jar causal-cmd-<version number>-jar-with-dependencies.jar
````

** Note: we are using `causal-cmd-<version number>-jar-with-dependencies.jar` to indicate the actual executable jar of specific version number that is being used. **

And you'll see the following instructions:

```bash
Missing required options: algorithm, data-type, dataset, delimiter
usage: java -jar Causal-cmd Project-1.10.0.jar  --algorithm <string> [--comment-marker <string>] --data-type <string> --dataset <files> [--default] --delimiter <string> [--experimental] [--help] [--help-algo-desc] [--help-all] [--help-score-desc] [--help-test-desc] [--json-graph] [--metadata <file>] [--no-header] [--out <directory>] [--prefix <string>] [--quote-char <character>] [--skip-validation] [--version]
    --algorithm <string>        Algorithm: boss, bpc, ccd, cpc, cstar, dagma, direct-lingam, fas, fask, fask-pw, fci, fci-iod, fci-max, fges, fges-mb, fofc, ftfc, gfci, grasp, grasp-fci, ica-ling-d, ica-lingam, images, mgm, pag-sampling-rfci, pc, pc-mb, r-boss, r-skew, r3, rfci, skew, spfci, svar-fci, svar-gfci
    --comment-marker <string>   Comment marker.
    --data-type <string>        Data type: all, continuous, covariance, discrete, mixed
    --dataset <files>           Dataset. Multiple files are seperated by commas.
    --default                   Use Tetrad default parameter values.
    --delimiter <string>        Delimiter: colon, comma, pipe, semicolon, space, tab, whitespace
    --experimental              Show experimental algorithms, tests, and scores.
    --help                      Show help.
    --help-algo-desc            Show all the algorithms along with their descriptions.
    --help-all                  Show all options and descriptions.
    --help-score-desc           Show all the scores along with their descriptions.
    --help-test-desc            Show all the independence tests along with their descriptions.
    --json-graph                Write out graph as json.
    --metadata <file>           Metadata file.  Cannot apply to dataset without header.
    --no-header                 Indicates tabular dataset has no header.
    --out <directory>           Output directory
    --prefix <string>           Replace the default output filename prefix in the format of <algorithm>_<numeric timestamp>.
    --quote-char <character>    Single character denotes quote.
    --skip-validation           Skip validation.
    --version                   Show version.
Use --help for guidance list of options.  Use --help-all to show all options.
```


By specifying an algorithm using the --algorithm switch the program will indicate the additional required switches.  The program reminds the user of required switches to run.  In general most algorithms also require  data-type, dataset, delimiter and score. The switch --help-all displays and extended list of switches for the algorithm.

Example of listing all available options for an algorithm:
````bash
$ java -jar causal-cmd-1.9.0-jar-with-dependencies.jar --algorithm fges --data-type continuous --dataset Retention.txt --delimiter tab --score sem-bic-score --help

usage: java -jar Causal-cmd Project-1.10.0.jar --algorithm fges --data-type continuous --dataset Retention.txt --delimiter tab --score sem-bic-score [--addOriginalDataset] [--choose-dag-in-pattern] [--choose-mag-in-pag] [--comment-marker <string>] [--default] [--exclude-var <file>] [--experimental] [--external-graph <file>] [--extract-struct-model] [--faithfulnessAssumed] [--generate-complete-graph] [--genereate-pag-from-dag] [--genereate-pag-from-tsdag] [--genereate-pattern-from-dag] [--json-graph] [--knowledge <file>] [--make-all-edges-undirected] [--make-bidirected-undirected] [--make-undirected-bidirected] [--maxDegree <integer>] [--meekVerbose] [--metadata <file>] [--missing-marker <string>] [--no-header] [--numberResampling <integer>] [--out <directory>] [--parallelized] [--penaltyDiscount <double>] [--percentResampleSize <integer>] [--precomputeCovariances] [--prefix <string>] [--quote-char <character>] [--resamplingEnsemble <integer>] [--resamplingWithReplacement] [--saveBootstrapGraphs] [--seed <long>] [--semBicRule <integer>] [--semBicStructurePrior <double>] [--skip-validation] [--symmetricFirstStep] [--timeLag <integer>] [--verbose]
    --addOriginalDataset              Yes, if adding the original dataset as another bootstrapping
    --choose-dag-in-pattern           Choose DAG in Pattern graph.
    --choose-mag-in-pag               Choose MAG in PAG.
    --comment-marker <string>         Comment marker.
    --default                         Use Tetrad default parameter values.
    --exclude-var <file>              Variables to be excluded from run.
    --experimental                    Show experimental algorithms, tests, and scores.
    --external-graph <file>           External graph file.
    --extract-struct-model            Extract sturct model.
    --faithfulnessAssumed             Yes if (one edge) faithfulness should be assumed
    --generate-complete-graph         Generate complete graph.
    --genereate-pag-from-dag          Generate PAG from DAG.
    --genereate-pag-from-tsdag        Generate PAG from TsDAG.
    --genereate-pattern-from-dag      Generate pattern graph from PAG.
    --json-graph                      Write out graph as json.
    --knowledge <file>                Prior knowledge file.
    --make-all-edges-undirected       Make all edges undirected.
    --make-bidirected-undirected      Make bidirected edges undirected.
    --make-undirected-bidirected      Make undirected edges bidirected.
    --maxDegree <integer>             The maximum degree of the graph (min = -1)
    --meekVerbose                     Yes if verbose output for Meek rule applications should be printed or logged
    --metadata <file>                 Metadata file.  Cannot apply to dataset without header.
    --missing-marker <string>         Denotes missing value.
    --no-header                       Indicates tabular dataset has no header.
    --numberResampling <integer>      The number of bootstraps/resampling iterations (min = 0)
    --out <directory>                 Output directory
    --parallelized                    Yes if the search should be parallelized
    --penaltyDiscount <double>        Penalty discount (min = 0.0)
    --percentResampleSize <integer>   The percentage of resample size (min = 10%)
    --precomputeCovariances           True if covariance matrix should be precomputed for tubular continuous data
    --prefix <string>                 Replace the default output filename prefix in the format of <algorithm>_<numeric timestamp>.
    --quote-char <character>          Single character denotes quote.
    --resamplingEnsemble <integer>    Ensemble method: Preserved (1), Highest (2), Majority (3)
    --resamplingWithReplacement       Yes, if sampling with replacement (bootstrapping)
    --saveBootstrapGraphs             Yes if individual bootstrapping graphs should be saved
    --seed <long>                     Seed for pseudorandom number generator (-1 = off)
    --semBicRule <integer>            Lambda: 1 = Chickering, 2 = Nandy
    --semBicStructurePrior <double>   Structure Prior for SEM BIC (default 0)
    --skip-validation                 Skip validation.
    --symmetricFirstStep              Yes if the first step step for FGES should do scoring for both X->Y and Y->X
    --timeLag <integer>               A time lag for time series data, automatically applied (zero if none)
    --verbose                         Yes if verbose output should be printed or logged
````

In this example, we'll be running the FGES algorithm on the dataset `Retention.txt`.

````bash
$ java -jar causal-cmd-1.10.0-jar-with-dependencies.jar --algorithm fges --data-type continuous --dataset Retention.txt --delimiter tab --score sem-bic-score
````

This command will output by default one file fges_<unix timestamp\>.txt which is a log and result of the algorithm's activity.  
'--json-graph' option will enable output fges_<unix timestamp\>_graph.json which is a json graph from the algorithm, which is equivalent to the exported json file from tetrad-gui.

Example log output from causal-cmd:
````bash
================================================================================
FGES (Wed, October 04, 2023 01:42:43 PM)
================================================================================

Runtime Parameters
--------------------------------------------------------------------------------
number of threads: 7

Dataset
--------------------------------------------------------------------------------
file: Retention.txt
header: yes
delimiter: tab
quote char: none
missing marker: none
comment marker: none

Algorithm Run
--------------------------------------------------------------------------------
algorithm: FGES
score: Sem BIC Score

Algorithm Parameters
--------------------------------------------------------------------------------
addOriginalDataset: no
faithfulnessAssumed: no
maxDegree: 1000
meekVerbose: no
numberResampling: 0
parallelized: no
penaltyDiscount: 2.0
percentResampleSize: 100
precomputeCovariances: no
resamplingEnsemble: 1
resamplingWithReplacement: no
saveBootstrapGraphs: no
seed: -1
semBicRule: 1
semBicStructurePrior: 0.0
symmetricFirstStep: no
timeLag: 0
verbose: no


Wed, October 04, 2023 01:42:45 PM: Start data validation on file Retention.txt.
Wed, October 04, 2023 01:42:45 PM: End data validation on file Retention.txt.
There are 170 cases and 8 variables.

Wed, October 04, 2023 01:42:45 PM: Start reading in file Retention.txt.
Wed, October 04, 2023 01:42:45 PM: Finished reading in file Retention.txt.
Wed, October 04, 2023 01:42:45 PM: File Retention.txt contains 170 cases, 8 variables.

Start search: Wed, October 04, 2023 01:42:45 PM
End search: Wed, October 04, 2023 01:42:45 PM

================================================================================
Graph Nodes:
spending_per_stdt;grad_rate;stdt_clss_stndng;rjct_rate;tst_scores;stdt_accept_rate;stdt_tchr_ratio;fac_salary

Graph Edges:
1. spending_per_stdt --- fac_salary
2. spending_per_stdt --- rjct_rate
3. spending_per_stdt --- stdt_tchr_ratio
4. stdt_accept_rate --- fac_salary
5. stdt_clss_stndng --- rjct_rate
6. stdt_clss_stndng --- tst_scores
7. tst_scores --- fac_salary
8. tst_scores --- grad_rate
9. tst_scores --- rjct_rate
10. tst_scores --- spending_per_stdt

Graph Attributes:
Score: -5181.565079

Graph Node Attributes:
Score: [spending_per_stdt: -1408.4382541909688;grad_rate: -416.7933531919986;stdt_clss_stndng: -451.79480827547627;rjct_rate: -439.8087229322177;tst_scores: -330.2039598576225;stdt_accept_rate: -429.64771587695884;stdt_tchr_ratio: -208.85274641239832;fac_salary: -1496.025518245214]
````


## Interpretation of graph output
The end of the file contains the causal graph edgesfrom the search procedure. Here is a key to the edge types:

- A --- B - There is causal relationship between variable A and B, but we cannot determine the direction of the relationship
- A --> B - There is a causal relationship from variable A to B

The GFCI algorithm has additional edge types:

- A <-> B - There is an unmeasured confounder of A and B
- A o-> B - Either A is a cause of B or there is an unmeasured confounder of A and B or both
- A o-o B - Either (1) A is a cause of B or B is a cause of A, or (2) there is an unmeasured confounder of A and B, or both 1 and 2 hold.

- A --> B dd nl - Definitely direct causal relationship and no latent confounder
- A --> B pd nl - Possibly direct and no latent confounder
- A --> B pd pl - Possibly direct and possibly latent confounder

NNote: the generated result file name is based on the system clock.



### Sample Prior Knowledge File

From the above useage guide, we see the option of `--knowledge <arg>`, with which we can specify the prior knowledge file. Below is the content of a sample prior knowledge file:

````
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
````

The first line of the prior knowledge file must say `/knowledge`. And a prior knowledge file consists of three sections:

- addtemporal - tiers of variables where the first tier preceeds the last. Adding a asterisk next to the tier id prohibits edges between tier variables
- forbiddirect - forbidden directed edges indicated by a list of pairs of variables: from -> to direction
- requireddirect - required directed edges indicated by a list of pairs of variables: from -> to direction
