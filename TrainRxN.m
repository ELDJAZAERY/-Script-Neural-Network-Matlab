%% Train RxN 
%% created by EL DJAZAERY
%% 22/04/2018

clc;clear;

%% Rx Network's parametrs

data = load('input_data');
input   = data.input_data;
target  = data.target_data;


%layers = { 3 4 5 6 10 15 20 25 30 40 50 100 [3 4] [4 5] [5 6] [6 10] [10 15] [15 20] [20 25] [25 30] [30 35] [40 45] [50 50] [100 100] [3 4 4] [4 5 4] [5 6 5] [6 10 6] [10 15 10] [15 20 10] [20 25 15] [25 30 6] [30 35 10] [40 45 30] [50 50 20] [100 100 10] };

%layers = { 3 4 5 6 10 15 20 25 30 40 50 100 [3 4] [4 5] [5 6] [6 10] [10 15] [15 20] [20 25] [25 30] [30 35] [40 45] [50 50] [100 100] [3 4 4] [4 5 4] [5 6 5] [6 10 6] [10 15 10] [15 20 10] };

layers = { [3 2] 4 5 };

transferFunctions = {['tangsign']}; % par défault

trainFunctions={'trainlm' 'trainrp' 'trainscg'};


bestResultat = [] ;
Out = [];
cpt = 1;
nbRetrain = 3;


for trainF = trainFunctions
    for layer = layers

        net = newff(input,target,layer{1});       
        
        %Train
        [tr] = ntrain(net,input,target,trainF{1},nbRetrain);

        resultat = {
            tr{1} % Best Training¨Performance
            tr{2} % Best Test Performance
            tr{3} % Best Validation Performance
            tr{4} % Regression
            tr{5} % trace training
            tr{6} % net
            trainF{1}
            layer{1}
        };
        
        bestResultat = Best(bestResultat,resultat);
        
        % save the resultat
        Out{cpt} = resultat;
        cpt = cpt +1 ;
    end
end


%save data in Excel File
ExcelData = [];
for excelout = Out
    line = [];
    for exc = excelout{1}
        line = [line exc];
    end
    ExcelData = [ExcelData ; line' ];
end

save ExcelData ;
save bestResultat;
%xlswrite('Resultat.xlsx',ExcelData);


clear architect best_net best_tr cpt exc excelout goal input layer layers line lr mean_epoch mean_perf   ;
clear resultat showWindow target testRatio trainF trainFunctions mean_reg mean_time nbRetrain net Out ;
clear trainingFunction trainRatio transferFunctions valRatio worst_net worst_tr ;
