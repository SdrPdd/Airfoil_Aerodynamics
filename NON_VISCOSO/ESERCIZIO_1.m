close all
clear all
clc

%% ESERCIZIO 1
%L'aerodinamica -non viscosa e viscosa- di un profilo alare alle 
%basse velocità di volo

%% Disegnazione tecnica del profilo
%dati infittiti (240 pannelli) da XFoil

load GEOM1.txt
x = GEOM1(:,1);
y = GEOM1(:,2);

figure(1)
plot(x,y,'k')
axis equal
axis([-.1 1.1 -.15 .15])
xlabel('Corda');
ylabel('Curva');

%% Zoom bordo d'attacco
figure(2)
plot(x,y,'k')
hold on

grid on 
axis equal
axis([-.02 .04 -.03 .03])

xlabel('x/c','FontSize',15,'FontAngle','italic')
ylabel('z/c','FontSize',15,'FontAngle','italic')

%% Zoom bordo d'uscita
figure(3)
plot(x,y,'k')
hold on

grid on 
axis equal
axis([.98 1.005 -.01 .01])

xlabel('x/c','FontSize',15,'FontAngle','italic')
ylabel('z/c','FontSize',15,'FontAngle','italic')

%% Andamento dell'ascissa curvilinea del profilo

load DATI_S.txt
s = DATI_S(:,4);     %ascissa curvilinea
x_s = DATI_S(:,2);   %ascissa del profilo
y_s = DATI_S(:,3);   %ordinata del profilo

%andamento dell'ascissa del profilo rispetto all'ascissa curvilinea
figure(4)
plot(s,x_s,'k')
hold on 

grid on
axis equal
axis([0 2.032 -.2 1.2])

xlabel('s','FontSize',15,'FontAngle','italic')
ylabel('x/c','FontSize',15,'FontAngle','italic')

%andamento dell'ordinata del profilo rispetto all'ascissa curvilinea
figure(5)
plot(s,y_s,'k')
hold on 

grid on
axis equal
axis([0 2.032 -.2 .2])

xlabel('s','FontSize',15,'FontAngle','italic')
ylabel('z/c','FontSize',15,'FontAngle','italic')

%% Andamento della curvatura rispetto all'ascissa curvilinea s

alpha = DATI_S(:,6);     %curvatura
curv_s=DATI_S(:,4);


exp = 0.6; %fattore esponenziale
for i=1:numel(alpha)
    if (alpha(i)>0)
        alpha(i)=(alpha(i))^exp;
    end
    
    if (alpha(i)<0)
        alpha(i)=-((alpha(i))^exp);
    end
end

figure(7)
plot(curv_s,alpha,'k')
hold on 

grid on
axis([-inf inf -inf inf])
xlabel('s','FontSize',15,'FontAngle','italic')
ylabel('curvature','FontSize',15,'FontAngle','italic')

%zoom
figure(8)
plot(curv_s,alpha,'k')
hold on

grid on 
axis([0 2.032 0 2])

xlabel('s','FontSize',15,'FontAngle','italic')
ylabel('curvature','FontSize',15,'FontAngle','italic')

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

figure (9)
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

figure(10)
plot(x_ventre_ch,semisp,'k','LineWidth',1.01)
grid on
axis equal
xlabel('x/c','FontSize',15,'FontAngle','italic')
ylabel('z/c','FontSize',15,'FontAngle','italic')
axis([0 1 -0.1 0.1])
%% Soluzioni in campo Euleriano incomprimibili
% Risolviamo per diversi valori di Cl

%% CL = 0
DATA_cl_0 = importdata('CL0.txt',' ',2);
 
xx_adim_0 = DATA_cl_0.data(:,1);
xx_dorso_0  = xx_adim_0(1:120);
xx_ventre_0 = xx_adim_0(120:end);
  
cp_0 = 1*DATA_cl_0.data(:,2);
cp_0_dorso  = cp_0(1:120);
cp_0_ventre = cp_0(120:end);

figure(11)
plot(xx_dorso_0,cp_0_dorso,'k')
hold on
grid on
plot(xx_ventre_0,cp_0_ventre,'k','LineStyle','--')
xlabel('x/c','FontSize',15,'FontAngle','italic')
ylabel('Cp (Cl = 0)','FontSize',15,'FontAngle','italic')
legend('dorso','ventre')
axis ij

cp_min_0 = min(cp_0)

 %% CL = 0.5
DATA_cl_05 = importdata('CL05.txt',' ',2);
 
xx_adim_05 = DATA_cl_05.data(:,1);
xx_dorso_05  = xx_adim_05(1:120);
xx_ventre_05 = xx_adim_05(120:end);
  
cp_05 = 1*DATA_cl_05.data(:,2);
cp_05_dorso  = cp_05(1:120);
cp_05_ventre = cp_05(120:end);
 
figure(12)
plot(xx_dorso_05,cp_05_dorso,'k')
hold on
grid on
plot(xx_ventre_05,cp_05_ventre,'k','LineStyle','--')
xlabel('x/c','FontSize',15,'FontAngle','italic')
ylabel('Cp (Cl = 0.5)','FontSize',15,'FontAngle','italic')
legend('dorso','ventre')
axis ij

