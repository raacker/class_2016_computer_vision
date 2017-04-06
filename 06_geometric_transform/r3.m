function y = r3(u)
abs_u = abs(u);
if abs_u <= 1
    y = (1.5 * (abs_u^3)) - (2.5 * (abs_u^2)) + 1;
elseif abs_u > 1 && abs_u <= 2
    y = (-0.5 * (abs_u^3)) + (2.5*(abs_u^2)) + (-4*abs_u) + 2;
end