%------------------------------------------------------
% Description: Jump set
% Return 0 if outside of D, and 1 if inside D
%------------------------------------------------------
function inside = D_h(s)

x1 = s(1);
x2 = s(2);
x3 = s(3);
tau = s(4);

D=(tau<=0);

if D
    inside = 1;
else
    inside = 0;
end
