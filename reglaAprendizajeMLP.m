function [wp,bp] = reglaAprendizajeMLP(w,b,a,alfa,S)
%P5: Multilayer perceptron
%   Hace calculo de la nueva matriz de pesos y del nuevo bias con base a
%   la sensitividad, alfa, a y  w/b anteriores
    format long
    wp=w-alfa*(S)*(a.');
    format long
    bp=b-alfa*S;
    
end

