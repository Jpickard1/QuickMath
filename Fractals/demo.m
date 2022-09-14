clear all
seg = [0 0; 1 1]


plot(seg(:,1), seg(:,2),'.-b')
hold on
plot(child(:,1), child(:,2),'.-g')
plot(c(:,1), c(:,2),'.-r')


%%
col=50;
m=300;
cx=0;
cy=0;
l=10;
x=linspace(cx-l,cx+l,m);
y=linspace(cy-l,cy+l,m);
[X,Y]=meshgrid(x,y);
Z=X +i*Y;
c=-0.5-i*0.8660254;
for k=1:col;
Z=2/3*Z + 1/3*1./(eps+Z.^2);
end
W=abs(Z-c);
A=angle(Z);
colormap prism(256);
pcolor(W-A);
shading flat;
axis('square','equal','off');

%%
n = 9
FraktalT(n,1,[pi/4,-pi/4],[0,0],[0,1])
close all
