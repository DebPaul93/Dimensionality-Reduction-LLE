% SWISS ROLL DATASET

  N=2000;
  K=2;
  d=2; 

clf; colordef none; colormap jet; set(gcf,'Position',[200,400,620,200]);

% PLOT TRUE MANIFOLD
  tt0 = (3*pi/2)*(1+2*[0:0.02:1]); hh = [0:0.125:1]*30;
  xx = (tt0.*cos(tt0))'*ones(size(hh));
  yy = ones(size(tt0))'*hh;
  zz = (tt0.*sin(tt0))'*ones(size(hh));
  cc = tt0'*ones(size(hh));

  subplot(1,3,1); cla;
  surf(xx,yy,zz,cc);
  view([12 20]); grid off; axis off; hold on;
  lnx=-5*[3,3,3;3,-4,3]; lny=[0,0,0;32,0,0]; lnz=-5*[3,3,3;3,3,-3];
  lnh=line(lnx,lny,lnz);
  set(lnh,'Color',[1,1,1],'LineWidth',2,'LineStyle','-','Clipping','off');
  axis([-15,20,0,32,-15,15]);

% GENERATE SAMPLED DATA
  tt = (3*pi/2)*(1+2*rand(1,N));  height = 21*rand(1,N);
  X = [tt.*cos(tt); tt.*sin(tt); height];

% SCATTERPLOT OF SAMPLED DATA
  subplot(1,3,2); cla;
  scatter3(X(1,:),X(2,:),X(3,:),12,tt,'+');
  view([12 20]); grid off; axis off; hold on;
  lnh=line(lnx,lny,lnz);
  set(lnh,'Color',[1,1,1],'LineWidth',2,'LineStyle','-','Clipping','off');
  axis([-15,20,0,32,-15,15]); drawnow;
 
% RUN LLE ALGORITHM
fprintf(1,'Starting Local Linear Embedding\n');
fprintf(1,'Input vector size [%d %d]\n',size(X'));
fprintf(1,'Desired dimmension %d\n',d);
fprintf(1,'Neighbours %d\n',K);

Y=LLEDim(X',K,d);
figure;
% SCATTERPLOT OF EMBEDDING

  scatter(Y(1,:),Y(2,:),12,tt,'+');
  grid off;
  set(gca,'XTick',[]); set(gca,'YTick',[]); 


