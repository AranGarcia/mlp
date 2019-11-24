function [e,he] = errorAprendizaje(t,a)
%P3: Aprendizaje del perceptron 
%   Calcula el valor de error y lo devuelve junto con true en caso de que
%   exista error(sum(e)>eepoch)
%Fecha de elaboración: 2019/04/22
%Autor: Morales Flores Victor Leonel
%Asignatura: Neural Networks
%Escuela: ESCOM-IPN(MX)
    format long
    e=(t-a);
    
    he=false;
    if sum(e)~=0
       he=true;
    end
end

