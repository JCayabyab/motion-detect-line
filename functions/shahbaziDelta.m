function [outputArg1,outputArg2] = shahbaziDelta(inputArg1,inputArg2)
%SHAHBAZIDELTA Summary of this function goes here
%   Detailed explanation goes here

It=double(rgb2gray(imread('I1.png'))); %new frame
It=imresize(It,[20 20]); %resizes to help with computation
figure;imshow(uint8(It)); truesize(gcf,[2000,2000]); hold on;
x1=8.9835; y1=9.9987; % must set manually?
plot(x1,y1,'r+'); % plots middle of target

Itplus1_orig=double(rgb2gray(imread('I2.png'))); %reference frame
Itplus1_orig=imresize(Itplus1_orig,[20 20]); %resizes to match input



MaxIter=100;
d=zeros(MaxIter+1,2);
d(1,:)=[0 0]; % does nothing?

for counter=1:MaxIter
    
    xplusd=[1:size(It,2)]+sum(d(1:counter,1));
    yplusd=[1:size(It,1)]+sum(d(1:counter,2));
    [xquery,yquery]=meshgrid(xplusd,yplusd);
    Itplus1=interp2(1:size(Itplus1_orig,2), 1:size(Itplus1_orig,1), Itplus1_orig, xquery, yquery,'cubic',NaN);


    %use first-order approximation
    [Gx, Gy] = imgradientxy(Itplus1,'central');

    E_d=((Itplus1-It));
    if counter==1
        figure;imagesc(E_d); title(['Iteration ' num2str(counter) ': I_t_+_1(x+d)-I_t(x) at d= [' num2str(sum(d(1:counter,1))) ',' num2str(sum(d(1:counter,2))) ']']);
        colorbar; 
        axis equal;
    end
    
    for i=1:size(Itplus1,1)
        for j=1:size(Itplus1,2)
            rondJ_tox_2(i,j)=Gx(i,j)^2;
            rondJ_tox_toy(i,j)=Gx(i,j)*Gy(i,j);
            rondJ_toy_2(i,j)=Gy(i,j)^2;
        end
    end
    
    %to calculate the energy function which must be minmized
    for i=1:size(Itplus1,1)
        for j=1:size(Itplus1,2)
            Ed_x(i,j)=Gx(i,j)*(It(i,j)-Itplus1(i,j));
            Ed_y(i,j)=Gy(i,j)*(It(i,j)-Itplus1(i,j));
        end
    end

    if counter==1
        figure;
        subplot(2,3,1);
        imagesc(rondJ_tox_2);title('(\deltaI_t_+_1/\deltax)^2');
        colorbar;
        axis equal;

        subplot(2,3,2);
        imagesc(rondJ_tox_toy);  title('\deltaI_t_+_1/\deltax * \deltaI_t_+_1/\deltay');
        colorbar;
        axis equal;



        subplot(2,3,3);
        imagesc(Ed_x);title('E_x');
        colorbar;
        axis equal;


        subplot(2,3,4);
        imagesc(rondJ_tox_toy);title('\deltaI_t_+_1/\deltax * \deltaI_t_+_1/\deltay');
        colorbar;
        axis equal;


        subplot(2,3,5);
        imagesc(rondJ_toy_2); title('(\deltaI_t_+_1/\deltay)^2');
        colorbar;
        axis equal;

        subplot(2,3,6);
        imagesc(Ed_y);title('E_y');
        colorbar;
        axis equal;
    end
    
    %Least square adjustment of displacement vector so that the energy can
    %be minimized
        
    A_mat=[];
    L_mat=[];
    
    k=1;
    for i=1:size(Itplus1,1)
        for j=1:size(Itplus1,2)
            if isnan(rondJ_tox_2(i,j))==0 && isnan(rondJ_tox_toy(i,j))==0 && isnan(rondJ_toy_2(i,j))==0 && isnan(Ed_x(i,j))==0 && isnan(Ed_y(i,j))==0 
                A_mat(k,1:2)=[rondJ_tox_2(i,j) rondJ_tox_toy(i,j)];
                A_mat(k+1,1:2)=[rondJ_tox_toy(i,j) rondJ_toy_2(i,j)];
                L_mat(k,1)=Ed_x(i,j);
                L_mat(k+1,1)=Ed_y(i,j);
                k=k+2;
            end
        end
    end

    if (k>=5)
        tmp=(A_mat'*A_mat)\(A_mat'*L_mat);
        d(counter+1,:)=tmp';
        lastcount=counter+1;
        
        if counter==MaxIter
            
            figure;imagesc(E_d); title(['Iteration ' num2str(counter) ': I_t_+_1(x+d)-I_t(x) at d= [' num2str(sum(d(1:counter+1,1))) ',' num2str(sum(d(1:counter+1,2))) ']']);
            colorbar; 
            axis equal;
        end
    else
        
        figure;imagesc(E_d); title(['Iteration ' num2str(counter) ': I_t_+_1(x+d)-I_t(x) at d= [' num2str(sum(d(1:counter,1))) ',' num2str(sum(d(1:counter,2))) ']']);
        colorbar; 
        axis equal;
        
        counter=MaxIter+1;
    end
    
end

d_final=[sum(d(1:lastcount,1)), sum(d(1:lastcount,2))];

x2=x1+d_final(1);
y2=y1+d_final(2);

figure;imshow(uint8(Itplus1_orig));truesize(gcf,[2000,2000]); hold on;
plot(x2,y2,'b+');

    

end

