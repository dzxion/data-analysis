close all
clear
clc

% s = tf('s');

%% m200云台
% % fn2 = 27.027;
% % fn1 = 23.25;
% % fn = 24.429;
% % xip = (fn2 - fn1)/(2*fn)
% 
% % An = 1.6235;
% % An1 = 1.3186;
% % An = An-1;
% % An1 = An1-1;
% % m = 1;
% % xia = 1/(2*pi*m)*log(An/An1)
% 
% % model calulation
% f = 30;
% ksi = 0.0788;
% wd = 2*pi*f;
% wn = wd/((1-ksi^2)^0.5);
% G4020 = wn^2/(s^2+2*ksi*wn*s+wn^2);
% 
% eta = @(lamda) ((1+(2*ksi*lamda).^2)./((1-lamda.^2).^2+(2*ksi*lamda).^2)).^0.5;
% fplot(eta,[0,50]*2*pi/wn,'Linewidth',1);
% hold on
% 
% % f = 19.23;
% % ksi = 0.1069;
% % wd = 2*pi*f;
% % wn = wd/((1-ksi^2)^0.5);
% % G2040 = wn^2/(s^2+2*ksi*wn*s+wn^2);
% % 
% % eta = @(lamda) ((1+(2*ksi*lamda).^2)./((1-lamda.^2).^2+(2*ksi*lamda).^2)).^0.5;
% % fplot(eta,[0,50]*2*pi/wn,'Linewidth',1);
% % hold on
% 
% f = 19;
% ksi = 0.0611;
% wd = 2*pi*f;
% wn = wd/((1-ksi^2)^0.5);
% G2020 = wn^2/(s^2+2*ksi*wn*s+wn^2);
% 
% eta = @(lamda) ((1+(2*ksi*lamda).^2)./((1-lamda.^2).^2+(2*ksi*lamda).^2)).^0.5;
% fplot(eta,[0,50]*2*pi/wn,'Linewidth',1);
% hold on
% 
% f = 23.5;
% ksi = 0.0626;
% wd = 2*pi*f;
% wn = wd/((1-ksi^2)^0.5);
% G3030 = wn^2/(s^2+2*ksi*wn*s+wn^2);
% 
% eta = @(lamda) ((1+(2*ksi*lamda).^2)./((1-lamda.^2).^2+(2*ksi*lamda).^2)).^0.5;
% fplot(eta,[0,50]*2*pi/wn,'Linewidth',1);
% hold on
% 
% f = 26.69;
% ksi = 0.0549;
% wd = 2*pi*f;
% wn = wd/((1-ksi^2)^0.5);
% G4040 = wn^2/(s^2+2*ksi*wn*s+wn^2);
% 
% eta = @(lamda) ((1+(2*ksi*lamda).^2)./((1-lamda.^2).^2+(2*ksi*lamda).^2)).^0.5;
% fplot(eta,[0,50]*2*pi/wn,'Linewidth',1);
% hold on
% 
% f = 27.16;
% ksi = 0.0416;
% wd = 2*pi*f;
% wn = wd/((1-ksi^2)^0.5);
% G5050 = wn^2/(s^2+2*ksi*wn*s+wn^2);
% 
% eta = @(lamda) ((1+(2*ksi*lamda).^2)./((1-lamda.^2).^2+(2*ksi*lamda).^2)).^0.5;
% fplot(eta,[0,50]*2*pi/wn,'Linewidth',1);
% hold on
% 
% f = 24.429;
% ksi = 0.0773;
% wd = 2*pi*f;
% wn = wd/((1-ksi^2)^0.5);
% G2020solid = wn^2/(s^2+2*ksi*wn*s+wn^2);
% 
% eta = @(lamda) ((1+(2*ksi*lamda).^2)./((1-lamda.^2).^2+(2*ksi*lamda).^2)).^0.5;
% fplot(eta,[0,50]*2*pi/wn,'Linewidth',1);
% hold on
% 
% legend('G4020','G2020','G3030','G4040','G5050','G2020solid');
% title('力传递比')
% % legend('G4020','G2040');
% 
% % figure
% % step(G4020,G2040)
% % legend('G4020','G2040');
% % 
% % figure
% % bode(G4020,G2040)
% % legend('G4020','G2040');

