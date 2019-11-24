function ImprimirFinal(a,fid)
f='%1.3f';

        fprintf(fid,'Error de Entrenamiento: ');
        fprintf(fid,f,a(1));
        fprintf(fid,'  ');

        fprintf(fid,'Error de Validacion: ');
        fprintf(fid,f,a(2));
        fprintf(fid,'  ');
        
        fprintf(fid,'Error de Prueba: ');
        fprintf(fid,f,a(3));
        fprintf(fid,'  ');

end