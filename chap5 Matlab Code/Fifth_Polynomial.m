clear all;
clc;
syms a0 a1 a2 a3 a4 a5
t0 = 5;
td = 8;
Lane_Start=4;
Lane_End=8;
y0=[Lane_Start;0;0;Lane_End;0;0];
phi0=[0;0;0;0;0;0];
Time_Matrix=[t0^5,t0^4,t0^3,t0^2,t0^1,1;
             5*t0^4,4*t0^3,3*t0^2,2*t0,1,0;
             20*t0^3,12*t0^2,6*t0,2,0,0;
             td^5,td^4,td^3,td^2,td^1,1;
             5*td^4,4*td^3,3*td^2,2*td,1,0;
             20*td^3,12*td^2,6*td,2,0,0;];
    
vars=[a5 a4 a3 a2 a1 a0];
eqns_y=Time_Matrix*vars'==y0;
eqns_phi=Time_Matrix*vars'==phi0;
A=solve(eqns_y,vars);
B=solve(eqns_phi,vars);
figure(1)
t=t0:0.01:td;
N=length(t);
y_y=zeros(N,1);
y_phi=zeros(N,1);
for i=1:N
    y_y(i)=[t(i)^5,t(i)^4,t(i)^3,t(i)^2,t(i),1]*[A.a5 A.a4 A.a3 A.a2 A.a1 A.a0]'; 
    y_phi(i)=[t(i)^5,t(i)^4,t(i)^3,t(i)^2,t(i),1]*[B.a5 B.a4 B.a3 B.a2 B.a1 B.a0]'; 
end
plot(t,y_y,'b-',t,y_phi,'r-')
