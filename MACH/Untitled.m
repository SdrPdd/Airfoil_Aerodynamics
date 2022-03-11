clear all; close all; clc;
gamma=1.4;
Cpmn= [-7.5938, -5.9456, -4.4987, -3.2155 , -2.0980, -1.2108, -0.6313, -0.7640, -1.4413, -2.384, -3.5482];
Cl = [-1, -0.8, -0.6, -0.4, -0.2, 0, 0.2, 0.4 , 0.6 , 0.8 , 1 ]; 
% LaCurva di Karman e Tsien  (che chiamo KT) approssima bene i dati sperimentali ma non è
% valida in prossimità del Mach sonico, quindi considero un mesh del tipo:

M2=linspace(0,1,5000); %M^2, cioè l'incognita del nostro problema
M2cr=zeros(length(Cl),1);
for j=1:length(Cpmn)
for i=1:length(M2)
            
    cpmin1(i) =((((1+(((gamma-1)/2)*M2(i)))/((gamma+1)/2))^(gamma/(gamma-1)))-1)*2/(gamma*M2(i));% Andamento isoentropico
                    
     KT(i)=Cpmn(j)/(sqrt(1-M2(i))+((Cpmn(j)/2)*M2(i)/(1+sqrt(1-M2(i))))); %Karman e Tsien
                    
      if abs(cpmin1(i)-KT(i)) <0.01
                      
       C=M2(i);  %Se  il modulo delle differenze tra le due curve è prossimoa 0, abbiamo trovato l'incognita M^2
       M2cr(j)=sqrt(C);   %cioè il M cr inferiore           
      end
end
end
M2cr(:) %Stampo a video i vari Mach critici trovati per i diversi Cpmin (e quindi Cl)

%  Grafico
plot(xlim,[0,0],'k',[0,0],ylim,'k', 'LineWidth', 0.2);
plot (M2cr, Cl,'-k')
% %title('Andamento del Mcr,inf in regime inviscoso al variare del coeff. di portanza')
xlabel('M_{\infty cr,inf}');ylabel('Cl')
grid on
%axis equal


axis ([0 1 -1 1]);

figure(2);

CL_Prandel_Glauert = 0.5./(1-M2.^2) ;
CL_PG= 1./(1-M2.^2);
CL_PG2= 0.8./(1-M2.^2);
CL_PG3= 0.6./(1-M2.^2);
CL_PG4= 0.4./(1-M2.^2);
CL_PG5= 0.2./(1-M2.^2);
CL_PG6= -0.2./(1-M2.^2);
CL_PG7= -0.4./(1-M2.^2);
CL_PG8= -0.6./(1-M2.^2);
CL_PG9= -0.8./(1-M2.^2);
CL_PG10= -1./(1-M2.^2);

 
    %plot(M2,CL_Prandel_Glauert,'LineWidth',1.2); hold on;
    plot(M2,CL_PG,'--k'); hold on;
    plot(M2,CL_PG2,'--k'); hold on;
    plot(M2,CL_PG3,'--k'); hold on;
    plot(M2,CL_PG4,'--k'); hold on;
     plot(M2,CL_PG5,'--k'); hold on;
    plot(M2,CL_PG6,'--k'); hold on;
    plot(M2,CL_PG7,'--k'); hold on;
    plot(M2,CL_PG8,'--k'); hold on;
    plot(M2,CL_PG9,'--k'); hold on;
    plot(M2,CL_PG10,'--k'); hold on;

   plot(xlim,[0,0],'k',[0,0],ylim,'k');
    
xlabel('M_\infty','FontSize',15,'FontAngle','italic'); grid on;
ylabel('Cl','FontSize',15,'FontAngle','italic');
   grid on;
    plot(M2cr,Cl,'-k');
    axis([0 1 -1 1]);
legend ( 'M_\infty_,cr','Regime subsonico');