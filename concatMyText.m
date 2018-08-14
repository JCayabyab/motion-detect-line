clear;

cd ./data-formatted;

contents = dir;
fileNames = "15-1.txt";
[fileNum, ~] = size(contents);

for i=4:fileNum
    fileNames = strcat(fileNames, "+", contents(i).name);
end

command = strcat("copy ", fileNames, " all.txt");

system(command);
cd ..