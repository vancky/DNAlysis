# DNAlysis
aaMATLAB Analysis tool for the Nynke Dekker lab at Delft University of Technology

Lucky Imaging

Implementation of the lucky imaging algorithm inspired by Cronin et al. (2009)- Lucky Imaging: Improved Localization Accuracy for Single Molecule Imaging. The core of lucky imaging is the CLEAN algorithm, lucky imaging is simply a filter afterwards. The folder LuckyImaging contains all the files neccesary and can be copied to any project to be implemented.
Do not forget to edit the Config.m file to your preferences.


DNALengthFinder

A tool which can find the length of individual DNA strands over several images with different fluid velocity and track how the length of these DNA strands evolves over time.

The Config.m function is where you should input your preferences.
Simply run the Main.m file afterwards


Naming formalism:
We use camelCasing for variables, camelCase.camelCase for structures
and CamelCase for functions.
