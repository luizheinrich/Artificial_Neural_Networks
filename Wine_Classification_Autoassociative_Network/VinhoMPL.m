%==========================================================================
% ENGENHARIA ELÉTRICA
% INTELIGÊNCIA COMPUTACIONAL
% DOCENTE: ADRIANA ROSA GARCEZ CASTRO
% ALuNO: LUIZ HENRIQuE P. ASSUNÇÃO

% INÍCIO DO CÓDIGO ========================================================

% REDE MPL

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


% ENTRADAS:
Entrada = [X1;X2;X3;X4;X5;X6;X7;X8;X9;X10;X11;X12;X13];

% SÁIDA:
Saida = Y1;

% Vetor de Teste ----------------------------------------------------------
% Vetor de Entrada para o Vetor de Teste
TesteEntrada = [Entrada(:,50:59)';
                Entrada(:,121:130)';
                Entrada(:,169:178)'];
            
            % Vetor de Teste - Entrada
            EntradaVetorTesteGeral = transpose(TesteEntrada);
            
% Vetor de Saída para o Vetor de Teste
TesteSaida   = [Saida(:,50:59)';
                Saida(:,121:130)';
                Saida(:,169:178)'];
            
            % Vetor de Teste - Saída
            SaidaVetorTesteGeral = transpose(TesteSaida);
% -------------------------------------------------------------------------


% Criação rede feed-forward backpropagation
net = newff(Entrada,Saida,5);

% DIVISÃO DO BANCO DE DADOS IRIS
net.divideFcn = 'divideind';

% PARA O TREINAMENTO - 120 PADRÕES (40 DE CADA CLASSE)
% Classe 1 = 1 a 30; Classe 2 = 51 a 80; Classe 3 = 101 a 130
net.divideParam.trainInd  = [1:1:39, 60:1:110, 131:1:158];


% PARA A VALIDAÇÃO - 45 PADRÕES (15 DE CADA CLASSE)
% Classe 1 = 31 a 40; Classe 2 = 81 a 90; Classe 3 = 131 a 140
net.divideParam.valInd    = [40:1:49, 111:1:120, 159:1:168];


% PARA O TESTE - 45 PADRÕES (15 DE CADA CLASSE)
% Classe 1 = 41 a 50; Classe 2 = 91 a 100; Classe 3 = 141 a 150
net.divideParam.testInd   = [50:1:59, 121:1:130, 169:1:178];


% Saída antes do treinamento
%a = sim(net,Entrada);

% Plotagem antes do Trenamento
%plot(a);
%hold
%plot(Saida);



% TRENAMENTO DA REDE ======================================================
[net,tr] = train(net,Entrada,Saida);

% Saída após o treinamento
%a = sim(net,Entrada);

% Plotagem após o Trenamento
%plot(a);
%hold
%plot(Saida);


% VETOR DE TESTE ==========================================================
% Saída após o treinamento - Vetor de teste
VT = sim(net,EntradaVetorTesteGeral);



% Plotagem após o Trenamento - Vetor de teste
plot(VT);
hold
plot(TesteSaida2);


% DESEMPENHO DA REDE - VETOR DE TESTE TOTAL ===============================
% ERRO DA REDE 1 EM RELAÇÃO AO VETOR DE TESTE TOTAL =======================

% Erro - (Saída - Entrada)
Erro  =  VT-SaidaVetorTesteGeral;

% Quadrado do Erro
Quadrado = Erro.^2;

% ERRO MÉDIO QUADRÁTICO
MSE = mean(Quadrado);

% Media do MSE
%perf = mse(net,TesteEntrada2,VT);
media = mean(MSE);



