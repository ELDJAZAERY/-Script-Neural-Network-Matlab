%% Function ntrain
%% created by EL-DJAZAERY
%% 22/04/2018

function [BestTrain] = ntrain(net,input,target,trainFunction,n)
%% initialisation
BestTrain = [];

net.divideParam.trainRatio = 0.7;
net.divideParam.testRatio = 0.15;
net.divideParam.valRatio = 0.15;
net.trainParam.showWindow = 0;
net.trainFcn = trainFunction;
net.trainParam.showWindow = 0;
net = init(net);

%% Training
for i=1:n
    [net,tr] = train(net,input,target);
    [r,~,~] = regression(target,net(input));

    trainResult = {
        tr.best_perf % Best Training¨Performance
        tr.best_tperf % Best Test Performance
        tr.best_vperf % Best Validation Performance
        max(r) % Regression
        tr % trace training
        net % net
    };

    BestTrain = Best(BestTrain,trainResult);

end

end

