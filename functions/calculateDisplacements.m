function [disGraph] = calculateDisplacements(input, frameRate)
% CALCULATEDISPLACEMENTS Input a line-time photo
% Outputs a displacement-time relationship

reference = createReference(input);

[~, frames] = size(input);
displacement = zeros(frames, 1);

if (reference(1) < 100)
    i = maxk(grad(:, 1), 1, 1);
else
    i = mink(grad(:, 1), 1, 1); % finds most negative gradient value
end

a = find(grad(:, 1) == i); %returns the row of highest gradient i.e. edge

for j = 1:frames
    pixelDifference = double(input(a, 1)) - double(input(a, j));%from formula (top)
    s = double(pixelDifference) ./ grad(a, 1); %from formula (bottom)
    displacement(j) = -s; % gradient direction is downwards
    %To make consistent with photo, flip
end

time = frameRate*(1:frames)/frames;
time = time';

disGraph = zeros(frames, 2);
disGraph(:, 1) = displacement;
disGraph(:, 2) = time;

end
