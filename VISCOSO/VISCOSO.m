clear all
close all
clc
%% MOTO VISCOSO ED INCOMPRIMIBILE

%% CL = 0 nel caso NON VISCOSO
DATA_cl_0 = importdata('CL0.txt',' ',2);
 
xx_adim_0 = DATA_cl_0.data(:,1);
xx_dorso_0  = xx_adim_0(1:120);
xx_ventre_0 = xx_adim_0(120:end);
  
cp_0 = 1*DATA_cl_0.data(:,2);
cp_0_dorso  = cp_0(1:120);
cp_0_ventre = cp_0(120:end);
%% CL = 0 per Re = 5 * 10^5

DATA_cl_05 = importdata('visc_05.txt',' ',2);

xx_adim_05 = DATA_cl_05.data(:,1);
xx_dorso_05  = xx_adim_05(1:120);
xx_ventre_05 = xx_adim_05(120:end);

cp_05 = 1*DATA_cl_05.data(:,2);
cp_05_dorso  = cp_05(1:120);
cp_05_ventre = cp_05(120:end);

figure(1)
plot(xx_dorso_05,cp_05_dorso,'-k')
hold on
plot(xx_ventre_05,cp_05_ventre,'-k')
hold on
plot(xx_dorso_0,cp_0_dorso,'--k')
hold on
plot(xx_ventre_0,cp_0_ventre,'--k')
grid on
xlabel('x/c','FontSize',15,'FontAngle','italic')
ylabel('Cp (Cl = 0)','FontSize',15,'FontAngle','italic')
legend('Re = 5*10^5','','Non viscoso')
axis ij


%% CL = 0 per Re = 5 * 10^6

DATA_cl_06 = importdata('visc_06.txt',' ',2);

xx_adim_06 = DATA_cl_06.data(:,1);
xx_dorso_06  = xx_adim_06(1:120);
xx_ventre_06 = xx_adim_06(120:end);

cp_06 = 1*DATA_cl_06.data(:,2);
cp_06_dorso  = cp_06(1:120);
cp_06_ventre = cp_06(120:end);

figure(2)
plot(xx_dorso_06,cp_06_dorso,'-k')
hold on
plot(xx_ventre_06,cp_06_ventre,'-k')
hold on
plot(xx_dorso_0,cp_0_dorso,'--k')
hold on
plot(xx_ventre_0,cp_0_ventre,'--k')
grid on
xlabel('x/c','FontSize',15,'FontAngle','italic')
ylabel('Cp (Cl = 0)','FontSize',15,'FontAngle','italic')
legend('Re = 5*10^6','','Non viscoso')
axis ij

%% Andamento Cl - alpha
%Ottenuta in ITER = 500, Re = 1*10^7, alpha da -22 a 24

load POLARE_107.txt
alpha_107 = POLARE_107(:,1);      %valori di alpha
cl_107 = POLARE_107(:,2);   
cm_107 = POLARE_107(:,5);
cd_107 = POLARE_107(:,3)*10^4;

figure(3)
plot(alpha_107,cl_107,'k')
grid on

xlabel('alpha','FontSize',15,'FontAngle','italic')
ylabel('Cl','FontSize',15,'FontAngle','italic')
axis ([-22 24 -2 2])

%Ottenuta in ITER = 500, Re = 5*10^6, alpha da -22 a 21

load POLARE_5106.txt
alpha_5106 = POLARE_5106(:,1);      %valori di alpha
cl_5106 = POLARE_5106(:,2);   
cm_5106 = POLARE_5106(:,5); 
cd_5106 = POLARE_5106(:,3)*10^4;

figure(4)
plot(alpha_5106,cl_5106,'k')
grid on

xlabel('alpha','FontSize',15,'FontAngle','italic')
ylabel('Cl','FontSize',15,'FontAngle','italic')
axis ([-22 21 -2 2])

%Ottenuta in ITER = 500, Re = 1*10^6, alpha da -15 a 11

load POLARE_106.txt
alpha_106 = POLARE_106(:,1);      %valori di alpha
cl_106 = POLARE_106(:,2);   
cm_106 = POLARE_106(:,5); 
cd_106 = POLARE_106(:,3)*10^4;

figure(5)
plot(alpha_106,cl_106,'k')
grid on

xlabel('alpha','FontSize',15,'FontAngle','italic')
ylabel('Cl','FontSize',15,'FontAngle','italic')
axis ([-15 11 -1.5 1.5])

%Ottenuta in ITER = 500, Re = 5*10^5, alpha da -10 a 12

load POLARE_5105.txt
alpha_5105 = POLARE_5105(:,1);      %valori di alpha
cl_5105 = POLARE_5105(:,2);   
cm_5105 = POLARE_5105(:,5);
cd_5105 = POLARE_5105(:,3)*10^4;

figure(6)
plot(alpha_5105,cl_5105,'k')
grid on

