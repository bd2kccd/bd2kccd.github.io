# causal-cmd v0.3.x

## Introduction

Causal-cmd is a Java application that provides a Command-Line Interface (CLI) tool for causal discovery algorithms produced by the [Center for Causal Discovery](http://www.ccd.pitt.edu/).  The application currently includes the following algorithms:
bpc, eb, fang-concatenated, fas, fask-concatenated, fci, fges, fges-mb, fofc, ftfc, gfci, glasso, imgs_cont, imgs_disc, mbfs, mgm, pc-all, pc-stable-max, r-skew, r-skew-e, r1, r2, r3, r4, rfci, skew, skew-e, ts-fci, ts-gfci, ts-imgs

Causal discovery algorithms are a class of search algorithms that explore a space of graphical causal models, i.e., graphical models where directed edges imply causation, for a model (or models) that are a good fit for a dataset. We suggest that newcomers to the field review Causation, Prediction and Search by Spirtes, Glymour and Scheines for a primer on the subject.

Causal discovery algorithms allow a user to uncover the causal relationships between variables in a dataset. These discovered causal relationships may be used further--understanding the underlying the processes of a system (e.g., the metabolic pathways of an organism), hypothesis generation (e.g., variables that best explain an outcome), guide experimentation (e.g., what gene knockout experiments should be performed) or prediction (e.g. parameterization of the causal graph using data and then using it as a classifier).

## Command Line Usage

Java 8 or higher is the only prerequisite to run the software. Note that by default Java will allocate the smaller of 1/4 system memory or 1GB to the Java virtual machine (JVM). If you run out of memory (heap memory space) running your analyses you should increase the memory allocated to the JVM with the following switch '-XmxXXG' where XX is the number of gigabytes of ram you allow the JVM to utilize. For example to allocate 8 gigabytes of ram you would add -Xmx8G immediately after the java command.

In this example, we'll use download the [Retention.txt](http://www.ccd.pitt.edu/wp-content/uploads/files/Retention.txt) file, which is a dataset containing information on college graduation and used in the publication of "What Do College Ranking Data Tell Us About Student Retention?" by Drudzel and Glymour, 1994.

Keep in mind that causal-cmd has different switches for different algorithms. To start, type the following command in your terminal:

````
java -jar causal-cmd-<version number>-jar-with-dependencies.jar
````

** Note: we are using `causal-cmd-<version number>-jar-with-dependencies.jar` to indicate the actual executable jar of specific version number that is being used. **

And you'll see the following instructions:

````
Missing required options: algorithm, data-type, dataset, delimiter
usage: java -jar causal-cmd-0.3.0-SNAPSHOT.jar  --algorithm <string> [--comment-marker <string>] --data-type <string> --dataset <files> --delimiter <string> [--help] [--help-all] [--json] [--out <directory>] [--prefix <string>] [--quote-char <character>] [--skip-latest] [--skip-validation] [--version]
    --algorithm <string>        Algorithm: bpc, eb, fang-concatenated, fas, fask-concatenated, fci, fges, fges-mb, fofc, ftfc, gfci, glasso, imgs_cont, imgs_disc, mbfs, mgm, pc-all, pc-stable-max, r-skew, r-skew-e, r1, r2, r3, r4, rfci, skew, skew-e, ts-fci, ts-gfci, ts-imgs
    --comment-marker <string>   Comment marker.
    --data-type <string>        Data type: continuous, covariance, discrete, mixed
    --dataset <files>           Dataset. Multiple files are seperated by commas.
    --delimiter <string>        Delimiter: colon, comma, pipe, semicolon, space, tab, whitespace
    --help                      Show help.
    --help-all                  Show all options and descriptions.
    --json                      Write out graph as json.
    --out <directory>           Output directory
    --prefix <string>           Output file name prefix.
    --quote-char <character>    Single character denotes quote.
    --skip-latest               Skip checking for latest software version.
    --skip-validation           Skip validation.
    --version                   Show version.
Use --help for guidance list of options.  Use --help-all to show all options.

````


By specifying an algorithm using the --algorithm switch the program will indicate the additional required switches.  The program reminds the user of required switches to run.  In general most algorithms also require  data-type, dataset, delimiter and score. The switch --help-all displays and extended list of switches for the algorithm.

Example of listing all available options for an algorithm:
````
$ java -jar causal-cmd-0.3.0-SNAPSHOT-jar-with-dependencies.jar --algorithm fges --data-type continuous --dataset ./dist/Retention.txt --delimiter tab --score sem-bic --help

  usage: java -jar causal-cmd-0.3.0-SNAPSHOT.jar --algorithm fges --data-type continuous --dataset ./dist/Retention.txt --delimiter tab --score sem-bic [--bootstrapEnsemble <integer>] [--bootstrapping] [--bootstrapSampleSize <integer>] [--comment-marker <string>] [--exclude-var <file>] [--faithfulnessAssumed] [--json] [--knowledge <file>] [--maxDegree <integer>] [--missing-marker <string>] [--no-header] [--out <directory>] [--penaltyDiscount <double>] [--prefix <string>] [--quote-char <character>] [--skip-latest] [--skip-validation] [--symmetricFirstStep] [--verbose]
      --bootstrapEnsemble <integer>     Ensemble method: Preserved (0), Highest (1), Majority (2)
      --bootstrapping                   Yes if sampling dataset with replacement (bootstrapping) should be used
      --bootstrapSampleSize <integer>   The number of bootstraps (min = 1)
      --comment-marker <string>         Comment marker.
      --exclude-var <file>              Variables to be excluded from run.
      --faithfulnessAssumed             Yes if (one edge) faithfulness should be assumed
      --json                            Write out graph as json.
      --knowledge <file>                Prior knowledge file.
      --maxDegree <integer>             The maximum degree of the graph (min = -1)
      --missing-marker <string>         Denotes missing value.
      --no-header                       Indicates tabular dataset has no header.
      --out <directory>                 Output directory
      --penaltyDiscount <double>        Penalty discount (min = 0.0)
      --prefix <string>                 Output file name prefix.
      --quote-char <character>          Single character denotes quote.
      --skip-latest                     Skip checking for latest software version.
      --skip-validation                 Skip validation.
      --symmetricFirstStep              Yes if the first step step for FGES should do scoring for both X->Y and Y->X
      --verbose                         Yes if verbose output should be printed or logged

````

In this example, we'll be running the FGES algorith on the dataset `Retention.txt`.

````
 java -jar causal-cmd-0.3.0-SNAPSHOT-jar-with-dependencies.jar --algorithm fges --data-type continuous --dataset ./dist/Retention.txt --delimiter tab --score sem-bic
````

This command will output by default two files fges_<unix timestamp>.txt which is a log of the algorithm's activity and fges_<unix timmestamp>_graph.txt which is a textual description of the graph output from the algorithm.

Example log output from causal-cmd:
````
Tetrad: FGES (Tue, April 03, 2018 11:10:01 AM)
================================================================================
Short blurb goes here
--------------------------------------------------------------------------------
Algorithm: FGES
Score: Sem BIC Score

Tetrad Parameters
================================================================================
bootstrapEnsemble: 1
bootstrapping: false
bootstrapSampleSize: 10
faithfulnessAssumed: true
maxDegree: 100
penaltyDiscount: 2.0
symmetricFirstStep: false
verbose: false

Dataset
================================================================================
File: /Users/jue/IdeaProjects/causal-cmd/target/./dist/Retention.txt
Has Header: yes
Delimiter: tab
Data Type: continuous

Miscellaneous
================================================================================
Skip Validation: no
JSON Output: no
Output Directory: .

Start validating file Retention.txt.: Tue, April 03, 2018 11:10:02 AM
Finish validating file Retention.txt.: Tue, April 03, 2018 11:10:02 AM
There are 170 cases and 8 variables.
Start reading file Retention.txt.: Tue, April 03, 2018 11:10:02 AM
Finish reading file Retention.txt.: Tue, April 03, 2018 11:10:02 AM
File Retention.txt: 170 case(s), 8 variable(s).

Start search: Tue, April 03, 2018 11:10:02 AM
End search: Tue, April 03, 2018 11:10:02 AM
````


Example graph output from causal-cmd:
````
Graph Nodes:
spending_per_stdt,grad_rate,stdt_clss_stndng,rjct_rate,tst_scores,stdt_accept_rate,stdt_tchr_ratio,fac_salary

Graph Edges:
1. fac_salary --- spending_per_stdt
2. spending_per_stdt --> rjct_rate
3. spending_per_stdt --> stdt_clss_stndng
4. spending_per_stdt --- tst_scores
5. stdt_accept_rate --- fac_salary
6. stdt_accept_rate --> grad_rate
7. stdt_clss_stndng --> rjct_rate
8. stdt_tchr_ratio --- spending_per_stdt
9. stdt_tchr_ratio --> stdt_clss_stndng
10. tst_scores --- fac_salary
11. tst_scores --> grad_rate
12. tst_scores --> stdt_clss_stndng
````


## Interpretation of graph output
The end of the file contains the causal graph edgesfrom the search procedure. Here is a key to the edge types:

- A --- B - There is causal relationship between variable A and B but we cannot determine the direction of the relationship
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
- forbiddirect - forbidden edges indicated by a list of pairs of variables
- requireddirect - required edges indicated by a list of pairs of variables

