function [nl, car,clau, entrenamiento, clasee, prueba, clasep ] = loaddata(normalizationtype,car_type,au0_model,partition_type)
% Load the data from a path, the data that is loaded are the CK+ database.
% all the image folders were located in a folder with the label class in
% number, for example, for anger:
% path/1/folders
% for contempt:
% path/2/folders
%
% normalizationtype = {1,2,3,4}  
%   1 = without normalization, 2 = procrustes, 3 = in terms of the neutral
%   state 4 = maintaining aspect ratio of the neutral state
%
% car_type = {1,2}
%   1 = average pooling, 2 = max pooling
%
%  au0_model = {1,2}
%   1 = original landmarks, 2 = au0 generated model using procrustes
%   
%  partition_type = {1,2}
%   1 = kFold, 2 = leave-one-out
%


try 
    load('D:\dataall.mat')
catch
    data = cell(4,2,2);
     [ls,cl,claudata] = extraerlandmarks();
       clau = dataau(claudata);
      lsm = generatemodel(ls);
    for normalizationtype = 1 : 4
        for car_type = 1 : 2
            for au0_model = 1: 2
                if au0_model == 1
                    data{normalizationtype,car_type,au0_model}.nl = affineint(ls,[40 43],normalizationtype);
                    data{normalizationtype,car_type,au0_model}.car = caracterizarinterfaz(data{normalizationtype,car_type,au0_model}.nl ,car_type);
                    [data{normalizationtype,car_type,au0_model}.entrenamiento, data{normalizationtype,car_type,au0_model}.clasee, data{normalizationtype,car_type,au0_model}.prueba, data{normalizationtype,car_type,au0_model}.clasep ] = perm(data{normalizationtype,car_type,au0_model}.car,cl ,partition_type,10);
                    data{normalizationtype,car_type,au0_model}.clau =  clau;
                end
                if au0_model == 2
                     data{normalizationtype,car_type,au0_model}.nl = affineint(lsm,[40 43],normalizationtype);
                    data{normalizationtype,car_type,au0_model}.car = caracterizarinterfaz(data{normalizationtype,car_type,au0_model}.nl ,car_type);
                    [data{normalizationtype,car_type,au0_model}.entrenamiento, data{normalizationtype,car_type,au0_model}.clasee, data{normalizationtype,car_type,au0_model}.prueba, data{normalizationtype,car_type,au0_model}.clasep ] = perm(data{normalizationtype,car_type,au0_model}.car,cl ,partition_type,10);
                    data{normalizationtype,car_type,au0_model}.clau = clau;
                end
                 
            end
        end
    end
            
            save('D:\dataall.mat','data','-v7.3');
end
        
        
        
    clau = data{normalizationtype,car_type,au0_model}.clau;
    nl = data{normalizationtype,car_type,au0_model}.nl;
    car = data{normalizationtype,car_type,au0_model}.car;
    entrenamiento = data{normalizationtype,car_type,au0_model}.entrenamiento;
    clasee = data{normalizationtype,car_type,au0_model}.clasee;
    prueba = data{normalizationtype,car_type,au0_model}.prueba;
    clasep = data{normalizationtype,car_type,au0_model}.clasep;
        
      



end

