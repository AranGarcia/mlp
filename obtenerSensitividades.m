function [S] = obtenerSensitividades(Fm,w,e,M,m,Sg)
%P5: Multilayer perceptron
    if(M==m)
        S=-2*(Fm)*e;
    else
        S=Fm*(w{1,m+1}.')*(Sg{1,m+1});
    end
    
end

