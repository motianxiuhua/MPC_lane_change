function [s_min,s_max] = Surroundings(v,a,s,delta_T)%�ƺ�s_maxҲû�б�Ҫ����
v_initial=v;%��ʼ�ٶ� m/s
s_initial=s;%��ʼλ�� m
Np=30;%Ԥ�ⲽ��
% delta_T=0.2;%�ӳ�ʼ��ʱ�㵽���ھ�����ʱ��
sample_T=0.1;%����ʱ����
%% �������ٻ��߼��ټ���ʵ�ʵ�λ�ã����ڵ���ÿ��Ԥ��ֵ��S0��V0���൱�ڴ��������ֵ��
a_initial=a;% m/s^2
v0=v_initial+a_initial*delta_T;
s0=s_initial+v_initial*delta_T+1/2*a_initial*delta_T^2;
%% ���ڵ�ǰλ��Ԥ��Surrounding Vehicle��λ��
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