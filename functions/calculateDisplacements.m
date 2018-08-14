function [disGraphX, disGraphY] = calculateDisplacements(input, frameRate)
% CALCULATEDISPLACEMENTS Input a line-time photo
% Outputs a displacement-time relationship

% reference = createReference(input);
% vid(:, :, 1) = reference;

[~, ~, frames] = size(input);
displacement = zeros(frames, 2);

f = initializeLoadingBar();

for j = 1:frames
    [displacement(j, 1), displacement(j, 2)] = shahbaziDelta(input(:,:,1), input(:,:,j));
    loadingBar(j, frames, f);
end

time = (1:frames)/frameRate;
time = time';

disGraphX = zeros(frames, 2);
disGraphX(:, 2) = displacement(:, 1);
disGraphX(:, 1) = time;

disGraphY = zeros(frames, 2);
disGraphY(:, 2) = displacement(:, 2);
disGraphY(:, 1) = time;

end
