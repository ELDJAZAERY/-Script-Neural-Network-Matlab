%%Function Best
%% craeted by EL DJAZAERY
%% le 22/04/2018

function [bestSolution] = Best(Solution1,Solution2)

    if isempty(Solution1)
        bestSolution = Solution2;
        return;
    end
    
    if isempty(Solution2)
        bestSolution = Solution1;
        return;
    end 

    alpha = 1;
    
    overfitting1 = Solution1{3} / alpha - abs(Solution1{1}-Solution1{3}) ;
    overfitting2 = Solution2{3} / alpha - abs(Solution2{1}-Solution2{3}) ;
    
    if overfitting1 < overfitting2
        bestSolution = Solution1;
    else
        bestSolution = Solution2;
    end
    
end

