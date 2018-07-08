%% Function Predictive
%% created by EL-DJAZAERY
%% 22/04/2018

function [Recall,Precision,F,TrueNegatifRate,Accuracy] = predictive(target,output)

tp=0;fp=0;fn=0;tn=0;

if length(target) ~= length(input)
    return;
end

for i=1:length(target)
    if target(i) == 1
        if output(i) == 1
            tp=tp+1;
        else
            fn=fn+1;
        end
    else
        if output(i) == 1
            fp=fp+1;
        else
            tn=tn+1;
        end
    end        
end


Recall = tp / (tp+fn) ;
Precision = tp / (tp+fp) ;
F = 2 * ( (Precision * Recall) / (Precision + Recall) ) ;
TrueNegatifRate = tn / (tn+fp) ;
Accuracy = (tp + tn) / ( tp + tn + fp + fn ) ;




