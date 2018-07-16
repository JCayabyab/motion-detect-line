function [displacement] = calculateDisplacements(input, gradient)
% CALCULATEDISPLACEMENTS Input a line-time photo, a dI/dy gradient of the
% reference
% Outputs a displacement-time relationship
% This function assumes that gradient and input are the same size

[~, t] = size(input);
displacement = zeros(t, 1);

i = mink(gradient(:, 1), 1, 1);
a = find(gradient(:, 1) == i);
for j = 1:t
    pixelDifference = double(input(a, 1)) - double(input(a, j));%from formula (top)
    s = double(pixelDifference) ./ gradient(a, j); %from formula (bottom)
    displacement(j) = -s; % gradient direction is downwards
    %To make consistent with photo, flip
end

end
