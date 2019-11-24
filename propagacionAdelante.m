function [as] = propagacionAdelante(capas,W,b,p,func)
%P5: Multilayer perceptron
%   Funcion para hacer propagar un valor p hacia todas las capas de la red
    an=p;
    as=cell(1,capas);
    for i=1:capas
        if(func(i,1)==1) 
            an=fpurelin(W{1,i},an,b{1,i});
        elseif(func(i,1)==2)
            an=flogsig(W{1,i},an,b{1,i});
        elseif((func(i,1)==3))
            an=ftansig(W{1,i},an,b{1,i});
        end
        as{1,i}=an;
    end
    

end

