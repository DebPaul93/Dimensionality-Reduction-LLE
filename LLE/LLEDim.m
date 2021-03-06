
%
%Created by Debjyoti Paul and Arnab Biswas M.Tech CS ISI%
%Reference:  http://www.cs.nyu.edu/~roweis/lle/algorithm.html% 
%this is an main function of Local Linear Embedding%
%==========================================================================

  %  Find neighbours in X space [b,c].

   % for i=1:N
   %   compute the distance from Xi to every other point Xj
   %   find the K smallest distances 
    %  assign the corresponding points to be neighbours of Xi
    %end

    %Solve for reconstruction weights W.

   % for i=1:N
     % create matrix Z consisting of all neighbours of Xi [d]
      %subtract Xi from every column of Z
     % compute the local covariance C=Z'*Z [e]
      %solve linear system C*w = 1 for w [f]
      %set Wij=0 if j is not a neighbor of i
      %set the remaining elements in the ith row of W equal to w/sum(w);
  %  end

 %   Compute embedding coordinates Y using weights W.

  %  create sparse matrix M = (I-W)'*(I-W)
  %  find bottom d+1 eigenvectors of M
  %    (corresponding to the d+1 smallest eigenvalues) 
  %  set the qth ROW of Y to be the q+1 smallest eigenvector
     % (discard the bottom eigenvector [1,1,1,1...] with eigenvalue zero)
%
%=========================================================================
%
%%
function Y = LLEDim(X,K,d)
fprintf('\nReducing Dimmension ..............\n');
M = findKmeanNeighbours(X,K);
W = findWeights(X,M);
[n,m]=size(X);
fprintf('Final Step ..............\n');
S = sparse(1:n,1:n,ones(1,n),n,n,4*K*n); 
for i=1:n
   fprintf('%f Percentage done ..............\n',i*100/n);
   w = W(:,i);
   j = M(i,:);
   S(i,j) = S(i,j) - w';
   S(j,i) = S(j,i) - w;
   S(j,j) = S(j,j) + w*w';
end;

% CALCULATION OF EMBEDDING
options.disp = 0; options.isreal = 1; options.issym = 1; 
[Y,eigenvals] = eigs(S,d+1,0,options);
Y = Y(:,2:d+1)'*sqrt(n); % bottom evect is [1,1,1,1...] with eval 0


fprintf(1,'Done.\n');

end
