close all
clear all
clc

%% ESERCIZIO LAMINARE
%L'aerodinamica di un profilo laminare

%% Disegnazione tecnica del profilo
%dati infittiti (240 pannelli) da XFoil

load GEOM_LAMINARE.txt
x = GEOM_LAMINARE(:,1);
y = GEOM_LAMINARE(:,2);
figure(1)
plot(x,y,'k')
axis equal
axis([-.1 1.1 -.15 .15])
xlabel('Corda');
ylabel('Curva');

%% Linea media
x_dorso=x(1:121);
y_dorso=y(1:121);

x_ventre=x(121:end);
y_ventre=y(121:end);

y_dorso_riadatt=spline(x_dorso,y_dorso,x_ventre);
theta1=linspace(0,pi,100);

x_ventre_ch=0.5*(1-cos(theta1));
y_ventre_ch=interp1(x_ventre,y_ventre,x_ventre_ch);
y_dorso_ch=interp1(x_dorso,y_dorso,x_ventre_ch);

y_ventre_ch=y_ventre_ch(2:end);
y_dorso_ch=y_dorso_ch(2:end);

x_ventre_ch=x_ventre_ch(2:end);

yml=(y_dorso_riadatt+y_ventre)/2;
yml_ch=(y_dorso_ch+y_ventre_ch)/2;

figure (2)
plot(x_ventre_ch,y_dorso_ch,'k','LineWidth',1.01)
hold on
plot(x_ventre_ch,y_ventre_ch,'k','LineWidth',1.01)
hold on
plot(x_ventre_ch,yml_ch,'--k')
grid on
axis equal
axis([0 1 -.15 .15])

xlabel('x/c','FontSize',15,'FontAngle','italic')
ylabel('z/c','FontSize',15,'FontAngle','italic')

%% Spessore massimo e andamento del semispessore
semisp = y_dorso_ch - yml_ch;
max(semisp)
figure(3)
plot(x_ventre_ch,semisp,'k','LineWidth',1.01)
grid on
axis equal
axis([0 1 -.15 .15])

xlabel('x/c','FontSize',15,'FontAngle','italic')
ylabel('z/c','FontSize',15,'FontAngle','italic')

%% SOLUZIONE IN CAMPO EULERIANO
% CL = 0.2
DATA_cl_02 = importdata('laminare_cl02.txt',' ',2);
 
xx_adim_02 = DATA_cl_02.data(:,1);
xx_dorso_02  = xx_adim_02(1:120);
xx_ventre_02 = xx_adim_02(120:end);
  
cp_02 = 1*DATA_cl_02.data(:,2);
cp_02_dorso  = cp_02(1:120);
cp_02_ventre = cp_02(120:end);

figure(4)
plot(xx_dorso_02,cp_02_dorso,'k')
hold on
grid on
plot(xx_ventre_02,cp_02_ventre,'k','LineStyle','--')
xlabel('x/c','FontSize',15,'FontAngle','italic')
ylabel('Cp (Cl = 0.2)','FontSize',15,'FontAngle','italic')
legend('dorso','ventre')
axis ij
%axis([0 1 1 -1])
cp_min_02 = min(cp_02)

% CL = 0.4
DATA_cl_04 = importdata('laminare_cl04.txt',' ',2);
 
xx_adim_04 = DATA_cl_04.data(:,1);
xx_dorso_04  = xx_adim_04(1:120);
xx_ventre_04 = xx_adim_04(120:end);
  
cp_04 = 1*DATA_cl_04.data(:,2);
cp_04_dorso  = cp_04(1:120);
cp_04_ventre = cp_04(120:end);

figure(5)
plot(xx_dorso_04,cp_04_dorso,'k')
hold on
grid on
plot(xx_ventre_04,cp_04_ventre,'k','LineStyle','--')
xlabel('x/c','FontSize',15,'FontAngle','italic')
ylabel('Cp (Cl = 0.4)','FontSize',15,'FontAngle','italic')
legend('dorso','ventre')
axis ij
%axis([0 1 1 -1])
cp_min_04 = min(cp_04)

% CL = 0.7
DATA_cl_07 = importdata('laminare_cl07.txt',' ',2);
 
xx_adim_07 = DATA_cl_07.data(:,1);
xx_dorso_07  = xx_adim_07(1:120);
xx_ventre_07 = xx_adim_07(120:end);
  
