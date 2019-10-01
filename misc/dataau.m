function [ cl ] = dataau( data )
% Accommodates the labels of the action units for model training.
for i  = 1 : 27
   for ii = 1 : size(data,2)
        for iii = 1 : size(data{ii},1)
            if data{ii}(iii,1) == i
                cl{i}(ii) = 1 ;
                break;
            
            else
                cl{i}(ii) = 0 ;
            end
        
        end
   end 
end
end

