function [line] = createReference(inputLine)
%CREATEREFERENCE This function takes a line-time image and creates a
%reference image to compare displacements.
[h, w] = size(inputLine); 

line = zeros(h, 1, 'double');

for i = 1:w
    nLine = inputLine(:, i);
    nLine = double(nLine);
    nLine = times(nLine, 1/w);
    line = line + nLine;
end

end

