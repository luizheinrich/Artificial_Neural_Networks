%==========================================================================
% ENGENHARIA ELÉTRICA
% INTELIGÊNCIA COMPUTACIONAL
% DOCENTE: ADRIANA ROSA GARCEZ CASTRO
% ALuNO: LUIZ HENRIQuE P. ASSUNÇÃO

% INÍCIO DO CÓDIGO ========================================================

% REDE DA CLASSE 2

% Carrega o arquivo .txt que contém o banco de dados
file = 'VinhoDataSet.txt';
database=load(file);

DATA = transpose(database);

X1 = DATA(1,:);
X2 = DATA(2,:);
X3 = DATA(3,:);
X4 = DATA(4,:);
X5 = DATA(5,:);
X6 = DATA(6,:);
X7 = DATA(7,:);
X8 = DATA(8,:);
X9 = DATA(9,:);
X10 = DATA(10,:);
X11 = DATA(11,:);
X12 = DATA(12,:);
X13 = DATA(13,:);

Y1 = DATA(14,:);



% =======================

DATA2 = transpose(database);

A1 = DATA(1,60:130);
A2 = DATA(2,60:130);
A3 = DATA(3,60:130);
A4 = DATA(4,60:130);
A5 = DATA(5,60:130);
A6 = DATA(6,60:130);
A7 = DATA(7,60:130);
A8 = DATA(8,60:130);
A9 = DATA(9,60:130);
A10 = DATA(10,60:130);
A11 = DATA(11,60:130);
A12 = DATA(12,60:130);
A13 = DATA(13,60:130);

B1 = DATA(14,60:130);

% ENTRADAS:
EntradaA = [A1;A2;A3;A4;A5;A6;A7;A8;A9;A10;A11;A12;A13];

% SÁIDA:
SaidaB = B1;

% ============================


% ENTRADAS:
Entrada = [X1;X2;X3;X4;X5;X6;X7;X8;X9;X10;X11;X12;X13];

% SÁIDA:
Saida = Y1;


