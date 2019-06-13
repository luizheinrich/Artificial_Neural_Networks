%==========================================================================
% ENGENHARIA ELÉTRICA
% INTELIGÊNCIA COMPUTACIONAL
% DOCENTE: ADRIANA ROSA GARCEZ CASTRO
% ALuNO: LUIZ HENRIQuE P. ASSUNÇÃO

% INÍCIO DO CÓDIGO ========================================================

% REDE DA CLASSE 1

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


        ClasseE1 = Entrada(:,50:59)';
        ClasseS1 = Saida(:,50:59)';
        
        
        ClasseE2 = Entrada(:,121:130)';
        ClasseS2 = Saida(:,121:130)';
        
        
        ClasseE3 = Entrada(:,169:178)';
        ClasseS3 = Saida(:,169:178)';
        
        
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



for i = 1:3
    
    if i == 1
        
    A1 = DATA(1,1:59);
    A2 = DATA(2,1:59);
    A3 = DATA(3,1:59);
    A4 = DATA(4,1:59);
    A5 = DATA(5,1:59);
    A6 = DATA(6,1:59);
    A7 = DATA(7,1:59);
    A8 = DATA(8,1:59);
    A9 = DATA(9,1:59);
    A10 = DATA(10,1:59);
    A11 = DATA(11,1:59);
    A12 = DATA(12,1:59);
    A13 = DATA(13,1:59);

    B1 = DATA(14,1:59);
    
    
        NeuronioNet = 15;
        Treino    = 1:1:39;
        Validacao = 40:1:49;
        Teste     = 50:1:59;
        
    elseif i == 2
        
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
        
        NeuronioNet = 20;
        Treino    = 60:1:110;
        Validacao = 111:1:120;
        Teste     = 121:1:130;
        
    elseif i == 3
        
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

    B1 = DATAC3(14,:);
        
        NeuronioNet = 13;
        Treino    = 1:1:28;
        Validacao = 29:1:38;
        Teste     = 39:1:48;
        
    end
    
    % ENTRADAS:
    EntradaA = [A1;A2;A3;A4;A5;A6;A7;A8;A9;A10;A11;A12;A13];

    % SÁIDA:
    SaidaB = B1;
    
% Criação rede feed-forward backpropagation - Rede 1
net = newff(EntradaA,EntradaA,NeuronioNet);

% DIVISÃO DO BANCO DE DADOS
net.divideFcn = 'divideind';

% PARA O TREINAMENTO - 120 PADRÕES (40 DE CADA CLASSE)
% Classe 1 = 1 a 30; Classe 2 = 51 a 80; Classe 3 = 101 a 130
net.divideParam.trainInd  = Treino;


% PARA A VALIDAÇÃO - 45 PADRÕES (15 DE CADA CLASSE)
% Classe 1 = 31 a 40; Classe 2 = 81 a 90; Classe 3 = 131 a 140
net.divideParam.valInd    = Validacao;

% PARA O TESTE - 45 PADRÕES (15 DE CADA CLASSE)
% Classe 1 = 41 a 50; Classe 2 = 91 a 100; Classe 3 = 141 a 150
net.divideParam.testInd   = Teste;


% TRENAMENTO DA REDE ======================================================
[net,tr] = train(net,EntradaA,EntradaA);


% VETOR DE TESTE 1 =========================================================
% Saída após o treinamento - Vetor de teste

VTeste1.Net{i} = sim(net,EntradaVetorTesteClasse1);  % Teste Local Classe 1
VTeste2.Net{i} = sim(net,EntradaVetorTesteClasse2);  % Teste Local Classe 1
VTeste3.Net{i} = sim(net,EntradaVetorTesteClasse3);  % Teste Local Classe 1

VT.Net{i} = sim(net,EntradaVetorTesteGeral);    % Teste Geral (das 3 classes)


% DESEMPENHO DA REDE - VETOR DE TESTE TOTAL ===============================
% ERRO DA REDE 1 EM RELAÇÃO AO VETOR DE TESTE TOTAL =======================

% Erro - (Saída - Entrada)
Erro  =  VT.Net{i}-EntradaVetorTesteGeral;

% Quadrado do Erro
Quadrado.Net{i} = Erro.^2;

% ERRO MÉDIO QUADRÁTICO
MSE.Net{i} = (Quadrado.Net{i})./2;

% Media do MSE
MSETotal.Net{i} = (sum(Quadrado.Net{i}))./30;
MSECL00.Net{i} = sum(MSETotal.Net{i});

%plot(MSETotal.Net{i});


% NET 1 - VETOR DE TESTE LOCAL (REDE 1) ======================

% Erro - (Saída - Entrada)
ErroTesteClasse1.Net{i}  =  VTeste1.Net{i}-EntradaVetorTesteClasse1;

% Quadrado do Erro
QuadradoTesteClasse1.Net{i} = (ErroTesteClasse1.Net{i}).^2;

% ERRO MÉDIO QUADRÁTICO
MSETesteClasse1.Net{i} = (QuadradoTesteClasse1.Net{i})./2;

% Media do MSE
MSETotalTesteClasse1.Net{i} = sum(QuadradoTesteClasse1.Net{i})./10;
MSECL01.Net{i} = sum(MSETotalTesteClasse1.Net{i});

% =========================================================================
% NET 2 - VETOR DE TESTE LOCAL (REDE 2) ======================

% Erro - (Saída - Entrada)
ErroTesteClasse2.Net{i}  =  VTeste2.Net{i}-EntradaVetorTesteClasse2;

% Quadrado do Erro
QuadradoTesteClasse2.Net{i} = (ErroTesteClasse2.Net{i}).^2;

% ERRO MÉDIO QUADRÁTICO
MSETesteClasse2.Net{i} = (QuadradoTesteClasse2.Net{i})./2;

% Media do MSE
MSETotalTesteClasse2.Net{i} = sum(QuadradoTesteClasse2.Net{i})./10;
MSECL02.Net{i} = sum(MSETotalTesteClasse2.Net{i});

% =========================================================================
% NET 3 - VETOR DE TESTE LOCAL (REDE 3) ======================

% Erro - (Saída - Entrada)
ErroTesteClasse3.Net{i}  =  VTeste3.Net{i}-EntradaVetorTesteClasse3;

% Quadrado do Erro
QuadradoTesteClasse3.Net{i} = (ErroTesteClasse3.Net{i}).^2;

% ERRO MÉDIO QUADRÁTICO
MSETesteClasse3 = (QuadradoTesteClasse3.Net{i})./2;

% Media do MSE
MSETotalTesteClasse3.Net{i} = sum(QuadradoTesteClasse3.Net{i})./10;
MSECL03.Net{i} = sum(MSETotalTesteClasse3.Net{i});

% =========================================================================



end


rede1 = transpose(MSETotal.Net{1, 1});
rede2 = transpose(MSETotal.Net{1, 2});
rede3 = transpose(MSETotal.Net{1, 3});

%plot(MSETotal.Net{1, 1})
%plot(MSETotal.Net{1, 2})
%plot(MSETotal.Net{1, 3})


