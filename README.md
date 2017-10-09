# DNAlysis
#### Jasper van der Auweraert, October 2016

## General Information

MATLAB Analysis tool for the Nynke Dekker lab at Delft University of Technology. The software has been automated as much as possible. Users will only have to edit the so called Config file with the relevant configurations. (If time allows this will be made into GUI). After configuring the Config file you can run the Main file to run the sofware.

The software can be customized for different experiments. The flow of the software always follows the structure mentioned below.

##### Software flow
* Set up configuration
* Import images
* Correlations and Calibrations
* Pre Processing of the data (images)
* Analysis
* Post Processing of the data (images)

Do not forget to edit the Config.m file to your preferences.




Naming formalism:
We use camelCasing for variables, camelCase.camelCase for structures
and CamelCase for functions.



## Key Inhouse Algorithms

#### Spotfinder

The main component is the SpotFinder algorithm, which can track the location track the location of different region of interests. For Gaussian distributions it can also fit the centre using the GaussMLEv2 algorithm ()

#### DnaFinder

#### MatchDnaHelicases

#### ColocateHelicases

#### Lucky Imaging (not used at this time)

Implementation of the lucky imaging algorithm inspired by Cronin et al. (2009)- Lucky Imaging: Improved Localization Accuracy for Single Molecule Imaging. The core of lucky imaging is the CLEAN algorithm, lucky imaging is simply a filter afterwards. The folder LuckyImaging contains all the files neccesary and can be copied to any project to be implemented.

#### DNALengthFinder

A tool which can find the length of individual DNA strands over several images with different fluid velocity and track how the length of these DNA strands evolves over time.



## Key External Algorithms

#### GaussMLEv2

Gaussian fitting algorithm, see the [paper](linktogaussmlev2paper).



[hyperlink](https://studentico.nl/app/auth)

* item 1
* item 2
* item 3

``
single line
``

```bash
multi line
With colors
eval $test
```
