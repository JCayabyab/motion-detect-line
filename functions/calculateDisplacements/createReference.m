function [outputLine] = createReference(inputLine)
%CREATEREFERENCE This function takes a line-time image and creates a
%reference image to compare displacements.
[h, w] = size(inputLine); 

iLine = zeros(h, 1, 'double');
outputLine = zeros(h, w, 'uint8');

for i = 1:w
    nLine = inputLine(:, i);
    nLine = double(nLine);
    nLine = times(nLine, 1/w);
    iLine = iLine + nLine;
end

for i = 1:w
    outputLine(:, i) = iLine;
end

end

