function [Solution] = A_Gloza_funkcja3(Map,Time,Start,Goal)
    cost = 10000000;
    tic
    
       for i=1:1000
           
       Point1 = [Start(1)+round(rand*(Goal(1)-Start(1))),Start(2)+round(rand*(Goal(2)-Start(2)))];
       Solution1 = A_DirectedSimpleAlgorithm(Map,Time,Start,Point1);
       Solution2 = A_DirectedSimpleAlgorithm(Map,Time,Point1,Goal);

       Solutionx = [Solution1;Solution2]
       
       cost1 = PathEvaluation(Map,Start,Goal,Solutionx,'r');
       
             if (cost1<cost)
                Solution = Solutionx;
                cost = cost1;
             end

           if (toc>Time)
               break
           end
       end
       
  
   
   
       x=Solution(:,1);
       y=Solution(:,2);
       figure(1);
       imshow(Map)
       hold on
       plot(x,y)
   
end