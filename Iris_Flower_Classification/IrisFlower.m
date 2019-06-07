%==========================================================================
% ENGENHARIA ELÉTRICA
% INTELIGÊNCIA COMPUTACIONAL
% DOCENTE: ADRIANA ROSA GARCEZ CASTRO
% ALuNO: LUIZ HENRIQuE P. ASSUNÇÃO

% INÍCIO DO CÓDIGO ========================================================

% Carrega o arquivo .txt que contém o banco de dados
file = 'IrisFlowerDataSet.txt';
database=load(file);

DATA = transpose(database);

A = DATA(1,:);
B = DATA(2,:);
C = DATA(3,:);
D = DATA(4,:);

% ENTRADAS:
Entrada = [A;B;C;D];

% SÁIDA:
Saida  = DATA(5,:);

% Vetor de Teste ----------------------------------------------------------
% Vetor de Entrada para o Vetor de Teste
TesteEntrada = [Entrada(:,41:50)';
                Entrada(:,91:100)';
                Entrada(:,141:150)'];
            
            % Vetor de Teste - Entrada
            SaidaVetorTesteGeral = transpose(TesteEntrada);
            
% Vetor de Saída para o Vetor de Teste
TesteSaida   = [Saida(:,41:50)';
                Saida(:,91:100)';
                Saida(:,141:150)'];
            
            % Vetor de Teste - Saída
            TesteSaida2 = transpose(TesteSaida);
% -------------------------------------------------------------------------


% Criação rede feed-forward backpropagation
net = newff(Entrada,Saida,5);

% DIVISÃO DO BANCO DE DADOS IRIS
net.divideFcn = 'divideind';

% PARA O TREINAMENTO - 90 PADRÕES (30 DE CADA CLASSE)
% Classe 1 = 1 a 30; Classe 2 = 51 a 80; Classe 3 = 101 a 130
net.divideParam.trainInd  = [1:1:30, 50:1:80, 100:1:130];


% PARA A VALIDAÇÃO - 30 PADRÕES (10 DE CADA CLASSE)
% Classe 1 = 31 a 40; Classe 2 = 81 a 90; Classe 3 = 131 a 140
net.divideParam.valInd    = [31:1:40, 81:1:90, 131:1:140];


% PARA O TESTE - 30 PADRÕES (10 DE CADA CLASSE)
% Classe 1 = 41 a 50; Classe 2 = 91 a 100; Classe 3 = 141 a 150
net.divideParam.testInd   = [41:1:50, 91:1:100, 141:1:150];


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
VT = sim(net,SaidaVetorTesteGeral);

% Plotagem após o Trenamento - Vetor de teste
plot(VT);
hold
plot(TesteSaida2);


% DESEMPENHO DA REDE - VETOR DE TESTE TOTAL ===============================
% ERRO DA REDE EM RELAÇÃO AO VETOR DE TESTE TOTAL =========================

% Erro - (Saída - Entrada)
Erro  =  VT-SaidaVetorTesteGeral;

% Quadrado do Erro
Quadrado = Erro.^2;

% ERRO MÉDIO QUADRÁTICO
MSE = mean(Quadrado);

% Media do MSE
%perf = mse(net,TesteEntrada2,VT);
media = mean(MSE);


