function [data,class,classau,corr,sub] = extraerlandmarks()
% Load the data from a path, the data that is loaded are the CK+ database.
% all the image folders were located in a folder with the label class in
% number, for example, for anger:
% path/1/folders
% for contempt:
% path/2/folders
% Dont forget to modify the path

paths = 'D:\database\';

formatSpec = '%f';

classau = [];
corr = [];
s = 0;
for c = 1 : 7
    p = strcat(paths,num2str(c),'\');
    d = dir(p);
    isub = [d(:).isdir]; %# returns logical vector
    nameFolds = {d(isub).name}';
    nameFolds(ismember(nameFolds,{'.','..'})) = [];
    
    
    for f = 1 : size(nameFolds,1)
        s = s+1;
        path = strcat(p,char(nameFolds{f}));
        img = getFiles(path,'*.png');
        %land = getFiles(path,'*landmarks.txt');
        classau{s} = fscanf(fopen(strcat(path,'\',char(getFiles(path,'*facs.txt')))),formatSpec,[2,Inf])';
%                  if c == 7
%                   disp('hola');
%                  end
        
        [~,name,~] = fileparts(char(img{1}));
        l =  fscanf(fopen(strcat(path,'\',name,'_landmarks.txt')),formatSpec,[2,Inf])';
        l(:,2) = l(:,2) * -1;
        data{s}.n = l;
        fclose('all');
        [~,name,~] = fileparts(char(img{end}));
        l2 =  fscanf(fopen(strcat(path,'\',name,'_landmarks.txt')),formatSpec,[2,Inf])';
        l2(:,2) = l2(:,2) * -1;
        data{s}.e = l2;
        class(s,1) = c;
        sub(s,1) = str2num(nameFolds{f}(:,2:3));
            end

        end
        