xlabel('alpha','FontSize',15,'FontAngle','italic')
ylabel('Cl','FontSize',15,'FontAngle','italic')
axis ([-10 12 -1.5 1.5])

%% PLOT SOVRAPPOSTI AL VARIARE DI Re
figure (7)
plot(alpha_107,cl_107,'k')
hold on
plot(alpha_5106,cl_5106,'--k')
hold on
plot(alpha_106,cl_106,':k')
hold on
plot(alpha_5105,cl_5105,'-.k')
grid on

xlabel('alpha','FontSize',15,'FontAngle','italic')
ylabel('Cl','FontSize',15,'FontAngle','italic')

axis([-22 24 -2 2])

legend('Re = 1*10^7','Re = 5*10^6','Re = 1*10^6','Re = 5*10^5')

%% POLARE AL VARIARE DI Re

figure (8)
plot(cd_107,cl_107,'k')
hold on
plot(cd_5106,cl_5106,'--k')
hold on
plot(cd_106,cl_106,':k')
hold on
plot(cd_5105,cl_5105,'-.k')
grid on

xlabel('Cd (Drag Count)','FontSize',15,'FontAngle','italic')
ylabel('Cl','FontSize',15,'FontAngle','italic')

legend('Re = 1*10^7','Re = 5*10^6','Re = 1*10^6','Re = 5*10^5')

%% PLOT SOVRAPPOSTI AL VARIARE DI Re di Cm - Cl
figure (9)
plot(cl_107,cm_107,'k')
hold on
plot(cl_5106,cm_5106,'--k')
hold on
plot(cl_106,cm_106,':k')
hold on
plot(cl_5105,cm_5105,'-.k')
grid on

xlabel('Cl','FontSize',15,'FontAngle','italic')
ylabel('Cm_a_c','FontSize',15,'FontAngle','italic')

%axis([-22 24 -2 2])

legend('Re = 1*10^7','Re = 5*10^6','Re = 1*10^6','Re = 5*10^5')

%% N VARIA 3 9 15

%% CL = 0 PER VISCOSO RE = 5*10^5

% N = 3
DATA_cl_3 = importdata('cp_cl0_N3.txt',' ',2);

xx_adim_3 = DATA_cl_3.data(:,1);
xx_dorso_3  = xx_adim_3(1:120);
xx_ventre_3 = xx_adim_3(120:end);

cp_3 = 1*DATA_cl_3.data(:,2);
cp_3_dorso  = cp_3(1:120);
cp_3_ventre = cp_3(120:end);

% N = 9
DATA_cl_9 = importdata('cp_cl0_N9.txt',' ',2);

xx_adim_9 = DATA_cl_9.data(:,1);
xx_dorso_9  = xx_adim_9(1:120);
xx_ventre_9 = xx_adim_9(120:end);

cp_9 = 1*DATA_cl_9.data(:,2);
cp_9_dorso  = cp_9(1:120);
cp_9_ventre = cp_9(120:end);

% N = 15
DATA_cl_15 = importdata('cp_cl0_N15.txt',' ',2);

xx_adim_15 = DATA_cl_15.data(:,1);
xx_dorso_15  = xx_adim_15(1:120);
xx_ventre_15 = xx_adim_15(120:end);

cp_15 = 1*DATA_cl_15.data(:,2);
cp_15_dorso  = cp_15(1:120);
cp_15_ventre = cp_15(120:end);

figure(10)
plot(xx_dorso_3,cp_3_dorso,'--k')
hold on
plot(xx_ventre_3,cp_3_ventre,'--k')
hold on
plot(xx_dorso_9,cp_9_dorso,'k')
hold on
plot(xx_ventre_9,cp_9_ventre,'k')
hold on
plot(xx_dorso_15,cp_15_dorso,'.-k')
hold on
plot(xx_ventre_15,cp_15_ventre,'.-k')
grid on
xlabel('x/c','FontSize',15,'FontAngle','italic')
ylabel('Cp (Cl = 0)','FontSize',15,'FontAngle','italic')
legend('N=3','','N=9','','N=15')
axis ij

%% Andamento Cl - alpha
%Ottenuta in ITER = 500, Re = 1*10^7, alpha da -22 a 24

%N = 9
% load POLARE_107.txt
% alpha_107 = POLARE_107(:,1);      %valori di alpha
% cl_107 = POLARE_107(:,2);   
% cm_107 = POLARE_107(:,5);
% cd_107 = POLARE_107(:,3)*10^4;

% N = 3
load polare_n3.txt
alpha_3 = polare_n3(:,1);      %valori di alpha
cl_3 = polare_n3(:,2);   
cm_3 = polare_n3(:,5);
cd_3 = polare_n3(:,3)*10^4;

