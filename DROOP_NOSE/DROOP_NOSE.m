clear all
close all
clc
%% DEFLESSIONE DROOP NOSE
% Configurazione per deflessione Di 25°

load GEOM1.txt
x = GEOM1(:,1);
y = GEOM1(:,2);

% Configurazione 25°
load droop_good.txt
x_profilo_10 = droop_good(:,1);
y_profilo_10 = droop_good(:,2);

figure(1)

plot(x,y,'--k')
hold on
plot(x_profilo_10,y_profilo_10,'g')
hold on
axis equal
axis([0 1.04 -0.2 0.2])
grid on 
xlabel('x/c');
ylabel('z/c');
legend('\delta_a = 0°','\delta_a = 25°') ;


% Andamento della curvatura rispetto all'ascissa curvilinea s flap=20°
% valutiamo l'andamento della curva nel caso di flap flesso di 20°
load curvatura_droopnose.txt
s_20 = curvatura_droopnose(:,4);     %ascissa curvilinea
x_s_20 = curvatura_droopnose(:,2);   %ascissa del profilo
y_s_20 = curvatura_droopnose(:,3);   %ordinata del profilo

alpha_20 = curvatura_droopnose(:,6);     %curvatura
curv_s_20=curvatura_droopnose(:,4);


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


% CP (alfa = 2°) - x/c - 0°
DATA_no = importdata('attac_0.txt',' ',2);
 
xx_adim_no = DATA_no.data(:,1);
xx_dorso_no  = xx_adim_no(1:120);
xx_ventre_no = xx_adim_no(120:end);
  
cp_no = 1*DATA_no.data(:,2);
cp_no_dorso  = cp_no(1:120);
cp_no_ventre = cp_no(120:end);

cp_min_no = min(cp_no)

% CP (alfa = 2°) - x/c - 25°
DATA_10 = importdata('cp_droopnose.txt',' ',2);
 
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
legend('\delta_a = 0°','','\delta_a = 25°')
axis([0 1 -2.5 1])
axis ij

cp_min_10 = min(cp_10)

 
% Andamento Cl - alpha 

%DELTA 0°
%Nel caso viscoso con Re = 1*10^7
%Ottenuta in ITER = 500, Re = 1*10^7, alpha da -22 a 24
load POLARE_107.txt
alpha_107 = POLARE_107(:,1);      %valori di alpha
cl_107 = POLARE_107(:,2);   
cm_107 = POLARE_107(:,5);
cd_107 = POLARE_107(:,3)*10^4;

% DELTA 25°
load PORTANZA_DROOPNOSE.txt
alpha_10 = PORTANZA_DROOPNOSE(:,1);      %valori di alpha
cl_10 = PORTANZA_DROOPNOSE(:,2);   


% calcolo approssimato della pendenza della retta di portanza da x-foil
 Cl_a_10 = (cl_10(end)-cl_10(1))/(alpha_10(end)-alpha_10(1)); 
 Cl_a_10_rad = Cl_a_10 *180/pi ;

% [~,indexCl_10] = min(abs(cl_10));
% alpha_zl_10=alpha(indexCl_10)


% PLOT SOVRAPPOSTI
figure (4)
plot(alpha_107,cl_107,'k')
hold on
plot(alpha_10,cl_10,'--k')
hold on
plot(21,2.121,'*')
hold on
plot(20,1.928,'*')
grid on
xlabel('alpha','FontSize',15,'FontAngle','italic')
ylabel('Cl_a','FontSize',15,'FontAngle','italic')
axis([-5 24 0 2.5])
legend('\delta_a = 0°','\delta_a = 25°')


