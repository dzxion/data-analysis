close all
clear
clc

data = load("./log/radar25/overcurr3_copy.csv");

phif = 0.00469;
Rs = 5.2;
Lq = 2.39e-3;
iq = data(:,4);
Vq_real = data(:,8);
Vd_real = data(:,7);
we = data(:,2)/60*7;
Vq_sim = phif * 2*pi * we + Rs * iq;
Vd_sim = - we.*Lq.*iq * 2 * pi;

figure
plot(Vq_sim)
hold on
plot(Vq_real)
legend('Vq sim','Vq real')

figure
plot(Vd_sim)
hold on
plot(Vd_real)
legend('Vd sim','Vd real')
