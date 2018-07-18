function [displacement] = calculateDisplacements(input, angle)
% CALCULATEDISPLACEMENTS Input a line-time photo
% Outputs a displacement-time relationship

reference = createReference(input);
[~, grad] = imgradientxy(reference);

[~, t] = size(input);
displacement = zeros(t, 1);

if (reference(1) < 128)
    i = maxk(grad(:, 1), 1, 1);
else
    i = mink(grad(:, 1), 1, 1); % finds most negative gradient value
end

a = find(grad(:, 1) == i); %returns the row of highest gradient i.e. edge

for j = 1:t
    pixelDifference = double(input(a, 1)) - double(input(a, j));%from formula (top)
    s = double(pixelDifference) ./ grad(a, 1); %from formula (bottom)
    displacement(j) = -s; % gradient direction is downwards
    %To make consistent with photo, flip
end

cosine = cos(angle);

displacement = displacement/cosine;

end
