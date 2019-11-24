function [S] = obtenerSensitividades(Fm,w,e,M,m,Sg)
%P5: Multilayer perceptron
%   Calcula la sensitivdad de una capa de la red
%Autor: Morales Flores Victor Leonel
%Asignatura: Neural Networks
%Escuela: ESCOM-IPN(MX)
    if(M==m)
        S=-2*(Fm)*e;
    else
        S=Fm*(w{1,m+1}.')*(Sg{1,m+1});
    end
    
end

