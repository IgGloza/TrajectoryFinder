function [Solution] = A_Gloza(Map,Time,Start,Goal)

a = tic;
tic
Time = Time - 2;

EndingCriterion = 0;

clear Solution
clear Cost


if(Time>0.1)
 
    
    Solution = A_Gloza_funkcja2(Map,Start,Goal)

    toc


%za krótki czas
else
    Solution = A_Gloza_funkcja3(Map,Time,Start,Goal)
   
end
   
toc

end