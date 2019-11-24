function [r,S,func] = lecturaVectores(v1, v2)
% [v1, Dir_Arch] = uigetfile('*.txt', 'Seleccione el Arhivo TXT de V1');
% [v2, Dir_Arch2] = uigetfile('*.txt', 'Seleccione el Arhivo TXT de V2');
% v1 = strcat(Dir_Arch, v1);
% v2 = strcat(Dir_Arch, v2);
v1=load(v1);
r=v1(1);
S=v1(2:end);
S=transpose(S);
func=load(v2);
func=transpose(func);
end

