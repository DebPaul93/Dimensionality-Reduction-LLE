%
%Created by Debjyoti Paul and Arnab Biswas M.Tech CS ISI%
%Reference:  http://www.cs.nyu.edu/~roweis/lle/algorithm.html% 
%this function finds the weight matrix of local neighbours%
%Solve for reconstruction weights W.

   % for i=1:N
     % create matrix Z consisting of all neighbours of Xi [d]
      %subtract Xi from every column of Z
     % compute the local covariance C=Z'*Z [e]
      %solve linear system C*w = 1 for w [f]
      %set Wij=0 if j is not a neighbor of i
      %set the remaining elements in the ith row of W equal to w/sum(w);
  %  end
%%
function W = findWeights(X,M)
fprintf('Finding Weights ..............\n');
[m1,K]=size(M);
[m2,n]=size(X);

if(K>n) 
  fprintf(1,'   [note: No. of Neighbours > Dimmension of input vectors; regularization will be used]\n'); 
  tol=1e-3; % regularlizer in case constrained fits are ill conditioned
else
  tol=0;
end
W = zeros(K,m1);
O = ones(K,1);
opts.UT = true; opts.TRANSA = false;
for i = 1:m1
   z = X(M(i,:),:)-repmat(X(i,:),K,1); % shift ith pt to origin
   C = z*z';                                        % local covariance
   C = C + eye(K,K)*tol*trace(C);                   % regularlization (K>D)
   %W(:,i) = C\O;
   
   W(:,i) = linsolve(C,O,opts);% solve Cw=1
   W(:,i) = W(:,i)/sum(W(:,i));                  % enforce sum(w)=1

end
fprintf('Heavy Weight ..............\n');

end