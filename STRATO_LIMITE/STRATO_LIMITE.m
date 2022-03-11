%% STRATO LIMITE
clear all
close all
clc
%% ALTA PORTANZA

load strato_lim.txt
s = strato_lim(:,1);
h = strato_lim(:,8);
cf = strato_lim(:,7);
dstar = strato_lim(:,5);
vel = strato_lim(:,4);

%Plot fattore di forma H
figure(1)
plot(s,h,'k')
grid on
axis([0 2 1 5.5])
xlabel('s');
ylabel('H');

%Plot coefficiente di attrito cf
figure(2)
plot(s,cf,'k')
grid on
axis([0 2 -0.005 .04])
xlabel('s');
ylabel('Cf');

%Plot spessore di spostamento delta
figure(3)
plot(s,dstar,'k')
grid on
axis([0 2 0 0.016])
xlabel('s');
ylabel('\delta*');

%Plot fattore di forma H
figure(4)
plot(s,vel,'k')
grid on
axis([0 2 -1 3.1])
xlabel('s');
ylabel('U_e/V');

%% TRANSIZIONE FORZATA
%SENZA TRANSIZIONE FORZATA
%Ottenuta in ITER = 500, Re = 5*10^6, alpha da -22 a 21

load POLARE_5106.txt
alpha_5106 = POLARE_5106(:,1);      %valori di alpha
cl_5106 = POLARE_5106(:,2);   
cm_5106 = POLARE_5106(:,5); 
cd_5106 = POLARE_5106(:,3)*10^4;

%CON TRANSIZIONE FORZATA AL 20% DELLA CORDA
%Ottenuta in ITER = 500, Re = 5*10^6, alpha da -21 a 21

load forzato.txt
alpha_5106 = forzato(:,1);      %valori di alpha
cl_f = forzato(:,2);   
cm_f = forzato(:,5); 
cd_f = forzato(:,3)*10^4;

% POLARE SOVRAPPOSTA
figure (5)
plot(cd_f,cl_f,'k')
hold on
plot(cd_5106,cl_5106,'--k')

grid on
%axis ([0 1400 -1.5 2])
axis([0 200 -0.5 0.5])
xlabel('Cd (Drag Count)','FontSize',15,'FontAngle','italic')
ylabel('Cl','FontSize',15,'FontAngle','italic')

legend('Forzato','Non Forzato')

 %ANDAMENTO DEL CP
 % CL = 0 per Re = 5 * 10^6
DATA_cl_06 = importdata('visc_06.txt',' ',2);

xx_adim_06 = DATA_cl_06.data(:,1);
xx_dorso_06  = xx_adim_06(1:120);
xx_ventre_06 = xx_adim_06(120:end);

cp_06 = 1*DATA_cl_06.data(:,2);
cp_06_dorso  = cp_06(1:120);
cp_06_ventre = cp_06(120:end);

% CL = 0 per Re = 5 * 10^6 - TRANSIZIONE FORZATA
DATA_cl_F = importdata('cp_forzato.txt',' ',2);

xx_adim_F = DATA_cl_F.data(:,1);
xx_dorso_F  = xx_adim_F(1:120);
xx_ventre_F = xx_adim_F(120:end);

cp_F = 1*DATA_cl_F.data(:,2);
cp_F_dorso  = cp_F(1:120);
cp_F_ventre = cp_F(120:end);

figure(6)
plot(xx_dorso_06,cp_06_dorso,'--k')
hold on
plot(xx_ventre_06,cp_06_ventre,'--k')
hold on
plot(xx_dorso_F,cp_F_dorso,'-k')
hold on
plot(xx_ventre_F,cp_F_ventre,'-k')
grid on
xlabel('x/c','FontSize',15,'FontAngle','italic')
ylabel('Cp (Cl = 0)','FontSize',15,'FontAngle','italic')
legend('Non Forzato','','Forzato')
axis ij

%% Andamento Cl - alpha

load forzato.txt
alpha_f = forzato(:,1);      %valori di alpha
cl_f = forzato(:,2);   
cm_f = forzato(:,5); 

figure(7)
plot(alpha_f,cl_f,'k')
grid on


%axis ([-10 6 -1 1])
xlabel('alpha','FontSize',15,'FontAngle','italic')
ylabel('Cl_a','FontSize',15,'FontAngle','italic')