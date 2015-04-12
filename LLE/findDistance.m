%Created by Debjyoti Paul and Arnab Biswas M.Tech CS ISI%
%Reference:  http://www.cs.nyu.edu/~roweis/lle/algorithm.html% 
%this is an auxilary function to calculate distance between two vectors%

function distance = findDistance(X,row1,row2)
% =============================================================

 [m,n] = size(X);
 sum = 0;

distance = norm(X(row1,:)-X(row2,:));




% =============================================================

end

%for i = 1:n
  %  sum = sum + (X(row1,i) - X(row2,i))^2;
    
%end

%distance = sum^0.5;