% Vetor de Teste Geral ----------------------------------------------------
% Vetor de Entrada para o Vetor de Teste
TesteEntradaGeral = [Entrada(:,50:59)';
                     Entrada(:,121:130)';
                     Entrada(:,169:178)'];
            
            % Vetor de Teste - Entrada
            EntradaVetorTesteGeral = transpose(TesteEntradaGeral);
            
% Vetor de Saída para o Vetor de Teste
TesteSaidaGeral   = [Saida(:,50:59)';
                     Saida(:,121:130)';
                     Saida(:,169:178)'];
            
            % Vetor de Teste - Saída
            SaidaVetorTesteGeral = transpose(TesteSaidaGeral);
% -------------------------------------------------------------------------

% Definir [1]
Rede = 1;

for TesteClasse = Rede

    if TesteClasse == 1
        
        ClasseE1 = Entrada(:,50:59)';
        ClasseS1 = Saida(:,50:59)';
        
        
        ClasseE2 = Entrada(:,121:130)';
        ClasseS2 = Saida(:,121:130)';
        
        
        ClasseE3 = Entrada(:,169:178)';
        ClasseS3 = Saida(:,169:178)';
        
    end
    
end


% Vetor de Teste Classe 1 -------------------------------------------------
% Vetor de Entrada para o Vetor de Teste
TesteClasseEntrada1 = ClasseE1;
            
            % Vetor de Teste - Entrada
            EntradaVetorTesteClasse1 = transpose(TesteClasseEntrada1);
            
% Vetor de Saída para o Vetor de Teste
TesteClasseSaida1   = ClasseS1;
            
            % Vetor de Teste - Saída
            SaidaVetorTesteClasse1 = transpose(TesteClasseSaida1);
% -------------------------------------------------------------------------
% Vetor de Teste Classe 2 -------------------------------------------------
% Vetor de Entrada para o Vetor de Teste
TesteClasseEntrada2 = ClasseE2;
            
            % Vetor de Teste - Entrada
            EntradaVetorTesteClasse2 = transpose(TesteClasseEntrada2);
            
% Vetor de Saída para o Vetor de Teste
TesteClasseSaida2   = ClasseS2;
            
            % Vetor de Teste - Saída
            SaidaVetorTesteClasse2 = transpose(TesteClasseSaida2);
% -------------------------------------------------------------------------
% Vetor de Teste Classe 3 -------------------------------------------------
% Vetor de Entrada para o Vetor de Teste
TesteClasseEntrada3 = ClasseE3;
            
            % Vetor de Teste - Entrada
            EntradaVetorTesteClasse3 = transpose(TesteClasseEntrada3);
            
% Vetor de Saída para o Vetor de Teste
TesteClasseSaida3   = ClasseS3;
            
            % Vetor de Teste - Saída
            SaidaVetorTesteClasse3 = transpose(TesteClasseSaida3);
% -------------------------------------------------------------------------


% Criação rede feed-forward backpropagation
net = newff(EntradaA,EntradaA,5);

% DIVISÃO DO BANCO DE DADOS IRIS
net.divideFcn = 'divideind';

% PARA O TREINAMENTO - 120 PADRÕES (40 DE CADA CLASSE)
% Classe 1 = 1 a 30; Classe 2 = 51 a 80; Classe 3 = 101 a 130
net.divideParam.trainInd  = 60:1:110;

% PARA A VALIDAÇÃO - 45 PADRÕES (15 DE CADA CLASSE)
% Classe 1 = 31 a 40; Classe 2 = 81 a 90; Classe 3 = 131 a 140
net.divideParam.valInd    = 111:1:120;

% PARA O TESTE - 45 PADRÕES (15 DE CADA CLASSE)
% Classe 1 = 41 a 50; Classe 2 = 91 a 100; Classe 3 = 141 a 150
net.divideParam.testInd   = 121:1:130;


% Saída antes do treinamento
%a = sim(net,Entrada);

% Plotagem antes do Trenamento
%plot(a);
%hold
%plot(Saida);


% TRENAMENTO DA REDE ======================================================
[net,tr] = train(net,EntradaA,EntradaA);

% Saída após o treinamento
%a = sim(net,Entrada);

% Plotagem após o Trenamento
%plot(a);
%hold
%plot(Saida);


% VETOR DE TESTE ==========================================================
% Saída após o treinamento - Vetor de teste
VTeste1 = sim(net,EntradaVetorTesteClasse1);  % Teste Local Classe 1
VTeste2 = sim(net,EntradaVetorTesteClasse2);  % Teste Local Classe 1
VTeste3 = sim(net,EntradaVetorTesteClasse3);  % Teste Local Classe 1

VT = sim(net,EntradaVetorTesteGeral);    % Teste Geral (das 3 classes)



% Plotagem após o Trenamento - Vetor de teste
%plot(VT);
%hold
%plot(TesteEntradaGeral);


% DESEMPENHO DA REDE - VETOR DE TESTE TOTAL ===============================
% ERRO DA REDE 1 EM RELAÇÃO AO VETOR DE TESTE TOTAL =======================

% Erro - (Saída - Entrada)
Erro  =  VT-EntradaVetorTesteGeral;

% Quadrado do Erro
Quadrado = Erro.^2;

% ERRO MÉDIO QUADRÁTICO
MSE = mean(Quadrado);

% Media do MSE
%perf = mse(net,TesteEntrada2,VT);
media = mean(MSE);



% DESEMPENHO DA REDE - VETOR DE TESTE LOCAL (REDE 1) ======================

% Erro - (Saída - Entrada)
ErroTesteClasse1  =  VTeste1-EntradaVetorTesteClasse1;

% Quadrado do Erro
QuadradoTesteClasse1 = ErroTesteClasse1.^2;

% ERRO MÉDIO QUADRÁTICO
MSETesteClasse1 = mean(QuadradoTesteClasse1);

% Media do MSE
%perf = mse(net,TesteEntrada2,VT);
mediaTesteClasse1 = mean(MSETesteClasse1);

% =========================================================================
% DESEMPENHO DA REDE - VETOR DE TESTE LOCAL (REDE 2) ======================

% Erro - (Saída - Entrada)
ErroTesteClasse2  =  VTeste2-EntradaVetorTesteClasse2;

% Quadrado do Erro
QuadradoTesteClasse2 = ErroTesteClasse2.^2;

% ERRO MÉDIO QUADRÁTICO
MSETesteClasse2 = mean(QuadradoTesteClasse2);

% Media do MSE
%perf = mse(net,TesteEntrada2,VT);
mediaTesteClasse2 = mean(MSETesteClasse2);

% =========================================================================
% DESEMPENHO DA REDE - VETOR DE TESTE LOCAL (REDE 3) ======================

% Erro - (Saída - Entrada)
ErroTesteClasse3  =  VTeste3-EntradaVetorTesteClasse3;

% Quadrado do Erro
QuadradoTesteClasse3 = ErroTesteClasse3.^2;

% ERRO MÉDIO QUADRÁTICO
MSETesteClasse3 = mean(QuadradoTesteClasse3);

% Media do MSE
%perf = mse(net,TesteEntrada2,VT);
mediaTesteClasse3 = mean(MSETesteClasse3);

% =========================================================================




