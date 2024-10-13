syms x y;
f=[x^2+y^2-2;x*y-1]
J=jacobian(f)
x0=[0.8; 1.2] % tupla de condiciones iniciales
for i=1:2
    f1=subs(f,[x;y],x0)
    J1=subs(J,[x;y],x0)
    if det(J1)~=0 % J1 es invertible
        h=J1\f1
        x0=x0-h % nuevo vector solución
    else
        disp("J no es invertible en el punto")
    end
end