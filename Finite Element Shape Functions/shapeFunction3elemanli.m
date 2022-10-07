%2 elemanl� 3 d���m noktal�  shape function �rne�i


clear all;clc;
syms a b c xa xb xc u1 u2 u3;
syms x he;
[a,b,c]=solve(a+b*xa+c*xa^2==u1,a+b*xb+c*xb^2==u2,a+b*xc+c*xc^2==u3,a,b,c);


Ux=a+b*x+c*x^2;
Ux=simplify(Ux);
Phi_1=subs(Ux,{u1,u2,u3},{1,0,0}); % U2 ve U3'nin t�m de�erlerine 0 vererek ve sadece U1'i 1 yaparak elde ettim
Phi_2=subs(Ux,{u1,u2,u3},{0,1,0}); % U1 ve U3'nin t�m de�erlerine 0 vererek ve sadece U2'i 1 yaparak elde ettim
Phi_3=subs(Ux,{u1,u2,u3},{0,0,1}); % U1 ve U2'nin t�m de�erlerine 0 vererek ve sadece U3'i 1 yaparak elde ettim

%Fonksiyonlar�n en temel hali
disp(Phi_1);
disp(Phi_2);
disp(Phi_3);


%A�a��s� bat�rd� sayfa 98'den itibaren d�zenle

%Xb-Xa'y� eleman boyu olan he olarak yazd�m.
Phi_1=subs(Phi_1,{xc-xa,xb-xa,xc-xb},{he,he/2,he/2});

Phi_2=subs(Phi_2,{xc-xa,xb-xa,xc-xb},{he,he/2,he/2});
Phi_3=subs(Phi_3,{xc-xa,xb-xa,xc-xb},{he,he/2,he/2});

% 
% disp(Phi_1);
% disp(Phi_2);
% disp(Phi_3);

%Lokal Koordinata �evirmek i�in
Phi_1=subs(Phi_1,{xc,xb,xa},{he,he/2,0});%Xb he'ye e�itlendi
Phi_2=subs(Phi_2,{xc,xb,xa},{he,he/2,0});%Xb he'ye e�itlendi
Phi_3=subs(Phi_3,{xc,xb,xa},{he,he/2,0});%Xb he'ye e�itlendi

Phi_1=expand(Phi_1); %parantezleri da��tma komutunu kulland�m
Phi_2=expand(Phi_2); %parantezleri da��tma komutunu kulland�m
Phi_3=expand(Phi_3); %parantezleri da��tma komutunu kulland�m

disp("lokal koordinatlar");
disp(Phi_1);
disp(Phi_2);
disp(Phi_3);

%Grafikleri �izdirme
deger=0:.1:1; %x de�erinin 0'dan 1'e de�i�imi i�in de�i�ken
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
%a�a��daki kod x ekseni boyunca �izgi �eker
XL=xlim;
line(XL,[0 0]);

