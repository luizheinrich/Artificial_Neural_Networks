%==========================================================================
% ENGENHARIA EL�TRICA
% INTELIG�NCIA COMPUTACIONAL
% DOCENTE: ADRIANA ROSA GARCEZ CASTRO
% ALuNO: LUIZ HENRIQuE P. ASSUN��O

% IN�CIO DO C�DIGO ========================================================

% REDE MPL

% Carrega o arquivo .txt que cont�m o banco de dados
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

% S�IDA:
Saida = Y1;

% Vetor de Teste Geral ----------------------------------------------------
% Vetor de Entrada para o Vetor de Teste
TesteEntradaGeral = [Entrada(:,50:59)';
                     Entrada(:,121:130)';
                     Entrada(:,169:178)'];
            
            % Vetor de Teste - Entrada
            EntradaVetorTesteGeral = transpose(TesteEntradaGeral);
            
% Vetor de Sa�da para o Vetor de Teste
TesteSaidaGeral   = [Saida(:,50:59)';
                     Saida(:,121:130)';
                     Saida(:,169:178)'];
            
            % Vetor de Teste - Sa�da
            SaidaVetorTesteGeral = transpose(TesteSaidaGeral);
% -------------------------------------------------------------------------

% Definir a Classe [1 2 3]
Rede = 1;

for TesteClasse = Rede

    if TesteClasse == 1
        
        ClasseE = Entrada(:,50:59)';
        ClasseS = Saida(:,50:59)';
        
    elseif TesteClasse == 2
        
        ClasseE = Entrada(:,121:130)';
        ClasseS = Saida(:,121:130)';
        
    elseif TesteClasse == 3
        
        ClasseE = Entrada(:,169:178)';
        ClasseS = Saida(:,169:178)';
        
    end
    
end
    
% Vetor de Teste Classe ---------------------------------------------------
% Vetor de Entrada para o Vetor de Teste
TesteClasseEntrada = ClasseE;
            
            % Vetor de Teste - Entrada
            EntradaVetorTesteClasse = transpose(TesteClasseEntrada);
            
% Vetor de Sa�da para o Vetor de Teste
TesteClasseSaida   = ClasseS;
            
            % Vetor de Teste - Sa�da
            SaidaVetorTesteClasse = transpose(TesteClasseSaida);
% -------------------------------------------------------------------------


% Cria��o rede feed-forward backpropagation
net = newff(Entrada,Saida,5);

% DIVIS�O DO BANCO DE DADOS IRIS
net.divideFcn = 'divideind';

% PARA O TREINAMENTO - 120 PADR�ES (40 DE CADA CLASSE)
% Classe 1 = 1 a 30; Classe 2 = 51 a 80; Classe 3 = 101 a 130
net.divideParam.trainInd  = [1:1:39, 60:1:110, 131:1:158];


% PARA A VALIDA��O - 45 PADR�ES (15 DE CADA CLASSE)
% Classe 1 = 31 a 40; Classe 2 = 81 a 90; Classe 3 = 131 a 140
net.divideParam.valInd    = [40:1:49, 111:1:120, 159:1:168];


% PARA O TESTE - 45 PADR�ES (15 DE CADA CLASSE)
% Classe 1 = 41 a 50; Classe 2 = 91 a 100; Classe 3 = 141 a 150
net.divideParam.testInd   = [50:1:59, 121:1:130, 169:1:178];


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
VTeste = sim(net,EntradaVetorTesteClasse);  % Teste Local (classe escolhida)
VT = sim(net,EntradaVetorTesteGeral);    % Teste Geral (das 3 classes)



% Plotagem ap�s o Trenamento - Vetor de teste
plot(VT);
hold
plot(SaidaVetorTesteGeral);


% DESEMPENHO DA REDE - VETOR DE TESTE TOTAL ===============================
% ERRO DA REDE 1 EM RELA��O AO VETOR DE TESTE TOTAL =======================

% Erro - (Sa�da - Entrada)
Erro  =  VT-SaidaVetorTesteGeral;

% Quadrado do Erro
Quadrado = Erro.^2;

% ERRO M�DIO QUADR�TICO
MSE = mean(Quadrado);

% Media do MSE
%perf = mse(net,TesteEntrada2,VT);
media = mean(MSE);



% DESEMPENHO DA REDE - VETOR DE TESTE LOCAL (REDE 2) ======================
% ERRO DA REDE 2 EM RELA��O AO VETOR DE TESTE DA REDE 2 ===================

% Erro - (Sa�da - Entrada)
ErroTesteClasse  =  VTeste-SaidaVetorTesteClasse;

% Quadrado do Erro
QuadradoTesteClasse = ErroTesteClasse.^2;

% ERRO M�DIO QUADR�TICO
MSETesteClasse = mean(QuadradoTesteClasse);

% Media do MSE
%perf = mse(net,TesteEntrada2,VT);
mediaTesteClasse = mean(MSETesteClasse);




