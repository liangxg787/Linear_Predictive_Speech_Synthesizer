# Linear_Predictive_Speech_Synthesizer
EEEM030 Assignment 1.

## Description
This report mainly includes the task of modeling, analysizing and synthesizing some vowels using the source-filter model of speech production. This project estimates the frequency response spectrums and the formant structure of each vowel directly from a real vowel samples by employing a kind of autoregressive (AR) model, linearpredictive coding (LPC) and then generates synthesized vowels with passing a periodic impulse train through the
all-pole filter obtained.

![See the details of the assignment requirement](document/assignment_2024 (1).pdf)

## Architecture of the project
![architecture](The_framework_of_implementation_of_model_estimation_and_synthesis.png)


## Structure of codes
```
.
├── README.md                                      # The readme file
├── conf
│   └── GlobalSetting.m                            # All the pulic parameters and settings
├── document
│   ├── Linear Predictive Speech Synthesizer.tex   # The latex file for the report
│   └── refs.bib                                   # The bibliography file
├── functionsForPlot
│   ├── plotExperimentGraph.m                      # The function of plotting the graphs for experiments
│   ├── plotFrequencyResponse.m                    # The function of plotting spectrums
│   └── saveGraph.m                                # The function of saving the graphs
├── functionsForSpeechProcess
│   ├── computeFrequencyResponse.m                 # The function of estimating the frequency response
│   ├── estimateFirstThreeFormant.m                # The function of estimating the first three formants
│   ├── estimateLpcCoeficients.m                   # The function of estimating the LPC coefficients
│   ├── estimateMeanFundamentalFrequency.m         # The function of estimating the mean fundamental frequency
│   └── preProcess.m                               # The function of preprocessing the signal
├── functionsForSynthesis
│   └── speechSynthesis.m                          # The function of synthesizing the vowels
├── main.m                                         # The main file for the entry of the project
├── mainFunction.m                                 # The main function of the workflow of the project
├── mainFunctionForExperiments.m                   # The main function of the workflow of experiments
└── test                                           # The test files
    ├── test.m
    ├── testComputeFrequencyResponse.m
    ├── testEstimateFirstThreeFormant.m
    ├── testEstimateLpcCoeficients.m
    ├── testEstimateMeanFundamentalFrequency.m
    ├── testPlotFrequencyResponse.m
    ├── testPreProcess.m
    └── testSpeechSynthesis.m
```