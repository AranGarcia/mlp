function []= ImprimirStoping(a,fid)
f='%1.3f';
[fa,ca] = size(a);
for i=1:fa
    for j=1:ca
        
        fprintf(fid,f,a(i,j));
        fprintf(fid,' ');
    end
    
end

fprintf(fid,'\n');
end