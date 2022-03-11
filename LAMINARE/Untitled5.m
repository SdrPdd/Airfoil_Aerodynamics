clear all
close all
clc

DATA_cl_1 = importdata('laminare_cl.txt',' ',2);
 
xx_adim_1 = DATA_cl_1.data(:,1);
xx_dorso_1  = xx_adim_1(1:120);
xx_ventre_1 = xx_adim_1(120:end);
  
cp_1 = 1*DATA_cl_1.data(:,2);
cp_1_dorso  = cp_1(1:120);
cp_1_ventre = cp_1(120:end);


cp_min_1 = min(cp_1)
