function [ results,claser] = expeval( expmodels, data)
% evaluation of the facial expressions fuzzy models
%
% expmodels = set of facial expression models
% data = data to evaluate with the models
%
run('exprules.m');


    for ii = 1 : size(data,1)
        for i = 1 : 7
           results{ii,i} = evalfis( data(ii,reglas{i}) ,expmodels{i}      ); 
            
        end
        [c,in] = max(cell2mat( results(ii,:)));
        claser(ii,1) = in;

    end


end