% N = 15 
load polare_n15.txt
alpha_15 = polare_n15(:,1);      %valori di alpha
cl_15 = polare_n15(:,2);   
cm_15 = polare_n15(:,5);
cd_15 = polare_n15(:,3)*10^4;

% PLOT SOVRAPPOSTI AL VARIARE DI N
figure (11)
plot(alpha_3,cl_3,'--k')
hold on
plot(alpha_15,cl_15,'-.k')
hold on
plot(alpha_107,cl_107,'k')
grid on

xlabel('alpha','FontSize',15,'FontAngle','italic')
ylabel('Cl','FontSize',15,'FontAngle','italic')

% axis([-22 24 -2 2])

legend('N=3','N=15','N=9')

%% POLARE AL VARIARE DI N

figure (12)
plot(cd_107,cl_107,'k')
hold on
plot(cd_3,cl_3,'--k')
hold on
plot(cd_15,cl_15,'-.k')

grid on

axis([0 150 -0.5 0.5])
xlabel('Cd (Drag Count)','FontSize',15,'FontAngle','italic')
ylabel('Cl','FontSize',15,'FontAngle','italic')
%axis([0 3000 -2 2])
legend('N=9','N=3','N=15')


%% PLOT SOVRAPPOSTI AL VARIARE DI N di Cm - Cl
figure (13)
plot(cl_107,cm_107,'k')
hold on
plot(cl_3,cm_3,'--k')
hold on
plot(cl_15,cm_15,':k')
grid on

xlabel('Cl','FontSize',15,'FontAngle','italic')
ylabel('Cm_a_c','FontSize',15,'FontAngle','italic')

%axis([-22 24 -2 2])

legend('N=9','N=3','N=15')

%% POSIZIONE DEL PUNTO DI TRANSIZIONE LIBERA AL VARIARE DI REYNOLDS
top_xt106= POLARE_106(:,6);      
bot_xt106 = POLARE_106(:,7);   

top_xt107= POLARE_107(:,6);      
bot_xt107 = POLARE_107(:,7); 

top_xt5105= POLARE_5105(:,6);      
bot_xt5105 = POLARE_5105(:,7); 

top_xt5106= POLARE_5106(:,6);      
bot_xt5106 = POLARE_5106(:,7); 

% PLOT SOVRAPPOSTI TRANSIZIONE LIBERA TOP al variare di Re
figure (14)
plot(alpha_107,top_xt107,'k')
hold on
plot(alpha_5106,top_xt5106,'--k')
hold on
plot(alpha_106,top_xt106,':k')
hold on
plot(alpha_5105,top_xt5105,'-.k')
grid on

xlabel('alpha','FontSize',15,'FontAngle','italic')
ylabel('x_tr, upper/c','FontSize',15,'FontAngle','italic')

axis([-20 20 0 1])

% PLOT SOVRAPPOSTI TRANSIZIONE LIBERA BOT al variare di Re
figure (15)
plot(alpha_107,bot_xt107,'k')
hold on
plot(alpha_5106,bot_xt5106,'--k')
hold on
plot(alpha_106,bot_xt106,':k')
hold on
plot(alpha_5105,bot_xt5105,'-.k')
grid on

xlabel('alpha','FontSize',15,'FontAngle','italic')
ylabel('x_tr, lower/c','FontSize',15,'FontAngle','italic')

axis([-20 20 0 1])

legend('Re = 1*10^7','Re = 5*10^6','Re = 1*10^6','Re = 5*10^5')

%% POSIZIONE DEL PUNTO DI TRANSIZIONE LIBERA AL VARIARE DI N (3, 9 , 15)
top_xt107= POLARE_107(:,6);      
bot_xt107 = POLARE_107(:,7); 

top_xt3= polare_n3(:,6);      
bot_xt3 = polare_n3(:,7); 

top_xt15= polare_n15(:,6);      
bot_xt15 = polare_n15(:,7); 

% PLOT SOVRAPPOSTI TRANSIZIONE LIBERA TOP al variare di Re
figure (16)
plot(alpha_107,top_xt107,'k')
hold on
plot(alpha_3,top_xt3,'--k')
hold on
plot(alpha_15,top_xt15,':k')
grid on

xlabel('alpha','FontSize',15,'FontAngle','italic')
ylabel('x_tr, upper/c','FontSize',15,'FontAngle','italic')

axis([-20 20 0 1])
legend('N=9','N=3','N=15')

% PLOT SOVRAPPOSTI TRANSIZIONE LIBERA BOT al variare di Re
figure (17)
plot(alpha_107,bot_xt107,'k')
hold on
plot(alpha_3,bot_xt3,'--k')
hold on
plot(alpha_15,bot_xt15,':k')
grid on

xlabel('alpha','FontSize',15,'FontAngle','italic')
ylabel('x_tr, lower/c','FontSize',15,'FontAngle','italic')

axis([-20 20 0 1])

legend('N=9','N=3','N=15')