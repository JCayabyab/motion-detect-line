clear;

cd data/15/1
dis1 = dlmread('displacement.txt');
cd ../../16/1
dis2 = dlmread('displacement.txt');

cd ../../..

plotData(dis1, dis2);