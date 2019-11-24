function [ptrain,ttrain,pval,tval,ptest,ttest]=separarDatos(p,targets,opcDatos)
 % 1)80% Entrenamiento, 10% Validación, %10% Prueba
 % 2)70% Entrenamiento, 15% Validación, %15% Prueba
 [fp,cp]=size(p);
 train=1;
 val=1;
 test=1;
    if(opcDatos==1)
        train=ceil(fp*(0.8));
        test=floor(fp*(0.1));
        val=floor(fp*(0.1));
    elseif(opcDatos==2)
        train=ceil(fp*(0.7));
        test=floor(fp*(0.15));
        val=floor(fp*(0.15));
    end
    %Obtenemos el mas grande y pequeño de p para colocarlo en el train
    indice=1;
    ptrain(indice)=p(find(max(p)));
    ttrain(indice)=targets(find(max(p)));
    targets(find(max(p))) = [];
    p(find(max(p))) = [];
    indice=indice+1;
    train=train-1;
    ptrain(indice)=p(find(min(p)));
    ttrain(indice)=targets(find(min(p)));
    targets(find(min(p))) = [];
    p(find(min(p))) = [];
    indice=indice+1;
    train=train-1;
    
    salto=round(fp/train);
    s=salto;
    while(train>0)
        [fp,cp]=size(p);
        index=mod(s,fp)+1;
        ptrain(indice,1)=p(index,1);
        ttrain(indice,1)=targets(index,1);
        targets(index) = [];
        p(index) = [];
        train=train-1;
        indice=indice+1;
        s=s+salto;
    end
    [fp,cp]=size(p);
    indice=1;
    salto=round(fp/val);
    s=salto;
    while(val>0)
        [fp,cp]=size(p);
        index=mod(s,fp)+1;
        pval(indice,1)=p(index,1);
        tval(indice,1)=targets(index,1);
        targets(index) = [];
        p(index) = [];
        val=val-1;
        indice=indice+1;
        s=s+salto;
    end
    ptest=p;
    ttest=targets;
end

