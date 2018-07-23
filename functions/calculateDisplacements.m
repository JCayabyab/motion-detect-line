function [disGraph] = calculateDisplacements(input, frameRate)
% CALCULATEDISPLACEMENTS Input a line-time photo
% Outputs a displacement-time relationship

% reference = createReference(input);
% vid(:, :, 1) = reference;

[~, ~, frames] = size(input);
displacement = zeros(frames, 1);

f = initializeLoadingBar();

for j = 1:frames
    [~, displacement(j, 1)] = shahbaziDelta(input(:,:,1), input(:,:,j));
    loadingBar(j, frames, f);
end

time = frameRate*(1:frames)/frames;
time = time';

disGraph = zeros(frames, 2);
disGraph(:, 1) = displacement;
disGraph(:, 2) = time;

end
