clc
% x = randi(100,[3,3,3]);
% % randi(range, row, col) -> return integer
% 
% [ck,k] = max(max(max(x)));
% [cj,j] = max(max(x(:,:,k)));
% [ci,i] = max(x(:,j,k));
% fprintf('[i,j,k] = [%1.0f %1.0f %1.0f]\n',i,j,k)

x = randi(100,[3,3,3])
[ck,k_max] = max(x,[],3)
[cj,j_max] = max(ck,[],2)
[ci,i] = max(cj,[],1)
j = j_max(i)
k = k_max(i,j)