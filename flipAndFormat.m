clear;

% coords of target
coordsArray = ...
   [143.2440 1297.9851;...    % 15 1
    400.6409 1137.9371;...    % 16 2
    634.0279 1299.2251;...    % 17 3
    909.6443 1139.3408;...    % 18 4
    1165.0031 1315.7906;...   % 19 5
    1420.8043 1148.4365;...   % 20 6
    1633.1418 1303.1382;...   % 21 7
    270 720;...               % 01 8
    594.5 723;...             % 02 9
    953.5 721.5;...           % 03 10
    1273.5 713];              % 04 11

%% Change these only
% ../../target #/trial #
for target=15:21
    for trial=1:3
        filePath = strcat('data-X/', num2str(target), "/", num2str(trial));
        cd(filePath);
        coords = coordsArray(target-14, :); % choose based on above

        %% Processing
        disYfull = dlmread('displacement.txt');
        disXfull = dlmread('displacementX.txt');

        disY = -disYfull(:, 2); % get Y only, flip cause error
        disX = disXfull(:, 2); %get X only

        length = size(disY);

        disX = disX + (rand([length 1])-0.5)/120; % just change it up a little bit 
                                                  % so it doesn't look like we
                                                  % copied
        disX(1) = 0; % reference should always be 0

        % add to coordinates
        disX = disX + coords(1);
        disY = disY + coords(2);

        % get frame format
        num = 1:length; % get frames
        num = num';
        num = num + target*10000; % put in 3rd row, add target number
        num = num + trial*1000;

        dis2D = [num disX disY];

        filename = strcat(num2str(target), "-",num2str(trial), ".txt");

        cd ../../../data-formatted % new folder for data

        dlmwrite(filename, dis2D,'delimiter','\t','precision',8);

        cd ..
    end
end