function GraficarEvolucion (M,R,S)
    %Funcion que permite graficar toddos los valores obtenidos. 
    %Recibe S para poder leer de forma adecuada el archivo que contiene los datos.
%Fecha de elaboracion: 2019/04/22
%Autor: Morales Flores Victor Leonel
%Asignatura: Neural Networks
%Escuela: ESCOM-IPN(MX)
    W=cell(1,M);
    b=cell(1,M);
    rAux=R;
    figura=3;
    
    for i=1:M
       textW="W"+num2str(i)+".txt";
       textb="b"+num2str(i)+".txt";
       results1=fopen(textW,"r");
       results2=fopen(textb,"r");
       etiquetas="";
       
       %Formato de lectura del archivo
       filas=S(i,1)*R+1;
       sizeRes=[filas Inf];
       %Se recupera en Res la matriz de resultados y se cierra el archivo
       %results.txt
       %%ESTO ES DE LOS PESOS
       Res=fscanf(results1,"%f",sizeRes);
       Res=Res.';
       [f,c]=size(Res);
       epoca=Res(:,1);
       figure(figura);
       for l=2:c
           plot(epoca,Res(:,l),"-");
           hold on
       end
       titulow=['Capa ',num2str(i),': Evolución de W'];
       %Configuracion de la grafica a mostrar
        xticks(min(epoca):max(epoca));
        yticks(min(Res(:,l)):max(Res(:,l)));
        title(titulow);
        xlabel('Epocas');
        ylabel('Valores');
       figura=figura+1;
       %%ESTO ES DEL BIAS
       filas=S(i,1)+1;
       sizeRes=[filas Inf];
       Res=fscanf(results2,"%f",sizeRes);
       Res=Res.';
       [f,c]=size(Res);
       epoca=Res(:,1);
       
       %%%%%%%%%%%%%%AQUI
       figura=figura+1;
       figure(figura);
       plot(epoca,Res(:,2),"-");
       titulob=['Capa ',num2str(i),': Evolución de bias'];
       %Configuracion de la grafica a mostrar
       xticks(min(epoca):max(epoca));
       yticks(min(Res(:,2)):max(Res(:,2)));
       title(titulob);
       xlabel('Epocas');
       ylabel('Valores');
       figura=figura+1;
       %%%%%%%%%%%%%
       R=S(i,1);
       fclose(results1);
       fclose(results2); 
    end
    R=rAux;
    clearvars results1 results2
end
