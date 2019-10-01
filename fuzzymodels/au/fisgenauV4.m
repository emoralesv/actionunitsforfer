function [ aumodels, errau ] = fisgenauV4( data,classes ,au_number,ct,cia,cn)
% This method generates the fuzzy models for the action units
%
% data = data to train
% 
% classes = test classes 
%
% au_number = number of the unit of action from which the model will be generated
%
%
%
%
opts = statset('display','iter');
au = aurulesV3();
errau = 0;
inputs = inputnames();
aumodels = [];
load('nombresau.mat');
if isempty(au{au_number})
    return;
end
data = data(:,au{au_number});
switch ct
    case 1
        aumodels = genfis3(data,classes,'sugeno',cn);
    case 2
        aumodels =  genfis2(data,classes,cia);
end

try
    aumodels = anfis([data classes],aumodels);
catch
    errau = 1;
end
aumodels.name = fs{au_number};
aumodels.output(1).name = fs{au_number};
end


