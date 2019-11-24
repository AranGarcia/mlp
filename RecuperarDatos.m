function [W,b,epoca] = RecuperarDatos(M,R,S)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

    W=cell(1,M);
    b=cell(1,M);
    rAux=R;
    for i=1:M
       textW="W"+num2str(i)+".txt";
       textb="b"+num2str(i)+".txt";
       results1=fopen(textW,"r");
       results2=fopen(textb,"r");
       
       
       %Formato de lectura del archivo
       filas=S(i,1)*R+1;
       sizeRes=[filas Inf];
       %Se recupera en Res la matriz de resultados y se cierra el archivo
       %results.txt
       %%ESTO ES DE LOS PESOS
       Res=fscanf(results1,"%f",sizeRes);
       Res=Res.';
       [f,c]=size(Res);
       epoca=Res(end,1);
       waux=Res(end,2:end);
       wreshaped=reshape(waux,[S(i,1),R]);
       W{1,i}=wreshaped;
       %wreshaped
       %%ESTO ES DEL BIAS
       filas=S(i,1)+1;
       sizeRes=[filas Inf];
       Res=fscanf(results2,"%f",sizeRes);
       Res=Res.';
       [f,c]=size(Res);
       epoca=Res(end,1);
       baux=Res(end,2:end);
       breshaped=reshape(baux,[S(i,1),1]);
       b{1,i}=breshaped;
       %%%%%%%%%%%%%
       R=S(i,1);
       fclose(results1);
       fclose(results2); 
    end
    R=rAux;
    clearvars results1 results2
end

