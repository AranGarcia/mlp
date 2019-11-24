%%%%%%%%%%%%%%%%%%%%%% 
% Entrada de usuario %
%%%%%%%%%%%%%%%%%%%%%%

% Ingrese el numero del polinomio deseado
archivoP = '2';
% 1)80% Entrenamiento, 10% Validacion, 10% Prueba
% 2)70% Entrenamiento, 15% Validacion, 15% Prueba
% Indica la forma de separar los datos que desea
opcDatos = 2;
v1txt = 'C:\\Users\\docto\\OneDrive\\Documentos\\escuela\\neuralnetworks\\practicas\\p5\\reloaded\\arquitecturas\\v1pol2.txt';
v2txt = 'C:\\Users\\docto\\OneDrive\\Documentos\\escuela\\neuralnetworks\\practicas\\p5\\reloaded\\arquitecturas\\v2pol2.txt';
% Indica el factor de aprendizaje
alfa = 0.05;
% Indica el maximo de Epocas: 
max_epoch= 10;
% Indica el error maximo tolerable
eepoch = 0.01
% Indica cada cuanto sera� la Epoca de validacion
eepoch_val= 2;
% Indica el numero maximo de intentos del error de validacion
num_val = 3;
% Usara archivo para pesos y bias? 1-Si. 0-No
archi = 0;

[R,S,func] = lecturaVectores(v1txt, v2txt);
Eepoch=0;
eStoping=fopen('EStoping.txt','w');%txt donde se guardaran los valores del error de epoca
Final=fopen('ValoresF.txt','w');%txt donde se guardaran los valores finales
vf=[0,0,0];
[R,S,func] = lecturaVectores(v1txt, v2txt);
[p,targets]=lecturaDataSet(archivoP);

%Aquí se seleccionan los valores que se agarraban en la función lecturaDataset();
%R=Vector1(1,1);
%S=Vector1(2:end,1);
%func=Vector2(1:end,1);
%Generacion aleatoria de pesos y bias----------------------------------
[fS,cS]=size(S);
%Numero de capas
M=fS;
if archi==0
    epoca=0;
    W=cell(1,M);
    b=cell(1,M);
    rAux=R;
    for i=1:M
        W{1,i}=generacionW(S(i,1),R);
        b{1,i}=generacionBias(S(i,1));
        R=S(i,1);
    end
    R=rAux;
    GuardarArchivo(epoca,W,b,M,"w");
    GuardarEepoch(epoca,Eepoch,"w",1);
    GuardarEepoch(epoca,Eepoch,"w",0);
else
    [W,b,epoca] = RecuperarDatos(M,R,S);
end

%Dividimos los datos
[ptrain,ttrain,pval,tval,ptest,ttest]=separarDatos(p,targets,opcDatos);
%%%%%%%%%%%%%%%%%%%%%%%%%
WStopping=cell(1,M);
BStopping=cell(1,M);
%%%%%%%%%%%%%%%%%%%%%%%%%

%Tamanio de p
[fptrain,cptrain]=size(ptrain);
[fpval,cpval]=size(pval);
[fptest,cptest]=size(ptest);

%Propagacion
ErrorEarly=-1;
EarlyStopping=0;
for k=1:max_epoch
    epoca=epoca+1;
    if EarlyStopping==num_val
        fprintf('\nSe activa EARLY-STOPPING!!!');
        W=WStopping;
        b=BStopping;
        GuardarArchivo(epoca,W,b,M,"a");
        break;
    end
    fprintf(strcat("\nEpoca ",int2str(epoca),":"));
    Eepoch=0;
    
    if(mod(k, eepoch_val)==0)
        fprintf("\n***Iniciando Validacion***");
        for valp=1:fpval
            a=propagacionAdelante(M,W,b,pval(valp,1),func);
            [e,he]=errorAprendizaje(tval(valp,1),a{1,M});
            Eepoch=Eepoch+abs(e);
        end
        Eepoch=Eepoch/fpval;
        %Sustituye imprimeStoping a fprintf?
        fprintf("\n>>>>>Error de epoca %d: %f",epoca,Eepoch);
        GuardarEepoch(epoca,Eepoch,"a",1);
        ImprimirStoping(Eepoch,eStoping);%Guarda el valor de error de epoca el cual se graficara
        %verifica si si hay incremento en el error  de epoca de validacion
        if ErrorEarly==-1
            ErrorEarly=Eepoch;
            WStopping=W;
            BStopping=b;
        elseif Eepoch>ErrorEarly
            EarlyStopping=EarlyStopping+1;
        else
            ErrorEarly=Eepoch;
            EarlyStopping=0;
            WStopping=W;
            BStopping=b;
        end
        
    else
        %Entrenamiento
        fprintf("\n---Entrenamiento---");
        for valp=1:fptrain
            a=propagacionAdelante(M,W,b,ptrain(valp,1),func);
            %M porque ahi se encuentra la salida de la ultima capa de
            %la red
            [e,he]=errorAprendizaje(ttrain(valp,1),a{1,M});
            %abs de e?
            Eepoch=Eepoch+abs(e);
            [W,b] =Backpropagation(W,b,a,M,func,e,alfa,ptrain(valp,1));
        end
        Eepoch=Eepoch/fptrain;
        GuardarArchivo(epoca,W,b,M,"a");
        GuardarEepoch(epoca,Eepoch,"a",0);
        %Falta guardar pesos y bias de cada epoca
        fprintf("\n>>>>>Error de epoca %d: %f",epoca,Eepoch);
        if(Eepoch<eepoch )
            fprintf("\n>>>>>>El valor de error de la red es menor al error tolerable. Acaba entrenamiento");
            break;
        end
    end
end
[vf(1),vf(2)]=GraficarEepoch(1);
fprintf("\n---Prueba---");
%size(ptest)
%size(ttest)
%ttest
Eepoch=0;
y=zeros(fptest,1);
for valp=1:fptest
    a=propagacionAdelante(M,W,b,ptest(valp,1),func);
    y(valp,1)=a{1,M};
    %M porque ahi se encuentra la salida de la ultima capa de
    %la red
    [e,he]=errorAprendizaje(ttest(valp,1),a{1,M});
    Eepoch=Eepoch+abs(e);
    %fprintf("\n a: %f | target: %f | error: %f",a{1,M},ttest(valp,1),e);
    
end
Eepoch=Eepoch/fptest;
fprintf("\nError de epoca de prueba:%f",Eepoch);
vf(3)=Eepoch;
ImprimirFinal(vf,Final);%Guarda el valor de error de epoca el cual se graficara)
%Visualizacion del polinomio a tratar
GraficarPolinomio(ptest,ttest,ptest,y);
GraficarEvolucion(M,R,S);

fprintf("\n\n\nError de Entrenamiento Final:%f",vf(1));
fprintf("\nError de Validacion Final:%f",vf(2));
fprintf("\nError de Prueba Final:%f\n",vf(3));

