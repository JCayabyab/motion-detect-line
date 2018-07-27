function [frame1, frame2] = getFrames(video)
%GETFRAMES Summary of this function goes here
%   Detailed explanation goes here
[~, ~, ~, frames] = size(video);

approved = 0;

while (approved == 0)
    prompt = {sprintf(['Note: This video has %d frames.\n'...
              'First Frame:'], frames), ...
              'Last Frame:'};
    title = 'Enter frames for analysis:';
    dims = [1 40];
    definput = {'1', num2str(frames)};
    userInput = inputdlg(prompt, title, dims, definput);

    userInput = str2double(userInput);

    frame1 = userInput(1);
    frame2 = userInput(2);

    if (isempty(userInput))
        return;
    end
    
    
    if(frame1 > frame2 || frame2 > frames)
        disp('Invalid frame input!');
        pause(2);
    else
        figure('Name', 'Frame Comparison', 'Position', [50 200 1500 500]);
        subplot(1,2,1);
        imshow(video(:,:,1,frame1), []);
        subplot(1,2,2);
        imshow(video(:,:,1,frame2), []);
        
        answer = questdlg('Are these frames okay?', 'Frame Check',...
            'Yes', 'No', 'Yes');
        switch answer
            case 'Yes'
                approved = 1;
            case 'No'
                approved = 0;
        end
        close('Frame Comparison');
    end
end

end

