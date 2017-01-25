function [A,count] = FindMatches2(S,T,M)
    SSD = SSD_2(S,T,M);
    min_SSD = min(min(SSD));
    count=0;
    for i=1:9
        for j=1:9
            if SSD(i,j)==min_SSD
                count = count +1;
                A(:,count) = [i;j];
            end
        end
    end
end