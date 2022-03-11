clear all
close all
clc
%% DEFLESSIONE FLAP
% Configurazione per deflessione flap di 10°, 20°, 30°
load GEOM1.txt
x = GEOM1(:,1);
y = GEOM1(:,2);

%Configurazione 10°
load flap_10.txt
x_profilo_10 = flap_10(:,1);
y_profilo_10 = flap_10(:,2);
 
%Configurazione 20°
load flap_20.txt
x_profilo_20 = flap_20(:,1);
y_profilo_20 = flap_20(:,2);

%Configurazione 30°
load flap_30.txt
x_profilo_30 = flap_30(:,1);
y_profilo_30 = flap_30(:,2);

figure(1)

plot(x,y,'--k')
hold on
plot(x_profilo_10,y_profilo_10,'g')
hold on
plot(x_profilo_20,y_profilo_20,'r')
hold on
plot(x_profilo_30,y_profilo_30,'b')
hold on

axis equal
grid on 
xlabel('x/c');
ylabel('z/c');
            
legend('\delta_a = 0°','\delta_a = 10°','\delta_a = 20°','\delta_a = 30°') ;

%% Andamento della curvatura rispetto all'ascissa curvilinea s flap=20°
% valutiamo l'andamento della curva nel caso di flap flesso di 20°
load DATI_S_20.txt
s_20 = DATI_S_20(:,4);     %ascissa curvilinea
x_s_20 = DATI_S_20(:,2);   %ascissa del profilo
y_s_20 = DATI_S_20(:,3);   %ordinata del profilo

alpha_20 = DATI_S_20(:,6);     %curvatura
curv_s_20=DATI_S_20(:,4);


exp = 0.6; %fattore esponenziale
for i=1:numel(alpha_20)
    if (alpha_20(i)>0)
        alpha_20(i)=(alpha_20(i))^exp;
    end
    
    if (alpha_20(i)<0)
        alpha_20(i)=-((alpha_20(i))^exp);
    end
end

figure(2)
plot(curv_s_20,alpha_20,'k')
hold on 

grid on
axis([-inf inf -inf inf])
xlabel('s','FontSize',15,'FontAngle','italic')
ylabel('curvature','FontSize',15,'FontAngle','italic')


%% CP (alfa = 2°) - x/c - 0°
DATA_no = importdata('attac_0.txt',' ',2);
 
xx_adim_no = DATA_no.data(:,1);
xx_dorso_no  = xx_adim_no(1:120);
xx_ventre_no = xx_adim_no(120:end);
  
cp_no = 1*DATA_no.data(:,2);
cp_no_dorso  = cp_no(1:120);
cp_no_ventre = cp_no(120:end);

cp_min_no = min(cp_no)

%% CP (alfa = 2°) - x/c - 10°
DATA_10 = importdata('attac_10.txt',' ',2);
 
xx_adim_10 = DATA_10.data(:,1);
xx_dorso_10  = xx_adim_10(1:120);
xx_ventre_10 = xx_adim_10(120:end);
  
cp_10 = 1*DATA_10.data(:,2);
cp_10_dorso  = cp_10(1:120);
cp_10_ventre = cp_10(120:end);

%sovrappongo deflessione e senza deflessione
figure(3)
plot(xx_dorso_no,cp_no_dorso,'--k')
hold on
plot(xx_ventre_no,cp_no_ventre,'--k')
hold on
plot(xx_dorso_10,cp_10_dorso,'k')
hold on
grid on
plot(xx_ventre_10,cp_10_ventre,'k')
xlabel('x/c','FontSize',15,'FontAngle','italic')
ylabel('Cp (alpha = 2°)','FontSize',15,'FontAngle','italic')
legend('\delta_a = 0°','','\delta_a = 10°')
axis ij

cp_min_10 = min(cp_10)

%% CP (alfa = 2°) - x/c - 20°
DATA_20 = importdata('attac_20.txt',' ',2);
 
xx_adim_20 = DATA_20.data(:,1);
xx_dorso_20  = xx_adim_20(1:120);
xx_ventre_20 = xx_adim_20(120:end);
  
cp_20 = 1*DATA_20.data(:,2);
cp_20_dorso  = cp_20(1:120);
cp_20_ventre = cp_20(120:end);
 
figure(4)
plot(xx_dorso_no,cp_no_dorso,'--k')
hold on
plot(xx_ventre_no,cp_no_ventre,'--k')
hold on
plot(xx_dorso_20,cp_20_dorso,'k')
hold on
grid on
plot(xx_ventre_20,cp_20_ventre,'k')
xlabel('x/c','FontSize',15,'FontAngle','italic')
ylabel('Cp (alpha = 2°)','FontSize',15,'FontAngle','italic')
legend('\delta_a = 0°','','\delta_a = 20°')
axis ij

