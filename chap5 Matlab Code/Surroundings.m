function [s_min,s_max] = Surroundings(v,a,s,delta_T)%似乎s_max也没有必要存在
v_initial=v;%初始速度 m/s
s_initial=s;%初始位置 m
Np=30;%预测步长
% delta_T=0.2;%从初始计时点到现在经过的时间
sample_T=0.1;%采样时间间隔
%% 持续加速或者减速计算实际的位置，用于当作每次预测值的S0和V0（相当于传感器检测值）
a_initial=a;% m/s^2
v0=v_initial+a_initial*delta_T;
s0=s_initial+v_initial*delta_T+1/2*a_initial*delta_T^2;
%% 基于当前位置预测Surrounding Vehicle的位置
a_min=-2;
a_max=2;
s_min=zeros(1,Np);
s_max=zeros(1,Np);
for i=1:Np 
    delta_t=i*sample_T;
    s_min(i)=s0+v0*delta_t+1/2*a_min*delta_t^2;
    s_max(i)=s0+v0*delta_t+1/2*a_max*delta_t^2;
end
% fprintf("%.2f\n",s_min(i))
% figure(1)
% x=1:1:Np;
% plot(x,s_min,'r-',x,s_max,'b-')