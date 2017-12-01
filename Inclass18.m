% In class 18
% GB comments
1. 100 the masks were not the best which affects how you will define the parameters within the function imfindcircles.  Focusing on better masks made the end result better on my end. 
2. 100
Overall:100


% Problem 1. In this directory, you will find the same image of yeast cells as you used
% in homework 5. First preprocess the image any way you like - smoothing, edge detection, etc. 
% Then, try to find as many of the cells as you can using the
% imfindcircles routine with appropriate parameters. 
% Display the image with the circles drawn on it.

yeast = imread('yeast.tif');
yeast = yeast > 55;
imshow(yeast,[]);
yeast = imdilate(yeast,strel('disk',5));
yeast2 = imfill(yeast,'holes');
imshow(yeast2,[]);
yeast = imsubtract(yeast2,yeast);
imshow(yeast,[]);

hx = fspecial('sobel');
hy = hx';
Iy = imfilter(double(yeast),hy,'replicate');
Ix = imfilter(double(yeast),hx,'replicate');
edge_img = sqrt(Ix.^2+Iy.^2);
imshow(edge_img,[])

[centers, radii] = imfindcircles(edge_img,[15 25],'Sensitivity',0.96);
figure; imshow(edge_img,[]); hold on;
for ii = 1:length(centers)
    drawcircle(centers(ii,:),radii(ii),'m');
end

figure; imshow(yeast,[]); hold on; 
for ii = 1:length(centers)
    drawcircle(centers(ii,:),radii(ii),'m');
end

% Problem 2. (A) Draw two sets of 10 random numbers - one from the integers
% between 1 and 9 and the second from the integers between 1 and 10. Run a
% ttest to see if these are significantly different. (B) Repeat this a few
% times with different sets of random numbers to see if you get the same
% result. (C) Repeat (A) and (B) but this time use 100 numbers in each set
% and then 1000 numbers in each set. Comment on the results. 

%a
% xx = randi(9,10,1);
% yy = randi(10,10,1);
% 
% [is_sig, pval] = ttest2(xx,yy)

%The p-value is 0.1607, which is not considered significant.

%b

xx = randi(9,10,1);
yy = randi(10,10,1);
[is_sig, pval] = ttest2(xx,yy) %pval = 0.3664, not significant

xx = randi(9,10,1);
yy = randi(10,10,1);
[is_sig, pval] = ttest2(xx,yy) %pval = 0.3186, not significant

xx = randi(9,10,1);
yy = randi(10,10,1);
[is_sig, pval] = ttest2(xx,yy) %pval = 0.0674, not significant though close

xx = randi(9,10,1);
yy = randi(10,10,1);
[is_sig, pval] = ttest2(xx,yy) %pval = 0.0874, not significant

xx = randi(9,10,1);
yy = randi(10,10,1);
[is_sig, pval] = ttest2(xx,yy) %pval = 0.3185, not significant


%When running a t-test with random numbers, the results change every time, with instances that are
%significant and others that are not, as shown above.

%c

aa = randi(9,100,1);
bb = randi(10,100,1);
[is_sig, pval] = ttest2(aa,bb) %pval = 0.9596, not significant

aa = randi(9,100,1);
bb = randi(10,100,1);
[is_sig, pval] = ttest2(aa,bb) %pval = 5.1994e-04, significant

aa = randi(9,100,1);
bb = randi(10,100,1);
[is_sig, pval] = ttest2(aa,bb) %pval = 0.2452, not significant


cc = randi(9,1000,1);
dd = randi(10,1000,1);
[is_sig, pval] = ttest2(cc,dd) %pval = 0.0014, significant

cc = randi(9,1000,1);
dd = randi(10,1000,1);
[is_sig, pval] = ttest2(cc,dd) %pval = 3.3854e-06, significant

cc = randi(9,1000,1);
dd = randi(10,1000,1);
[is_sig, pval] = ttest2(cc,dd) %pval = 7.2323e-04, significant

%T-tests compares the data according to what is expected under the null
%hypothesis, which that the two samples of data are not different. If the t-test yields a value
%under p = 0.05, then one is able to theorize with some confidence that the
%two samples are different. In regards to sample size, the greater the
%number of values in the two populations of data that are being compared,
%the more "certainty" there is that the data is consistent within the population and if
%there is indeed a difference between the populations, the t-test is more rigorous. 

%With the data above, the t-tests run with 100 random numbers yielded 1/3
%significant p-values, whereas the t-tests run with 1000 numbers yielded 3/3
%significant p-values, indicating that the two datasets that were randomly
%generated in the larger sample size were more likely to be significantly
%different than the sets generated in the smaller sample size.




