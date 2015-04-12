fprintf('Loading and Visualizing Data ...\n')

load('ex3data1.mat');
y = M(:,1);
X = M(:,2:end);
 N=size(X, 1);
  K=20000;
  d=200;
 L= length(X)/2;
 X1 = X(1:L,:);
 Y=LLEDim(X1,K,d);