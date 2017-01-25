clc
clear all
S = [1 1 1 0 0 0 1 1 1;
     1 1 1 0 0 0 1 1 1;
     1 1 1 0 0 0 1 1 1;
     0 0 0 1 1 1 0 0 0;
     0 0 0 1 1 1 0 0 0;
     0 0 0 1 1 1 0 0 0;
     1 1 1 0 0 0 1 1 1;
     1 1 1 0 0 0 1 1 1;
     1 1 1 0 0 0 1 1 1];
 
 T = [1 0 0;
      0 1 1;
      0 1 1];
  
 M = [1 1 1;
      1 1 0;
      1 1 0];
 

 %% Solution for part a
 SSD = SSD_2(S,T,M)
 
 %% Solution for part b
 [A,count] = FindMatches2(S,T,M)

 %% Solution for part c
 S = [1 1 1 0 0 0 1 1 1;
     1 1 1 0 0 0 1 1 1;
     1 1 1 0 0 0 1 1 1;
     0 0 0 1 1 1 0 0 0;
     0 0 0 1 1 1 0 0 0;
     0 0 0 1 1 1 0 0 0;
     1 1 1 0 0 0 1 1 1;
     1 1 1 0 0 0 1 1 1;
     1 1 1 0 0 0 1 1 1];
 
 rs = size(S,1);
 N=99;
 ksize = 3;
 T = zeros(2*ksize+1);

 n = (N-9)/2;
 Z = zeros(N,N)-1;
%  Z(:,:) = -1;
%  for i=1+n:N-n
%      for j=1+n:N-n
%         Z(i,j) = S(i-n,j-n);
%      end
%  end
Z(1+n:N-n,1+n:N-n)=S;

for k= n:-1: ksize+2
%  k=n;    
     
    for i=k %n-(n-k)
        for j=k : n+rs+1+(n-k)
            
%             if Z(i,j)==-1
                T = Z(i-ksize:i+ksize,j-ksize:j+ksize);
                M = (T ~= -1);
                [A,count] = FindMatches2(S,T,M);
                sel = randi(count);
                Final = A(:,sel);
                Z(i,j) = Z(n+Final(1),n+Final(2));
%             end
        end
    end
    
    for i= n-(n-k)+1:n+rs+1+(n-k)
        for j= n+rs+1+(n-k)
            
%             if Z(i,j)==-1
                T = Z(i-ksize:i+ksize,j-ksize:j+ksize);
                M = (T ~= -1);
                [A,count] = FindMatches2(S,T,M);
                sel = randi(count);
                Final = A(:,sel);
                Z(i,j) = Z(n+Final(1),n+Final(2));
%             end
            
        end
    end
    
     for i= n+rs+1+(n-k)
        for j= n+rs+1+(n-k)-1:-1:n-(n-k)
            
%             if Z(i,j)==-1
                T = Z(i-ksize:i+ksize,j-ksize:j+ksize);
                M = (T ~= -1);
                [A,count] = FindMatches2(S,T,M);
                sel = randi(count);
                Final = A(:,sel);
                Z(i,j) = Z(n+Final(1),n+Final(2));
%             end
            
        end
     end
    
     for i= n+rs+1+(n-k)-1: -1:n-(n-k)+1
        for j= n-(n-k)
            
%             if Z(i,j)==-1
                T = Z(i-ksize:i+ksize,j-ksize:j+ksize);
                M = (T ~= -1);
                [A,count] = FindMatches2(S,T,M);
                sel = randi(count);
                Final = A(:,sel);
                Z(i,j) = Z(n+Final(1),n+Final(2));
%             end
        end
     end

end
imshow(Z)


