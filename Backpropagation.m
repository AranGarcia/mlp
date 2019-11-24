function [Wbp,bbp] = Backpropagation(W,b,a,M,func,e,alfa,p)
%P5: Multilayer perceptron
%   Implementa el algoritmo backpropagation obteniendo las 
%   F(n)[derivadas de las funciones], las sensitividades y la propagacion
%   hacia atras del error
%Fecha de elaboración: 2019/05/11
%Autor: Morales Flores Victor Leonel
%Asignatura: Neural Networks
%Escuela: ESCOM-IPN(MX)

    %Generamos celdas para almacenar los valores de F(n) y sensitividad de
    %cada capa; asi como el nuevo valor de W(Wbp) y b(bbp) que retornara la funcion
    Fns=cell(1,M);
    S=cell(1,M);
    Wbp=cell(1,M);
    bbp=cell(1,M);
    %Obtenemos Fn y sensitividades para todas las capas
    for m=M:-1:1
        Fns{1,m}=Fn(a{1,m},func(m,1));
        S{1,m}=obtenerSensitividades(Fns{1,m},W,e,M,m,S);
    end
    
    %Se calculan los nuevos valores de W's y b's con la regla de
    %aprendizaje del MPL
    for m=M:-1:1
        %Se tiene que pasar a(t-1) a la regla de aprendizaje
        if(m>1)
            a_aux=a{1,m-1};
        else
            a_aux=p;
        end
        [Wbp{1,m},bbp{1,m}]= reglaAprendizajeMLP(W{1,m},b{1,m},a_aux,alfa,S{1,m});
    end
end

