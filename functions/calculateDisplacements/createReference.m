function [reference] = createReference(inputVid)
%CREATEREFERENCE This function takes a line-time image and creates a
%reference image to compare displacements.
[h, w, t] = size(inputVid); 

reference = zeros(h, w, 'double');

for i = 1:t
    nVid = inputVid(:, :, i);
    nVid = double(nVid);
    nVid = times(nVid, 1/t);
    reference = reference + nVid;
end

end

