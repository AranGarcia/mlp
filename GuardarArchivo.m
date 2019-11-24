function GuardarArchivo(epoch,Win,bin,M,opc)
%P3: Aprendizaje del perceptron 
%   Con el fin de un código mas legible se crea esta función encargará
%   de escribir en un archivo de texto 'results.txt' todos los valoers 
%   a2 junto con 'i' que corresponde al número de epoca en la que 
%   se generaron esos valores. opc permite que decidamos entre 'w' para
%   reescribir el archivo en caso que exista o 'a' para escribir al final 
%   del mismo si es que existe.
    for i=1:M
       textW="W"+num2str(i)+".txt";
       textb="b"+num2str(i)+".txt";
       w=Win{1,i};
       b=bin{1,i};
       [f,c]=size(w);
       results1=fopen(textW,opc);
       results2=fopen(textb,opc);
       fprintf(results1,"%d ",epoch);
       fprintf(results2,"%d ",epoch);
       %Adapta el peso en solo una fila
       warc=reshape(w,[1,f*c]);
       barc=reshape(b,[1,f]);
       for j=1:f*c
            fprintf(results1,"%d ",warc(1,j));
        end
        for j=1:f
            fprintf(results2,"%d ",barc(1,j));
        end
        fprintf(results1,"\n");
        fprintf(results2,"\n");
        fclose(results1);
        fclose(results2); 
    end      
end
