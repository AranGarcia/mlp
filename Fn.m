function [F] = Fn(a,func)
%P5: Multilayer perceptron
%   Obtiene F(n) que se usa para calcular la sensitividad de una capa
%Fecha de elaboración: 2019/05/11
%Autor: Morales Flores Victor Leonel
%Asignatura: Neural Networks
%Escuela: ESCOM-IPN(MX)
    [filn,coln]=size(a);
    F=zeros(filn,filn);
    for i=1:filn
        %1.- Purelin
        %2.- Logsig
        %3.- Tansig
         if(func==1) 
             F(i,i)=1;
        elseif(func==2)
            F(i,i)=a(i,1)*(1-a(i,1));
        elseif((func==3))
            F(i,i)=1-(a(i,1))^2;
        end
    end
end

