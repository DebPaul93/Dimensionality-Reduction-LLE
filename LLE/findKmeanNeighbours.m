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


function M = findKmeanNeighbours(X,K)
[m,n]=size(X);
cluster = ceil(m/K);

[idx,C,sumd,D] = kmeans(X,ceil(m/K));
[D1,Id] = sort(D,2);
fprintf('Finding Neighbours ..............\n');
for i =1 : m
    for j = 1:m
        dist(i,j) = inf;
    end
end


for i = 1: m
     fprintf('%f Percentage done ..............\n',(i-1)*100/m);
k = 0;
    for j = 1 : cluster
        l = Id(j);
        list = find(idx == l);
        k = k + length(list);
        for z = 1: length(list)
            dist(i,list(z)) = findDistance(X,i,list(z));
        end 
        if(k > K)
            break;
        end
    end
end
% =============================================================
[dist,N] = sort(dist,2);

%N(m,m)= 0;

%for i = 1:m
%    for j = 1:m
%[dist(i,:),N(i,:)] = sort(dist(i,:),2);

%    end
%end
size(N)
M = N(:,1:K);
fprintf('Computed Neighbours ..............\n');
end