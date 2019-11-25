function [r,S,func] = lecturaVectores(v1, v2)
v1=load(v1);
r=v1(1);
S=v1(2:end);
S=transpose(S);
func=load(v2);
func=transpose(func);
end

