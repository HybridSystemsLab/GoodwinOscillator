%------------------------------------------------------
% Description: Flow set
% Return 0 if outside of C, and 1 if inside C
%------------------------------------------------------
function inside = C_h(s) 
x1 = s(1);
x2 = s(2);
x3 = s(3);
tau = s(4);


D=(tau<=0);

if D
    inside = 0;
else
    inside = 1;
end
