function [ claser,clasep,acc,errau,errexp,aumodels,expmodels ] = evaluatemodel(normalization_type,pooling_type,au0_model,cluster_type,cluster_number,cluster_influence_au,cluster_influence_fe, partition_type )
%EVALUATE MODEL- It generates a set of diffuse models for the recognition of facial expressions 
%and evaluates them using the accuracy.
%
% normalization_type = {1,2,3,4}  
%   1 = without normalization, 2 = procrustes, 3 = in terms of the neutral
%   state 4 = maintaining aspect ratio of the neutral state
%
% car_type = {1,2}
%   1 = average pooling, 2 = max pooling
%
%  au0_model = {1,2}
%   1 = original landmarks, 2 = auo generated model using procrustes
%
%cluster_type ={1,2}
%   1 = fuzzy c-means, 2= subtractive clustering 
%
% cluster_number = {1-5}
%   Determine the number of clusters used to training the fuzzy models using
%   fuzzy c-means
%
% cluster_influence_au = .2 to .9
%   Influence for the subtractive clustering algorithm for the action units
%   models.
%
% cluster_influence_fe = .2 to .9
%
%   Influence for the subtractive clustering algorithm for the facial
%   expressions models.
%
%  partition_type = {1,2}
%   1 = kFold, 2 = leave-one-out
%
% Example: evaluatemodel(1,2,2,1,0,0) for fuzzy c-means or
%          evaluatemodel(1,2,2,2,.5,.5) for subtractive clustering
%
%



%% Loading the data, don´t forget to specity the paths.
[~, car,clau, entrenamiento, clasee, prueba, clasep ] = loaddata(normalization_type,pooling_type,au0_model, partition_type);

%% Initialization
trainingau =  cell(1,27);
classau=  cell(1,27);
testau=  cell(1,27);
classpau=  cell(1,27);

%% Partitions for validation
for i =  1: 27
    [trainingau{i}, classau{i}, testau{i},classpau{i},~] = perm(car,clau{i}',2,10);
end

%% Initialization
aumodels = cell(size(entrenamiento,2),27);
auresulte = cell(1,size(entrenamiento,2));
auresultp = cell(1,size(entrenamiento,2));
expmodels = cell(1,size(entrenamiento,2));
resultados = cell(1,size(entrenamiento,2));
claser = cell(1,size(entrenamiento,2));
errau = cell(1,size(entrenamiento,2));
errexp = cell(1,size(entrenamiento,2));
%% Training for each partition
for k = 1 : size(entrenamiento,2)
    disp(strcat( 'Model generation:  ', num2str(k),' of ',num2str(size(entrenamiento,2))));
    % Training for each AU
    for au = 1: 27
        [aumodels{k}{au}, errau(k) ]= fisgenauV4(trainingau{au}{k},classau{au}{k},au,cluster_type,cluster_influence_au,cluster_number);
    end
    auresulte{k} = auevalV2(aumodels{k},entrenamiento{k});
    auresultp{k} = auevalV2(aumodels{k},prueba{k});
    [expmodels{k}, errexp(k)] = fisgenexp(auresulte{k},clasee{k},cluster_type,cluster_influence_fe,cluster_number);
    [resultados{k}, claser{k}] = expeval(expmodels{k},auresultp{k});
end
% classification performance
cp = classperf(cell2mat(claser'),cell2mat(clasep'));
acc = cp.CorrectRate;

% Error flags
if sum(errau) >= 1
    errau = 1;
else
    errau = 0;
end


if sum(errexp ) >= 1
    errexp = 1;
else
    errexp = 0;
end

end

