function [ train,trainclass,test, testclass,c] = perm(features,class,partition_type,k)
% partitions the data for the evaluation of the models.
%
%   features = feature vector for training
%   
%   class = labels 
%   
%   partition type =  {1,2}
%       1 = KFold validation, 2= leave-one-out validation   
%
%   k = number or folds {5,10};
%

switch partition_type
    case 1
        c = cvpartition(class,'KFold',k);
        for i = 1:c.NumTestSets
            
            trIdx = c.training(i);
            
            teIdx = c.test(i);
            train{i} = features(trIdx,:);
            trainclass{i} = class(trIdx,:);
            test{i} = features(teIdx,:);
            testclass{i} = class(teIdx,:);
           % validation{i} = dataau(teIdx,:);
        end
    case 2
        c = cvpartition(class,'LeaveOut');
        for i = 1:c.NumTestSets
            trIdx = c.training(i);
            teIdx = c.test(i);
            train{i} = features(trIdx,:);
            trainclass{i} = class(trIdx,:);
            test{i} = features(teIdx,:);
            testclass{i} = class(teIdx,:);
            %validation{i} = dataau(teIdx,:);
        end

end

