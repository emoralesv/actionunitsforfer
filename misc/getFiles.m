function [out] = getFiles(path,type)
% Returns filenames of the type "type" in the path "path"
    list_dir=dir(fullfile(path,type));
    list_dir={list_dir.name};
    out=list_dir;
end