cp_min_05 = min(cp_05)

%% CL = 1.0
DATA_cl_1 = importdata('CL1.txt',' ',2);
 
xx_adim_1 = DATA_cl_1.data(:,1);
xx_dorso_1  = xx_adim_1(1:120);
xx_ventre_1 = xx_adim_1(120:end);
  
cp_1 = 1*DATA_cl_1.data(:,2);
cp_1_dorso  = cp_1(1:120);
cp_1_ventre = cp_1(120:end);
 
figure(13)
plot(xx_dorso_1,cp_1_dorso,'k')
hold on
grid on
plot(xx_ventre_1,cp_1_ventre,'k','LineStyle','--')
xlabel('x/c','FontSize',15,'FontAngle','italic')
ylabel('Cp (Cl = 1.0)','FontSize',15,'FontAngle','italic')
legend('dorso','ventre')
axis ij

cp_min_1 = min(cp_1)

%% CL = 1.4
DATA_cl_14 = importdata('CL14.txt',' ',2);
 
xx_adim_14 = DATA_cl_14.data(:,1);
xx_dorso_14  = xx_adim_14(1:120);
xx_ventre_14 = xx_adim_14(120:end);
  
cp_14 = 1*DATA_cl_14.data(:,2);
cp_14_dorso  = cp_14(1:120);
cp_14_ventre = cp_14(120:end);
 
figure(14)
plot(xx_dorso_14,cp_14_dorso,'k')
hold on
grid on
plot(xx_ventre_14,cp_14_ventre,'k','LineStyle','--')
xlabel('x/c','FontSize',15,'FontAngle','italic')
ylabel('Cp (Cl = 1.4)','FontSize',15,'FontAngle','italic')
legend('dorso','ventre')
axis ij

cp_min_14 = min(cp_14)

%% CL = - 1.0
DATA_cl_1NEG = importdata('CL1NEG.txt',' ',2);
 
xx_adim_1NEG = DATA_cl_1NEG.data(:,1);
xx_dorso_1NEG  = xx_adim_1NEG(1:120);
xx_ventre_1NEG = xx_adim_1NEG(120:end);
  
cp_1NEG = 1*DATA_cl_1NEG.data(:,2);
cp_1NEG_dorso  = cp_1NEG(1:120);
cp_1NEG_ventre = cp_1NEG(120:end);
 
figure(15)
plot(xx_dorso_1NEG,cp_1NEG_dorso,'k')
hold on
grid on
plot(xx_ventre_1NEG,cp_1NEG_ventre,'k','LineStyle','--')
xlabel('x/c','FontSize',15,'FontAngle','italic')
ylabel('Cp (Cl = - 1.0)','FontSize',15,'FontAngle','italic')
legend('dorso','ventre')
axis ij

cp_min_1NEG = min(cp_1NEG)

%% Andamento Cl - alpha

load pacc_7.txt
alpha = pacc_7(:,1);      %valori di alpha
cl = pacc_7(:,2);   
cm = pacc_7(:,5); 

figure(16)
plot(alpha,cl,'k')
grid on


axis ([-10 6 -1 1])
xlabel('alpha','FontSize',15,'FontAngle','italic')
ylabel('Cl_a','FontSize',15,'FontAngle','italic')


% calcolo approssimato della pendenza della retta di portanza da x-foil
 Cl_a_0 = (cl(end)-cl(1))/(alpha(end)-alpha(1)); 
 Cl_a_0_rad = Cl_a_0 *180/pi ;

%% alpha zero lift

[~,indexCl0] = min(abs(cl));
alpha_zl=alpha(indexCl0)
cm0=cm(indexCl0)

%% Centro aerodinamico

x_acVec = 1/4-((cm-cm0)./cl);
x_ac=mean(x_acVec);
disp(['Il centro aerodinamico si trova all''ascissa x=',num2str(x_ac)])

cm_ac=cm+(cl'.*(x_ac-1/4))';
cm_ac_mean=mean(cm_ac')

figure(17)
hold on
plot(cl,cm,'-k',cl,cm_ac,'--k','LineWidth',1)
hold on
xlabel('C_l')
ylabel('C_m')
grid on
%axis equal
axis([-1 1 -0.5 0.5])

%axis([-1 1.5 -0.09 -0.05])
legend('Cm_{1/4}','Cm_{ac}','autoupdate','off')
plot(xlim,[0,0],'k',[0,0],ylim,'k')

%% Centro di pressione

x_cpress = x_ac-cm./cl;

%figure('Position', [10 10 600 300]); 
figure(18)
hold on
plot(alpha(x_cpress-x_ac>0),x_cpress(x_cpress-x_ac>0),'-k')
plot(alpha(x_cpress-x_ac<0),x_cpress(x_cpress-x_ac<0),'-k') 
plot(xlim,[x_ac,x_ac],'--k',[alpha_zl,alpha_zl],ylim,'--k')
xlabel('\alpha (°)')
ylabel('x_{cdp}/c')
grid on
axis([-35 35 -.35 1])

