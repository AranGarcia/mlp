function GraficarPolinomio (p,target,p2,results)
%P5: Multilayer perceptron
%   Funcion para graficar el polinomio que se esta usando 
    etiquetas=["targets","results"];
    figure(1);
    plot(p,target,"o"); 
    hold on;
    plot(p2,results,"x"); 
    %Configuracion de la grafica a mostrar
    xticks(min(p):0.5:max(p));
    yticks(min(target):max(target));
    title('Polinomio');
    xlabel('Rango de senial');
    ylabel('Valores');
    legend(etiquetas);
end
