clc;close all;clear;
eps1=0.05;
u=-pi/2:eps1:pi/2; 
v=-(pi+eps1):eps1:pi; 
[X,Y]=meshgrid(u,v);
x=X;
y=cosh(X).*cos(Y);
z=cosh(X).*sin(Y);
fs=surf(x,y,z);
fp=surf2patch(fs);
close all
patch('faces',fp.faces(1:1,:),'vertices',fp.vertices, 'FaceColor', 'b' ,'edgecolor','none') ; 
view(3)
az=90;el=90;
 view([az,el])
 camlight;
lighting phong;
 lighting gouraud
 fp_shift = circshift(fp.faces,1,2);
 faces1=[fp.faces(:,1:3);fp_shift(:,1:3);fp.faces(:,2:4)];
 trimesh(faces1,fp.vertices(:,1),fp.vertices(:,2),fp.vertices(:,3))
 example.POSITION =fp.vertices;
 example.indices =faces1;
 write_glb('example2catenoid_full.glb', example);