cp_min_20 = min(cp_20)

%% CP (alfa = 2°) - x/c - 30°
DATA_30 = importdata('attac_30.txt',' ',2);
 
xx_adim_30 = DATA_30.data(:,1);
xx_dorso_30  = xx_adim_30(1:120);
xx_ventre_30 = xx_adim_30(120:end);
  
cp_30 = 1*DATA_30.data(:,2);
cp_30_dorso  = cp_30(1:120);
cp_30_ventre = cp_30(120:end);
 
figure(5)
plot(xx_dorso_no,cp_no_dorso,'--k')
hold on
plot(xx_ventre_no,cp_no_ventre,'--k')
hold on
plot(xx_dorso_30,cp_30_dorso,'k')
hold on
grid on
plot(xx_ventre_30,cp_30_ventre,'k')
xlabel('x/c','FontSize',15,'FontAngle','italic')
ylabel('Cp (alpha = 2°)','FontSize',15,'FontAngle','italic')
legend('\delta_a = 0°','','\delta_a = 30°')
axis ij

cp_min_30 = min(cp_30)


%% Andamento Cl - alpha 

% DELTA 0°
%Nel caso viscoso con Re = 1*10^7
%Ottenuta in ITER = 500, Re = 1*10^7, alpha da -22 a 24
load POLARE_107.txt
alpha_107 = POLARE_107(:,1);      %valori di alpha
cl_107 = POLARE_107(:,2);   
cm_107 = POLARE_107(:,5);
cd_107 = POLARE_107(:,3)*10^4;

figure(6)
plot(alpha_107,cl_107,'k')
grid on

xlabel('alpha','FontSize',15,'FontAngle','italic')
ylabel('Cl','FontSize',15,'FontAngle','italic')
axis ([-22 24 -2 2])

%DELTA 10°
load POLARE_FLAP10.txt
alpha_10 = POLARE_FLAP10(:,1);      %valori di alpha
cl_10 = POLARE_FLAP10(:,2);   

%plot(alpha_10,cl_10,'k')

% calcolo approssimato della pendenza della retta di portanza da x-foil
 Cl_a_10 = (cl_10(end)-cl_10(1))/(alpha_10(end)-alpha_10(1)); 
 Cl_a_10_rad = Cl_a_10 *180/pi ;

% [~,indexCl_10] = min(abs(cl_10));
% alpha_zl_10=alpha(indexCl_10)

%DELTA 20°
load POLARE_FLAP20.txt
alpha_20 = POLARE_FLAP20(:,1);      %valori di alpha
cl_20 = POLARE_FLAP20(:,2);   

%plot(alpha_20,cl_20,'k')

% calcolo approssimato della pendenza della retta di portanza da x-foil
 Cl_a_20 = (cl_20(end)-cl_20(1))/(alpha_20(end)-alpha_20(1)); 
 Cl_a_20_rad = Cl_a_20 *180/pi ;

% [~,indexCl_20] = min(abs(cl_20));
% alpha_zl_20=alpha(indexCl_20)

%DELTA 30°
load POLARE_FLAP30.txt
alpha_30 = POLARE_FLAP30(:,1);      %valori di alpha
cl_30 = POLARE_FLAP30(:,2);   

%plot(alpha_30,cl_30,'k')

% calcolo approssimato della pendenza della retta di portanza da x-foil
Cl_a_30 = (cl_30(end)-cl_30(1))/(alpha_30(end)-alpha_30(1)); 
Cl_a_30_rad = Cl_a_30 *180/pi ;

% [~,indexCl_30] = min(abs(cl_30));
% alpha_zl_30=alpha(indexCl_30)

% PLOT SOVRAPPOSTI
figure (7)
plot(alpha_107,cl_107,'k')
hold on
plot(alpha_10,cl_10,'--k')
hold on
plot(alpha_20,cl_20,':k')
hold on
plot(alpha_30,cl_30,'-.k')
hold on 
plot(14,2.271,'*')
hold on
plot(16,2.211,'*')
hold on
plot(18,2.101,'*')
hold on
plot(19,1.928,'*')
grid on
xlabel('alpha','FontSize',15,'FontAngle','italic')
ylabel('Cl_a','FontSize',15,'FontAngle','italic')
axis([-15 24 0 2.5])
legend('\delta_a = 0°','\delta_a = 10°','\delta_a = 20°','\delta_a = 30°')