cp_07 = 1*DATA_cl_07.data(:,2);
cp_07_dorso  = cp_07(1:120);
cp_07_ventre = cp_07(120:end);

figure(6)
plot(xx_dorso_07,cp_07_dorso,'k')
hold on
grid on
plot(xx_ventre_07,cp_07_ventre,'k','LineStyle','--')
xlabel('x/c','FontSize',15,'FontAngle','italic')
ylabel('Cp (Cl = 0.7)','FontSize',15,'FontAngle','italic')
legend('dorso','ventre')
axis ij
%axis([0 1 1 -1])
cp_min_07 = min(cp_07)

% CL = 1
DATA_cl_1 = importdata('laminare_cl1.txt',' ',2);
 
xx_adim_1 = DATA_cl_1.data(:,1);
xx_dorso_1  = xx_adim_1(1:120);
xx_ventre_1 = xx_adim_1(120:end);
  
cp_1 = 1*DATA_cl_1.data(:,2);
cp_1_dorso  = cp_1(1:120);
cp_1_ventre = cp_1(120:end);

figure(7)
plot(xx_dorso_1,cp_1_dorso,'k')
hold on
grid on
plot(xx_ventre_1,cp_1_ventre,'k','LineStyle','--')
xlabel('x/c','FontSize',15,'FontAngle','italic')
ylabel('Cp (Cl = 1)','FontSize',15,'FontAngle','italic')
legend('dorso','ventre')
axis ij
%axis([0 1 1 -1])
cp_min_1 = min(cp_1)

%% ANDAMENTO CL - alpha AL VARIARE DEL NUMERO DI REYNOLDS
%Ottenuta in ITER = 500, Re = 1*10^7, alpha da -25 a 30

load prova_laminare3.txt
alpha_107 = prova_laminare3(:,1);      %valori di alpha
cl_107 = prova_laminare3(:,2);   
cm_107 = prova_laminare3(:,5);
cd_107 = prova_laminare3(:,3)*10^4;

figure(8)
plot(alpha_107,cl_107,'k')
grid on

xlabel('alpha','FontSize',15,'FontAngle','italic')
ylabel('Cl','FontSize',15,'FontAngle','italic')
axis ([-25 30 -2 2])

%Ottenuta in ITER = 500, Re = 5*10^6, alpha da -25 a 25

load laminare_563.txt
alpha_5106 = laminare_563(:,1);      %valori di alpha
cl_5106 = laminare_563(:,2);   
cm_5106 = laminare_563(:,5); 
cd_5106 = laminare_563(:,3)*10^4;

figure(9)
plot(alpha_5106,cl_5106,'k')
grid on

xlabel('alpha','FontSize',15,'FontAngle','italic')
ylabel('Cl','FontSize',15,'FontAngle','italic')
axis ([-25 25 -2 2])

%% PLOT SOVRAPPOSTI AL VARIARE DI Re
figure (10)
plot(alpha_107,cl_107,'k')
hold on
plot(alpha_5106,cl_5106,'--k')
grid on

xlabel('alpha','FontSize',15,'FontAngle','italic')
ylabel('Cl','FontSize',15,'FontAngle','italic')

axis([-25 30 -2 2])

legend('Re = 1*10^7','Re = 5*10^6')

%% POLARE AL VARIARE DI Re

figure (11)
plot(cd_107,cl_107,'k')
hold on
plot(cd_5106,cl_5106,'--k')
grid on

xlabel('Cd (Drag Count)','FontSize',15,'FontAngle','italic')
ylabel('Cl','FontSize',15,'FontAngle','italic')

legend('Re = 1*10^7','Re = 5*10^6')

%% mach 
gamma=1.4;
Cpmn =[-6.8737, -5.9209, -4.2907, -2.9691, -1.8971, -1.0313, -0.6452, -0.7563, -0.8683, -1.2386, -2.2401, -3.5176, -5.0068, -6.7768];
%Che corrispondono ai valori minimi di pressione per 
Cl= [-1, -.8, -.6, -.4, -.2, 0, .2, .4, .6, .8, 1, 1.2, 1.4, 1.6];

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
figure(12)
plot (M2cr, Cl,'-k')
% %title('Andamento del Mcr,inf in regime inviscoso al variare del coeff. di portanza')
xlabel('M_{\infty cr,inf}');ylabel('Cl')
grid on
%axis equal
axis ([0 1 -1 1.6]);