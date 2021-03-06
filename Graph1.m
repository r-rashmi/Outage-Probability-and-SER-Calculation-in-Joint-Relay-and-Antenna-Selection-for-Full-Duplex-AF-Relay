clc;
clear all;
close all;

x=2;
N=1
n=0.1
lamda=10.^((0:30)./10)

z=((2*sqrt(x^2+x))./lamda)

K=besselk(1,z);

I=(exp((-2./lamda)*x)).*z.*K

pout22=(1-((2./(1+(n*x))).*I)+(1./(1+(2*n*x))).*I.*I).^N

semilogy(10*log10(lamda),pout22,'bo-')

hold on;

% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % 
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % 
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % 

n=0.05
lamda=10.^((0:30)./10)

z=((2*sqrt(x^2+x))./lamda)

K=besselk(1,z);

I=(exp((-2./lamda)*x)).*z.*K

pout22=(1-((2./(1+(n*x))).*I)+(1./(1+(2*n*x))).*I.*I).^N

semilogy(10*log10(lamda),pout22,'m*-')

hold on;
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % 
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % 
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % 

n=0.01
lamda=10.^((0:30)./10)

z=((2*sqrt(x^2+x))./lamda)

K=besselk(1,z);

I=(exp((-2./lamda)*x)).*z.*K

pout=(1-((2./(1+(n*x))).*I)+(1./(1+(2*n*x))).*I.*I).^N

semilogy(10*log10(lamda),pout,'S-g')

hold on;
grid on

% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % 
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % 
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % 

%ORS for M =1

R0=2
T=2^R0-1
x=T;
N=1;
P=10.^((0:5:30)./10)

sigma2_SR=1;
sigma2_RD=1;
sigma2_RR=0.1;

lamdaRD=1./(P.*sigma2_RD)

lamdaSR=1./(P.*sigma2_SR)
 
lamdaRR =1./(P.*sigma2_RR)

syms y

z=(1-(lamdaRD.*exp(-lamdaRD*x)).*(int((exp((-((lamdaSR.*(x+y+1)*x)./y))-(lamdaRD.*y)))./(1+((lamdaSR.*(x+y+1)*x)./(lamdaRR.*y))),y,0,inf))).^N

semilogy(10*log10(P),z,'--bo')
grid on 
hold on

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

R0=2
T=2^R0-1
x=T;
N=1;
P=10.^((0:5:30)./10)

sigma2_SR=1;
sigma2_RD=1;
sigma2_RR=0.05;

lamdaRD=1./(P.*sigma2_RD)

lamdaSR=1./(P.*sigma2_SR)
 
lamdaRR =1./(P.*sigma2_RR)

syms y

z=(1-(lamdaRD.*exp(-lamdaRD*x)).*(int((exp((-((lamdaSR.*(x+y+1)*x)./y))-(lamdaRD.*y)))./(1+((lamdaSR.*(x+y+1)*x)./(lamdaRR.*y))),y,0,inf))).^N

semilogy(10*log10(P),z,'--m*')
grid on 
hold on

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

R0=2
T=2^R0-1
x=T;
N=1;
P=10.^((0:5:30)./10)

sigma2_SR=1;
sigma2_RD=1;
sigma2_RR=0.01;

lamdaRD=1./(P.*sigma2_RD)

lamdaSR=1./(P.*sigma2_SR)
 
lamdaRR =1./(P.*sigma2_RR)

syms y

z=(1-(lamdaRD.*exp(-lamdaRD*x)).*(int((exp((-((lamdaSR.*(x+y+1)*x)./y))-(lamdaRD.*y)))./(1+((lamdaSR.*(x+y+1)*x)./(lamdaRR.*y))),y,0,inf))).^N

semilogy(10*log10(P),z,'--gS')
grid on 
hold on

legend('ARS Simulated \eta = 0.1','ARS Simulated \eta = 0.05 ','ARS Simulated \eta = 0.01','ORS Simulated \eta = 0.1','ORS Simulated \eta = 0.05 ','ORS Simulated \eta = 0.01')
xlabel('Transmit Power [dB]') 
ylabel('Outage Probability')

