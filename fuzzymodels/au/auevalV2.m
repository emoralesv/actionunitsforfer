function [ results ] = auevalV2( aumodels,data )
% evaluation of the action units fuzzy models
%
% aumodels = set of action units models
% data = data to evaluate with the models
%

au = aurulesV3();
    for ii = 1 : size(data,1)
        for a = 1 : 27
            if ~isempty(aumodels{a})
                results(ii,a) = evalfis(data(ii,au{a}),aumodels{a});  
            end
        end
    end

end

