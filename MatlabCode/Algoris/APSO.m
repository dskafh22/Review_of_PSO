
%��׼PSO---Acley����---����
%%������ʼ��


    clc;
    clear;
    c1=1.49445;
    c2=1.49445;
    maxg=1000;     %��������
    %--------------------------------------------------------------------------
    sizepop=80;    %��Ⱥ��ģ  N=20/80
    par_num=30;    %best_particle number  D=10/30
    popmax=1;      %��Ⱥ���±߽�ֵ
    %  32      5.21       600       10      100     30          10      
    %  Ackley  Rastrigin  Griewank  Alpine  Sphere  Rosenbrock  Schwefel
    %
    %  1
    %  Sum_of_Different_Power
    %--------------------------------------------------------------------------
    popmin=-popmax;
    Vmax=0.15*popmax;
    Vmin=0.15*popmin;


    wmax=0.8;
    wmin=0.6;

%�ظ�50��
for t=1:50
    %%������ʼ���Ӻ��ٶ�
    for i=1:sizepop
        pop(i,:)=popmax.*rands(1,par_num);    %��ʼλ��
        V(i,:)=Vmax.*rands(1,par_num);        %��ʼ�ٶ�
        fitness(i)=Sum_of_Different_Power(pop(i,:));%��Ӧ��------------------------------
    end

    %Ѱ�����Ÿ���
    [bestfitness bestindex]=min(fitness);
    pBest=pop;                  %�������
    gBest=pop(bestindex,:);     %ȫ�����
    fitnesspbest=fitness;       %���������Ӧ��
    fitnessgbest=bestfitness;   %ȫ�������Ӧ��

    %%����Ѱ��
    for i=1:maxg
        for j=1:sizepop
            fv(j)=fun(pop(j,:));
        end
        favg=sum(fv)/sizepop;
        fmin=min(fv);
        for j=1:sizepop
            if fv(j)<=favg
                w= wmin+(fv(j)-fmin)*(wmax-wmin)/(favg-fmin);
            else
                w=wmax;
            end
            %�ٶȸ���
            V(j,:)=w*V(j,:)+c1*rand*(pBest(j,:)-pop(j,:))+c2*rand*(gBest-pop(j,:));
            V(j,find(V(j,:)>Vmax))=Vmax;
            V(j,find(V(j,:)<Vmin))=Vmin;

            %��Ⱥ����
            pop(j,:)=pop(j,:)+V(j,:);
            pop(j,find(pop(j,:)>popmax))=popmax;
            pop(j,find(pop(j,:)<popmin))=popmin;

    %         %����Ӧ����
    %         if rand>0.8
    %             k=ceil(par_num*rand);
    %             pop(j,k)=rand;
    %         end

    %         %��Ӧ��ֵ
                     fitness(j)=Sum_of_Different_Power(pop(j,:));%------------------------------------

            %�������Ÿ���
            if fitness(j)<fitnesspbest(j)
                pBest(j,:)=pop(j,:);
                fitnesspbest(j)=fitness(j);
            end

            %Ⱥ�����Ÿ���
            if fitness(j)<fitnessgbest
                gBest=pop(j,:);
                fitnessgbest=fitness(j);
            end
        end
        result(i)=fitnessgbest;
    end

%     plot(result);
%     title('��Ӧ������ ');
%     grid on
%     xlabel('��������');
%     ylabel('��Ӧ��');
time(t)=result(1000);
end


    
    
        
        
        
        
        
        
        
        
        
    
    
    