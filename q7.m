%Nicholas Archon nga425"
%COE 347 Introduction to Com"Putational Fluid Dynamics
%OF3 Q7
clc;clear;close all;

%Format [P-steps-time
data = [64 696 96.15;
32 696 151.69;
16 696 264.56;
8 696 496.96;
4 696 958.88;
2 696 1881.4;
1 696 3765.24];

%% (a)
P = data(:,1);

T_P = data(:,3)./data(:,2); %time per step, for each processor
T1 = T_P(end); %time per step for 1 processor
speedUp = T1./T_P;


txt_PvsSpeedUp = 'P vs Speedup';
figure('Name',txt_PvsSpeedUp);

plot(P,speedUp,'-dr','DisplayName', 'actual (1 M cells)');
xlabel('$P$','Interpreter', 'LaTeX');
ylabel('$\frac{T(1)}{T(P)}$','Interpreter', 'LaTeX');
xlim([0 70]);
ylim([0 70]);
set(gca,'TickLabelInterpreter','latex')
title("\textbf{Number of Processors vs. Speedup}","$P$ vs. $\frac{T(1)}{T(P)}$",'Interpreter', 'LaTeX');
legend('Interpreter','latex','Location','best');
grid on 
hold on 
x = 0:0.1:70; 
y = x; 
plot(x,y,'-k','DisplayName','100\% efficiency');
plot(x,0.8*y,'--k','DisplayName','80\% efficiency');
plot(x,0.6*y,'-.k','DisplayName','60\% efficiency');
obj = gcf;
filename = sprintf('Q7 %03s.jpg', txt_PvsSpeedUp);
file = fullfile('C:\Users\nick4\Desktop\OF3\q7', filename);
plotResolution = 1000;
exportgraphics(obj, file,'Resolution',plotResolution); 
%% (b) 
efficiency = (1./P).*speedUp;
Processors = ["64";"32";"16";"8";"4";"2";"1"];

output = table(Processors,efficiency);
output.Properties.VariableNames = ["Processors","Efficiency"];
tableTitle = '1';
filename = sprintf('a- %03s.xlsb', tableTitle); 
file = fullfile('C:\Users\nick4\Desktop\OF3\q7', filename);
writetable(output,file);