%% radar25
% offest = 2.85;
% load('log/radar25/unforce_copy.csv');
% va = unforce_copy(:,3)-offest;
% vb = unforce_copy(:,4)-offest;
% vc = unforce_copy(:,5)-offest;
% t = [0:0.01:9.12];
% plot(t,va)
% hold on
% plot(t,vb)
% hold on
% plot(t,vc)
% hold on
% k = -0.5;
% x_init = 10;
% fplot(@(x) x_init*exp(k*x),[0 10],'-*','LineWidth',1)

% load('log/radar25/voltage_openloop_copy.csv');
% speed_mean = mean(voltage_openloop_copy(:,1));
% id_mean = mean(voltage_openloop_copy(:,2));
% iq_mean = mean(voltage_openloop_copy(:,4));
% len = length(voltage_openloop_copy);

% figure
% plot(voltage_openloop_copy(:,1));
% hold on
% plot(speed_mean*ones(len,1),'LineWidth',1);
% 
% figure
% plot(voltage_openloop_copy(:,2));
% hold on
% plot(id_mean*ones(len,1),'LineWidth',1);
% 
% figure
% plot(voltage_openloop_copy(:,4));
% hold on
% plot(iq_mean*ones(len,1),'LineWidth',1);

% P = 14;
% phi_m = 0.00469;
% iq = iq_mean;
% id = id_mean;
% Lq = 2.39e-3;
% Ld = 2.10e-3;
% Te = 3*P/4 *(phi_m*iq - (Lq-Ld)*id*iq);
% 
% w = speed_mean/(P/2)*2*pi;
% B = Te/w;
% J = B*2;

%%%补id计算%%%
% gain = 1.0;
% maxspeed = 35;
% actspeed = 0:0.01:maxspeed;
% actid = (actspeed - maxspeed).^2 / maxspeed^2 * gain;
% % act3_3 = (33.33 - maxspeed).^2 / maxspeed^2 * gain;
% plot(actspeed,actid)

%%%%%%%方差/噪声功率计算%%%%%%
% data = load('log/radar25/current_data.csv');
% current_A = data(:,1);
% current_B = data(:,2);
% current_C = data(:,3);
% var_A = var(current_A)
% var_B = var(current_B)
% var_C = var(current_C)
% sampletime = 0.001;
% Noisepower_A = var_A*sampletime
% Noisepower_B = var_B*sampletime
% Noisepower_C = var_C*sampletime

% data = load('log/radar25/speed_data.csv');
% speed = data(:,2)/7.0*2*pi;
% var_speed = var(speed)
% sampletime = 0.001;
% Noisepower_speed = var_speed*sampletime

%% m100
data = load("log/m100/osc00001_copy.txt");

%% 第一次剔除
% 设置阈值
threshold = 10^6;

% 找到异常值的位置（行和列索引）
[outlier_rows, outlier_cols] = find(abs(data) > threshold);

% 替换异常值为上一行的数据
% 注意：第一行的异常值无法用上一行的数据替换，因此跳过第一行
for i = 1:length(outlier_rows)
    row = outlier_rows(i);
    col = outlier_cols(i);
    if row > 1 % 确保不是第一行
        data(row, col) = data(row - 1, col); % 用上一行的数据替换异常值
    end
end

%% 第二次剔除
% 设置阈值
threshold = 100;

% 找到异常值的位置（行和列索引）
[outlier_rows, outlier_cols] = find(abs(data(:,2)) > threshold);

% 替换异常值为上一行的数据
% 注意：第一行的异常值无法用上一行的数据替换，因此跳过第一行
for i = 1:length(outlier_rows)
    row = outlier_rows(i);
    col = outlier_cols(i);
    if row > 1 % 确保不是第一行
        data(row, 2) = data(row - 1, 2); % 用上一行的数据替换异常值
    end
end

uq = data(:,4);
vq_int = data(:,5);
rs = 0.12;
iq = data(:,3);
P = 14;
we = data(:,6)*2*pi;
w = we/P*2;
phi = 0.000487;
Kt = 3/4*P*phi;
uq_cal = rs*iq+we*phi;
% plot(uq);
% hold on
% plot(uq_cal);
% legend

c = Kt*iq(1000:2000,1)./(w(1000:2000,1).^2);
