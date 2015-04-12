fprintf('Loading and Visualizing Data ...\n')

load('swiss_roll_data.mat');
%load('ex3data11.mat');
X = X_data(:,1:5000)';

 N=size(X, 1);
  K=70;
  d=2;

 Y=LLEDim(X,K,d);