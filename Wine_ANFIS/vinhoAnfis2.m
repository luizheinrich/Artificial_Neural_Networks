%==========================================================================
% ENGENHARIA ELÉTRICA
% INTELIGÊNCIA COMPUTACIONAL
% DOCENTE: ADRIANA ROSA GARCEZ CASTRO
% ALuNO: LUIZ HENRIQuE P. ASSUNÇÃO

% INÍCIO DO CÓDIGO ========================================================



% Carrega o arquivo .txt que contém o banco de dados
file = 'VinhoDataSet.txt';
database=load(file);

DATA = transpose(database);

A1 = DATA(1,:);
A2 = DATA(2,:);
A3 = DATA(3,:);
A4 = DATA(4,:);
A5 = DATA(5,:);
A6 = DATA(6,:);
A7 = DATA(7,:);
A8 = DATA(8,:);
A9 = DATA(9,:);
A10 = DATA(10,:);
A11 = DATA(11,:);
A12 = DATA(12,:);
A13 = DATA(13,:);

B1 = DATA(14,:);


% ENTRADAS:
Entrada = [A1;A2;A3];
% ;A4;A5;A6;A7;A8;A9;A10;A11;A12;A13

% SÁIDA:
Saida = B1;


for i = 1:3
    
    
    Xa.i = transpose([Entrada(:,1:39)'; Entrada(:,60:110)'; Entrada(:,131:158)']);
    
    Xb.i = transpose([Entrada(:,50:59)'; Entrada(:,121:130)'; Entrada(:,169:178)']);
    
    Xc.i = transpose([Entrada(:,40:49)'; Entrada(:,111:120)'; Entrada(:,159:168)']);
    
    
end



Ya = transpose([Saida(:,1:39)'; Saida(:,60:110)'; Saida(:,131:158)']);

Yb = transpose([Saida(:,50:59)'; Saida(:,121:130)'; Saida(:,169:178)']);

Yc = transpose([Saida(:,40:49)'; Saida(:,111:120)'; Saida(:,159:168)']);


Y = [Saida(:,1:39)'; Saida(:,60:110)'; Saida(:,131:158)'];

% TREINO
Treino  = transpose([Xa.i;Ya]);

% TESTE
Teste = transpose([Xb.i;Yb]);

% VALIDAÇÃO
Validacao = transpose([Xc.i;Yc]);

% Validacao = transpose([Xc.i;Yc]);


%C = evalfis(Treino(:,1:5),fis1);
%plot(C,'rx');
%hold
%plot(Treino(:,6));


%SaidaTeste = (Treino(:,6));


% Erro - (Saída - Entrada)
%Erro  =  C-SaidaTeste;

% Quadrado do Erro
%Quadrado = Erro.^2;

% ERRO MÉDIO QUADRÁTICO
%MSE = Quadrado./2;

% Media do MSE
%MSETotal = (sum(Quadrado))./118;








%n     = 3; 
%tipo  = 'gaussmf';
%epoca = 20;
%fis1  = genfis(Treino,n,tipo);
%out_fis1 = anfis(Treino,fis1,epoca);

%d = evalfis(Treino(:,1:13),out_fis1);

