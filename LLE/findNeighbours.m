%
%Created by Debjyoti Paul and Arnab Biswas M.Tech CS ISI%
%Reference:  http://www.cs.nyu.edu/~roweis/lle/algorithm.html% 

%this function finds the Neighbouring points of each points%
%  Find neighbours in X space [b,c].

   % for i=1:N
   %   compute the distance from Xi to every other point Xj
   %   find the K smallest distances 
    %  assign the corresponding points to be neighbours of Xi
    %end

%%


function M = findNeighbours(X,K)
 % =============================================================
[m,n]=size(X);
fprintf('Finding Neighbours ..............\n');
dist = zeros(m,m);
for i = 1:m
    for j = 1:m
 dist(i,j) = findDistance(X,i,j);
 
    end
% =============================================================
end
[dist,N] = sort(dist,2);

%N(m,m)= 0;

%for i = 1:m
%    for j = 1:m
%[dist(i,:),N(i,:)] = sort(dist(i,:),2);

%    end
%end

M = N(:,1:K);
fprintf('Computed Neighbours ..............\n');
end