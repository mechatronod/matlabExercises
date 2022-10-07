%2 elemanlý 3 düðüm noktalý  shape function örneði


clear all;clc;
syms a b c xa xb xc u1 u2 u3;
syms x he;
[a,b,c]=solve(a+b*xa+c*xa^2==u1,a+b*xb+c*xb^2==u2,a+b*xc+c*xc^2==u3,a,b,c);


Ux=a+b*x+c*x^2;
Ux=simplify(Ux);
Phi_1=subs(Ux,{u1,u2,u3},{1,0,0}); % U2 ve U3'nin tüm deðerlerine 0 vererek ve sadece U1'i 1 yaparak elde ettim
Phi_2=subs(Ux,{u1,u2,u3},{0,1,0}); % U1 ve U3'nin tüm deðerlerine 0 vererek ve sadece U2'i 1 yaparak elde ettim
Phi_3=subs(Ux,{u1,u2,u3},{0,0,1}); % U1 ve U2'nin tüm deðerlerine 0 vererek ve sadece U3'i 1 yaparak elde ettim

%Fonksiyonlarýn en temel hali
disp(Phi_1);
disp(Phi_2);
disp(Phi_3);


%Aþaðýsý batýrdý sayfa 98'den itibaren düzenle

%Xb-Xa'yý eleman boyu olan he olarak yazdým.
Phi_1=subs(Phi_1,{xc-xa,xb-xa,xc-xb},{he,he/2,he/2});

Phi_2=subs(Phi_2,{xc-xa,xb-xa,xc-xb},{he,he/2,he/2});
Phi_3=subs(Phi_3,{xc-xa,xb-xa,xc-xb},{he,he/2,he/2});

% 
% disp(Phi_1);
% disp(Phi_2);
% disp(Phi_3);

%Lokal Koordinata çevirmek için
Phi_1=subs(Phi_1,{xc,xb,xa},{he,he/2,0});%Xb he'ye eþitlendi
Phi_2=subs(Phi_2,{xc,xb,xa},{he,he/2,0});%Xb he'ye eþitlendi
Phi_3=subs(Phi_3,{xc,xb,xa},{he,he/2,0});%Xb he'ye eþitlendi

Phi_1=expand(Phi_1); %parantezleri daðýtma komutunu kullandým
Phi_2=expand(Phi_2); %parantezleri daðýtma komutunu kullandým
Phi_3=expand(Phi_3); %parantezleri daðýtma komutunu kullandým

disp("lokal koordinatlar");
disp(Phi_1);
disp(Phi_2);
disp(Phi_3);

%Grafikleri çizdirme
deger=0:.1:1; %x deðerinin 0'dan 1'e deðiþimi için deðiþken
Phi1=subs(Phi_1,he,1);
Phi2=subs(Phi_2,he,1);
Phi3=subs(Phi_3,he,1);

Phi1Grafik=double(subs(Phi1,x,deger));
Phi2Grafik=double(subs(Phi2,x,deger));
Phi3Grafik=double(subs(Phi3,x,deger));

plot(0:.1:1,Phi1Grafik,'g');
hold on;
plot(0:.1:1,Phi2Grafik,'b');
plot(0:.1:1,Phi3Grafik,'r');
%aþaðýdaki kod x ekseni boyunca çizgi çeker
XL=xlim;
line(XL,[0 0]);

