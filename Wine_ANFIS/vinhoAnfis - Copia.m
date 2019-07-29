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
Entrada = [A1;A2;A3;A4;A5;A6;A7;A8;A9;A10;A11;A12;A13];

% SÁIDA:
Saida = B1;





    % TREINO
    Xa1 = [DATA(1,1:39)'; DATA(1,60:110)'; DATA(1,131:158)'];
    
    % TESTE
    Xb1 = [DATA(1,50:59)'; DATA(1,121:130)'; DATA(1,169:178)'];
    
    % VALIDAÇÃO
    Xc1 = [DATA(1,40:49)'; DATA(1,111:120)'; DATA(1,159:168)'];
    
    
    % TREINO
    Xa2 = [DATA(2,1:39)'; DATA(2,60:110)'; DATA(2,131:158)'];
    
    % TESTE
    Xb2 = [DATA(2,50:59)'; DATA(2,121:130)'; DATA(2,169:178)'];
    
    % VALIDAÇÃO
    Xc2 = [DATA(2,40:49)'; DATA(2,111:120)'; DATA(2,159:168)'];
    
    
    % TREINO
    Xa3 = [DATA(3,1:39)'; DATA(3,60:110)'; DATA(3,131:158)'];
    
    % TESTE
    Xb3 = [DATA(3,50:59)'; DATA(3,121:130)'; DATA(3,169:178)'];
    
    % VALIDAÇÃO
    Xc3 = [DATA(3,40:49)'; DATA(3,111:120)'; DATA(3,159:168)'];
    
    
    % TREINO
    Xa4 = [DATA(4,1:39)'; DATA(4,60:110)'; DATA(4,131:158)'];
    
    % TESTE
    Xb4 = [DATA(4,50:59)'; DATA(4,121:130)'; DATA(4,169:178)'];
    
    % VALIDAÇÃO
    Xc4 = [DATA(4,40:49)'; DATA(4,111:120)'; DATA(4,159:168)'];
    
    
    % TREINO
    Xa5 = [DATA(5,1:39)'; DATA(5,60:110)'; DATA(5,131:158)'];
    
    % TESTE
    Xb5 = [DATA(5,50:59)'; DATA(5,121:130)'; DATA(5,169:178)'];
    
    % VALIDAÇÃO
    Xc5 = [DATA(5,40:49)'; DATA(5,111:120)'; DATA(5,159:168)'];
    
    
    % TREINO
    Xa6 = [DATA(6,1:39)'; DATA(6,60:110)'; DATA(6,131:158)'];
    
    % TESTE
    Xb6 = [DATA(6,50:59)'; DATA(6,121:130)'; DATA(6,169:178)'];
    
    % VALIDAÇÃO
    Xc6 = [DATA(6,40:49)'; DATA(6,111:120)'; DATA(6,159:168)'];
    
    
    % TREINO
    Xa7 = [DATA(7,1:39)'; DATA(7,60:110)'; DATA(7,131:158)'];
    
    % TESTE
    Xb7 = [DATA(7,50:59)'; DATA(7,121:130)'; DATA(7,169:178)'];
    
    % VALIDAÇÃO
    Xc7 = [DATA(7,40:49)'; DATA(7,111:120)'; DATA(7,159:168)'];
    
    
    % TREINO
    Xa8 = [DATA(8,1:39)'; DATA(8,60:110)'; DATA(8,131:158)'];
    
    % TESTE
    Xb8 = [DATA(8,50:59)'; DATA(8,121:130)'; DATA(8,169:178)'];
    
    % VALIDAÇÃO
    Xc8 = [DATA(8,40:49)'; DATA(8,111:120)'; DATA(8,159:168)'];
    
    
    % TREINO
    Xa9 = [DATA(9,1:39)'; DATA(9,60:110)'; DATA(9,131:158)'];
    
    % TESTE
    Xb9 = [DATA(9,50:59)'; DATA(9,121:130)'; DATA(9,169:178)'];
    
    % VALIDAÇÃO
    Xc9 = [DATA(9,40:49)'; DATA(9,111:120)'; DATA(9,159:168)'];
    
    
    % TREINO
    Xa10 = [DATA(10,1:39)'; DATA(10,60:110)'; DATA(10,131:158)'];
    
    % TESTE
    Xb10 = [DATA(10,50:59)'; DATA(10,121:130)'; DATA(10,169:178)'];
    
    % VALIDAÇÃO
    Xc10 = [DATA(10,40:49)'; DATA(10,111:120)'; DATA(10,159:168)'];
    
    
    % TREINO
    Xa11 = [DATA(11,1:39)'; DATA(11,60:110)'; DATA(11,131:158)'];
    
    % TESTE
    Xb11 = [DATA(11,50:59)'; DATA(11,121:130)'; DATA(11,169:178)'];
    
    % VALIDAÇÃO
    Xc11 = [DATA(11,40:49)'; DATA(11,111:120)'; DATA(11,159:168)'];
    
    
    % TREINO
    Xa12 = [DATA(12,1:39)'; DATA(12,60:110)'; DATA(12,131:158)'];
    
    % TESTE
    Xb12 = [DATA(12,50:59)'; DATA(12,121:130)'; DATA(12,169:178)'];
    
    % VALIDAÇÃO
    Xc12 = [DATA(12,40:49)'; DATA(12,111:120)'; DATA(12,159:168)'];
    
    
    % TREINO
    Xa13 = [DATA(13,1:39)'; DATA(13,60:110)'; DATA(13,131:158)'];
    
    % TESTE
    Xb13 = [DATA(13,50:59)'; DATA(13,121:130)'; DATA(13,169:178)'];
    
    % VALIDAÇÃO
    Xc13 = [DATA(13,40:49)'; DATA(13,111:120)'; DATA(13,159:168)'];
    
    
    
    
    Ya = [DATA(14,1:39)'; DATA(14,60:110)'; DATA(14,131:158)'];
    
    Yb = [DATA(14,50:59)'; DATA(14,121:130)'; DATA(14,169:178)'];
    
    Yc = [DATA(14,40:49)'; DATA(14,111:120)'; DATA(14,159:168)'];




% TREINO
P  = [Xa1;Xa2;Xa3;Xa4;Xa5;Xa6;Xa7;Xa8;Xa9;Xa10;Xa11;Xa12;Xa13;Ya];

% TESTE
P1 = [Xb1;Xb2;Xb3;Xb4;Xb5;Xb6;Xb7;Xb8;Xb9;Xb10;Xb11;Xb12;Xb13;Yb];

% VALIDAÇÃO
P2 = [Xc1;Xc2;Xc3;Xc4;Xc5;Xc6;Xc7;Xc8;Xc9;Xc10;Xc11;Xc12;Xc13;Yc];



P = P';

P1 = P1';

P2 = P2';


n     = 5; 
tipo  = 'gaussmf';
epoca = 20;
fis1  = genfis1(P,n,tipo);
out_fis1 = anfis(P,fis1,epoca);
d = evalfis(P(:,1:13),out_fis1);


