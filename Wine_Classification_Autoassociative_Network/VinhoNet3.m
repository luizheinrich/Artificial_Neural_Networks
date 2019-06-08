%==========================================================================
% ENGENHARIA ELÉTRICA
% INTELIGÊNCIA COMPUTACIONAL
% DOCENTE: ADRIANA ROSA GARCEZ CASTRO
% ALuNO: LUIZ HENRIQuE P. ASSUNÇÃO

% INÍCIO DO CÓDIGO ========================================================

% REDE DA CLASSE 3

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

file3 = 'VinhoDataSetClasse3.txt';
databaseC3=load(file3);

DATAC3 = transpose(databaseC3);

A1 = DATAC3(1,:);
A2 = DATAC3(2,:);
A3 = DATAC3(3,:);
A4 = DATAC3(4,:);
A5 = DATAC3(5,:);
A6 = DATAC3(6,:);
A7 = DATAC3(7,:);
A8 = DATAC3(8,:);
A9 = DATAC3(9,:);
A10 = DATAC3(10,:);
A11 = DATAC3(11,:);
A12 = DATAC3(12,:);
A13 = DATAC3(13,:);
%131:178
B1 = DATAC3(14,:);

% ENTRADAS:
EntradaA = [A1;A2;A3;A4;A5;A6;A7;A8;A9;A10;A11;A12;A13];

% SÁIDA:
SaidaB = B1;

% ============================


% ENTRADAS:
Entrada = [X1;X2;X3;X4;X5;X6;X7;X8;X9;X10;X11;X12;X13];

% SÁIDA:
Saida = Y1;

% Vetor de Teste ----------------------------------------------------------
% Vetor de Entrada para o Vetor de Teste
TesteEntrada = EntradaA(:,39:48)';
            
            % Vetor de Teste - Entrada
            TesteEntrada2 = transpose(TesteEntrada);
            
% Vetor de Saída para o Vetor de Teste
TesteSaida   = SaidaB(:,39:48)';
            
            % Vetor de Teste - Saída
            TesteSaida2 = transpose(TesteSaida);
% -------------------------------------------------------------------------



% Vetor de Entrada para o Vetor de Teste
TesteEntradaT = [Entrada(:,50:59)';
                Entrada(:,121:130)';
                EntradaA(:,39:48)'];
            
            % Vetor de Teste - Entrada
            TesteEntradaGeral = transpose(TesteEntradaT);


% ========================================================






% Criação rede feed-forward backpropagation
net = newff(EntradaA,EntradaA,5);

% DIVISÃO DO BANCO DE DADOS IRIS
net.divideFcn = 'divideind';

% PARA O TREINAMENTO - 120 PADRÕES (40 DE CADA CLASSE)
% Classe 1 = 1 a 30; Classe 2 = 51 a 80; Classe 3 = 101 a 130
net.divideParam.trainInd  = 1:1:28;

% PARA A VALIDAÇÃO - 45 PADRÕES (15 DE CADA CLASSE)
% Classe 1 = 31 a 40; Classe 2 = 81 a 90; Classe 3 = 131 a 140
net.divideParam.valInd    = 29:1:38;

% PARA O TESTE - 45 PADRÕES (15 DE CADA CLASSE)
% Classe 1 = 41 a 50; Classe 2 = 91 a 100; Classe 3 = 141 a 150
net.divideParam.testInd   = 39:1:48;


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
VTeste03 = sim(net,TesteEntrada2);  % Teste Local (da classe 3)
VT = sim(net,TesteEntradaGeral);    % Teste Geral (das 3 classes)



% Plotagem após o Trenamento - Vetor de teste
%plot(VT);
%hold
%plot(TesteEntradaGeral);


% DESEMPENHO DA REDE - VETOR DE TESTE TOTAL ===============================
% ERRO DA REDE 2 EM RELAÇÃO AO VETOR DE TESTE TOTAL =======================

% Erro - (Saída - Entrada)
Erro03  =  VT-TesteEntradaGeral;

% Quadrado do Erro
Quadrado03 = Erro03.^2;

% ERRO MÉDIO QUADRÁTICO
MSE = mean(Quadrado03);

% Media do MSE
%perf = mse(net,TesteEntrada2,VT);
media = mean(MSE);



% DESEMPENHO DA REDE - VETOR DE TESTE LOCAL (REDE 2) ======================
% ERRO DA REDE 2 EM RELAÇÃO AO VETOR DE TESTE DA REDE 2 ===================

% Erro - (Saída - Entrada)
ErroTeste03  =  VTeste03-TesteEntrada2;

% Quadrado do Erro
QuadradoTeste03 = ErroTeste03.^2;

% ERRO MÉDIO QUADRÁTICO
MSETeste03 = mean(QuadradoTeste03);

% Media do MSE
%perf = mse(net,TesteEntrada2,VT);
mediaTeste03 = mean(MSETeste03);






