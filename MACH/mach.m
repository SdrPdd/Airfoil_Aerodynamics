clc; clear all; close all;

gamma=1.4;
Cpmn =[-7.6183, -5.9598, -3.8123, -2.1700, -1.0456, -0.4513, -0.3896, -0.7461, -1.6828, -3.1180, -5.0759];
%Che corrispondono ai valori minimi di pressione per 
Cl= [-1, -.8, -.6, -.4, -.2, 0, .2, .4, .6, .8, 1];

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
plot (M2cr, Cl,'-k')
% %title('Andamento del Mcr,inf in regime inviscoso al variare del coeff. di portanza')
xlabel('M_{\infty cr,inf}');ylabel('Cl')
grid on
%axis equal
axis ([0 1 -1 1]);

%CORREZIONE P-G
% Mxx =M2
%M_cr_inf = M2cr;
%cl = Cl;

figure(2)
Cl_Prandel_Glauert2N = -0.2./(1-M2.^2) ;
Cl_Prandel_Glauert4N = -0.4./(1-M2.^2) ;
Cl_Prandel_Glauert6N = -0.6./(1-M2.^2) ;
Cl_Prandel_Glauert8N = -0.8./(1-M2.^2) ;
Cl_Prandel_Glauert1N = -1./(1-M2.^2) ;
Cl_Prandel_Glauert0 = 0./(1-M2.^2) ;
Cl_Prandel_Glauert2 = 0.2./(1-M2.^2) ;
Cl_Prandel_Glauert4 = 0.4./(1-M2.^2) ;
Cl_Prandel_Glauert6 = 0.6./(1-M2.^2) ;
Cl_Prandel_Glauert8 = 0.8./(1-M2.^2) ;
Cl_Prandel_Glauert1 = 1./(1-M2.^2) ;

plot(M2,Cl_Prandel_Glauert2N,'--');
hold on;
plot(M2,Cl_Prandel_Glauert4N,'--');
hold on;
plot(M2,Cl_Prandel_Glauert6N,'--');
hold on;
plot(M2,Cl_Prandel_Glauert8N,'--');
hold on;
plot(M2,Cl_Prandel_Glauert1N,'--');
hold on;
plot(M2,Cl_Prandel_Glauert0,'--');
hold on;
plot(M2,Cl_Prandel_Glauert2,'--');
hold on;
plot(M2,Cl_Prandel_Glauert4,'--');
hold on;
plot(M2,Cl_Prandel_Glauert6,'--');
hold on;
plot(M2,Cl_Prandel_Glauert8,'--');
hold on;
plot(M2,Cl_Prandel_Glauert1,'--');
hold on;
plot(M2cr,Cl,'LineWidth',1.2);
axis([0 1 -1 1]);
xlabel('M_i_n_f','FontSize',15,'FontAngle','italic'); grid on;
ylabel('Cl','FontSize',15,'FontAngle','italic');

%% CL = 0.3 per Mach 0 e Mach 0.3
DATA_cl_03 = importdata('cp_mach_03.txt',' ',2);
 
xx_adim_03 = DATA_cl_03.data(:,1);
xx_dorso_03  = xx_adim_03(1:120);
xx_ventre_03 = xx_adim_03(120:end);
  
cp_03 = 1*DATA_cl_03.data(:,2);
cp_03_dorso  = cp_03(1:120);
cp_03_ventre = cp_03(120:end);

DATA_cl_0 = importdata('cp_mach_0.txt',' ',2);
 
xx_adim_0 = DATA_cl_0.data(:,1);
xx_dorso_0  = xx_adim_0(1:120);
xx_ventre_0 = xx_adim_0(120:end);
  
cp_0 = 1*DATA_cl_0.data(:,2);
cp_0_dorso  = cp_0(1:120);
cp_0_ventre = cp_0(120:end);

figure(3)
plot(xx_dorso_03,cp_03_dorso,'k')
hold on
plot(xx_ventre_03,cp_03_ventre,'k')
hold on
plot(xx_dorso_0,cp_0_dorso,'--k')
hold on
plot(xx_ventre_0,cp_0_ventre,'--k')

grid on
xlabel('x/c','FontSize',15,'FontAngle','italic')
ylabel('Cp (Cl = 0.3)','FontSize',15,'FontAngle','italic')
legend('Mach = 0.3','','Mach = 0')

axis ij


%% CL = 0.3 per Mach 0 e Mach 0.7
DATA_cl_07 = importdata('cp_mach_07.txt',' ',2);
 
xx_adim_07= DATA_cl_07.data(:,1);
xx_dorso_07  = xx_adim_07(1:120);
xx_ventre_07 = xx_adim_07(120:end);
  
cp_07 = 1*DATA_cl_07.data(:,2);
cp_07_dorso  = cp_07(1:120);
cp_07_ventre = cp_07(120:end);

DATA_cl_0 = importdata('cp_mach_0.txt',' ',2);
 
xx_adim_0 = DATA_cl_0.data(:,1);
xx_dorso_0  = xx_adim_0(1:120);
xx_ventre_0 = xx_adim_0(120:end);
  
cp_0 = 1*DATA_cl_0.data(:,2);
cp_0_dorso  = cp_0(1:120);
cp_0_ventre = cp_0(120:end);

figure(4)
plot(xx_dorso_07,cp_07_dorso,'k')
hold on
plot(xx_ventre_07,cp_07_ventre,'k')
hold on
plot(xx_dorso_0,cp_0_dorso,'--k')
hold on
plot(xx_ventre_0,cp_0_ventre,'--k')

grid on
xlabel('x/c','FontSize',15,'FontAngle','italic')
ylabel('Cp (Cl = 0.3)','FontSize',15,'FontAngle','italic')
legend('Mach = 0.7','','Mach = 0')
axis ij


%% RETTA DI PORTANZA

load pacc_7.txt           %MACH = 0
alpha0 = pacc_7(:,1);      %valori di alpha
cl0 = pacc_7(:,2);   

load portanza_m03.txt     %MACH = 0.3
alpha3 = portanza_m03(:,1);      %valori di alpha
cl3 = portanza_m03(:,2);   

load portanza_m05.txt     %MACH = 0.5
alpha5 = portanza_m05(:,1);      %valori di alpha
cl5 = portanza_m05(:,2);   

load portanza_m07.txt     %MACH = 0.7
alpha7 = portanza_m07(:,1);      %valori di alpha
cl7 = portanza_m07(:,2); 

figure(5)
plot(alpha0,cl0,'k')
hold on
plot(alpha3,cl3,'--k')
hold on
plot(alpha5,cl5,'-.k')
hold on
plot(alpha7,cl7,':k')
grid on

legend('Mach = 0','Mach = 0.3','Mach = 0.5','Mach = 0.7')
xlabel('alpha','FontSize',15,'FontAngle','italic')
ylabel('Cl_a','FontSize',15,'FontAngle','italic')
axis ([-10 6 -1 1])