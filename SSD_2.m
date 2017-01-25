function SSD = SSD_2(S,T,M)

rs = size(S,1);
n = (size(T,1)-1)/2;
Z = zeros(rs+2*n,rs+2*n);
for i=1+n:rs+n
     for j=1+n:rs+n
        Z(i,j) = S(i-n,j-n);
     end
end
 
 SSD= zeros(rs,rs);
 for i=1:rs
     for j=1:rs
%          m = i+n;
%          nt = j+n;
         New = Z(i:i+2*n,j:j+2*n);
         Sub = New -T; 
         Sub = abs(New - T);
         Sub = Sub.*M;
         sum = 0;
         for k=1:2*n+1
             for l=1:2*n+1
                sum = sum+Sub(k,l);
             end
         end
         SSD(i,j) = sum; 
     end
 end
end