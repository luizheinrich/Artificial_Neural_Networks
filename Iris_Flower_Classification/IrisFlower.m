%==========================================================================
% ENGENHARIA EL�TRICA
% INTELIG�NCIA COMPUTACIONAL
% DOCENTE: ADRIANA ROSA GARCEZ CASTRO
% ALuNO: LUIZ HENRIQuE P. ASSUN��O

% IN�CIO DO C�DIGO ========================================================

% Carrega o arquivo .txt que cont�m o banco de dados
file = 'IrisFlowerDataSet.txt';
database=load(file);

DATA = transpose(database);

A = DATA(1,:);
B = DATA(2,:);
C = DATA(3,:);
D = DATA(4,:);

% ENTRADAS:
Entrada = [A;B;C;D];

% S�IDA:
Saida  = DATA(5,:);

% Vetor de Teste ----------------------------------------------------------
% Vetor de Entrada para o Vetor de Teste
TesteEntrada = [Entrada(:,41:50)';
                Entrada(:,91:100)';
                Entrada(:,141:150)'];
            
            % Vetor de Teste - Entrada
            SaidaVetorTesteGeral = transpose(TesteEntrada);
            
% Vetor de Sa�da para o Vetor de Teste
TesteSaida   = [Saida(:,41:50)';
                Saida(:,91:100)';
                Saida(:,141:150)'];
            
            % Vetor de Teste - Sa�da
            TesteSaida2 = transpose(TesteSaida);
% -------------------------------------------------------------------------


% Cria��o rede feed-forward backpropagation
net = newff(Entrada,Saida,5);

% DIVIS�O DO BANCO DE DADOS IRIS
net.divideFcn = 'divideind';

% PARA O TREINAMENTO - 90 PADR�ES (30 DE CADA CLASSE)
% Classe 1 = 1 a 30; Classe 2 = 51 a 80; Classe 3 = 101 a 130
net.divideParam.trainInd  = [1:1:30, 50:1:80, 100:1:130];


% PARA A VALIDA��O - 30 PADR�ES (10 DE CADA CLASSE)
% Classe 1 = 31 a 40; Classe 2 = 81 a 90; Classe 3 = 131 a 140
net.divideParam.valInd    = [31:1:40, 81:1:90, 131:1:140];


% PARA O TESTE - 30 PADR�ES (10 DE CADA CLASSE)
% Classe 1 = 41 a 50; Classe 2 = 91 a 100; Classe 3 = 141 a 150
net.divideParam.testInd   = [41:1:50, 91:1:100, 141:1:150];


% Sa�da antes do treinamento
%a = sim(net,Entrada);

% Plotagem antes do Trenamento
%plot(a);
%hold
%plot(Saida);



% TRENAMENTO DA REDE ======================================================
[net,tr] = train(net,Entrada,Saida);

% Sa�da ap�s o treinamento
%a = sim(net,Entrada);

% Plotagem ap�s o Trenamento
%plot(a);
%hold
%plot(Saida);


% VETOR DE TESTE ==========================================================
% Sa�da ap�s o treinamento - Vetor de teste
VT = sim(net,SaidaVetorTesteGeral);

% Plotagem ap�s o Trenamento - Vetor de teste
plot(VT);
hold
plot(TesteSaida2);


% DESEMPENHO DA REDE - VETOR DE TESTE TOTAL ===============================
% ERRO DA REDE EM RELA��O AO VETOR DE TESTE TOTAL =========================

% Erro - (Sa�da - Entrada)
Erro  =  VT-SaidaVetorTesteGeral;

% Quadrado do Erro
Quadrado = Erro.^2;

% ERRO M�DIO QUADR�TICO
MSE = mean(Quadrado);

% Media do MSE
%perf = mse(net,TesteEntrada2,VT);
media = mean(MSE);


