clear
clc
k = 2;
alfa = 0.8;
r = 3;
p = 0:0.01:0.2;% ͨ������p����r�䶯���۲����㣡
N=[80,100];
maxgen=10; %��������
popsize=50; %��Ⱥ��ģ
pcross=0.8; %�������
pmutation=0.2; %�������
T0 = 97;
Tf = 3;
a = 0.75;

M = 100;

for N1 = N
    gaPP1 = zeros(length(p),M);
    gaTT1 = zeros(length(p),M);
    for pi = p
        for i = 1:M
            [C,Q] = RB_plusplus(k,N1,alfa,r,pi);
            tic;tic;[res,sol] = GA_SA_RB(C,Q,N1,alfa,pi,maxgen,popsize,pcross,pmutation,Tf,T0,a);
            gaTT1(p==pi,i) = toc;toc
            gaPP1(p==pi,i) = res;
            disp(['Ŀǰ�����p=',num2str(pi)]);
            disp(['Ŀǰ���㵽��',num2str(i),'��'])
            %save(['SA_GA_test1_data_N=',num2str(N1),'_p=',num2str(pi),'_i=',num2str(i)],'gaPP1','gaTT1');
        end
        datapath1 = ['SA_GA_test6_data_N=',num2str(N1),'_p=',num2str(pi),'.mat'];
        save(datapath1,'gaPP1','gaTT1');
    end
    datapath2 = ['SA_GA_test6_data_N=',num2str(N1),'.mat'];
    save(datapath2,'gaPP1','gaTT1');
end
dtpath = 'SA_GA_test6_data.mat';
save(dtpath,'gaPP1','gaTT1');
