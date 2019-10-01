function [ expmodels,errexp ] = fisgenexp( data,classes,cluster_type,cluster_influence_fe,cluster_numbre )
% This method generates the fuzzy models for the facial expressions
%
% data = data to train
% 
% classes = test classes 
%
% au_number = number of the unit of action from which the model will be generated
%
% cluster_number = {1-5}
%   Determine the number of clusters used to training the fuzzy models using
%   fuzzy c-means
%
%



run('exprules.m');
load nombresau.mat
         errexp = 0;
for cc = 1 :7 
    ou{1,1} = emo{cc};
    ou{1,2} = emo{8};
     for i = 1 : size(reglas{cc},2)
        ou{2,i} = fs{reglas{cc}(i)};
     end
    
    %expmodels{cc} = genfis2e(ou,d(:,reglas{cc}),c==cc,.5);
    
    switch cluster_type
        case 1
            expmodels{cc} = genfis3(data(:,reglas{cc}) ,double( classes==cc),'sugeno',cluster_numbre);
        case 2
            expmodels{cc} = genfis2(data(:,reglas{cc}),classes==cc,cluster_influence_fe);
    end

    try
    expmodels{cc} = anfis([data(:,reglas{cc}) classes==cc],expmodels{cc});

    catch
        errexp = 1;
    end
    expmodels{cc}.name = emo{cc};
    for i = 1 : size(reglas{cc},2)
        expmodels{cc}.input(i).name = fs{reglas{cc}(i)};
    end
end
end

