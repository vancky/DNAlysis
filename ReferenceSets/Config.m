function [ config ] = Config( config )
    % Config - File where the user can specify his/her preferences
    
    config.matlabCd=('D:\jvanderauweraert\git\DNAlysis\PerformanceCriteria');

    % Directories for correcting Data
    config.referenceSet1Cd{1} =('K:\bn\nd\Shared\Humberto Sanchez\G0.181\170424_104237\00-beads-05*\*cam0_015_0*');
    config.referenceSet2Cd{1} = ('');
    config.referenceSet2Cd{2} = ('');
    config.referenceSet2Cd{3} = ('');
    config.referenceSet2Cd{4} = ('');
    config.referenceSet2Cd{5} = ('');
                 
    % Make sure we can use the functions
    addpath(genpath('./Functions'))

end

