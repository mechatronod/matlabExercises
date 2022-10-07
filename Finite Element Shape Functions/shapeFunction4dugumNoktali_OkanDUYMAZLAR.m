%Okan DUYMAZLAR
%3 elemanl� 4 d���m noktal�  shape function (interpolasyon) 
% U(x) = a+ b*(x)+c*(x)^2+d*(x)^3  

clear all;clc;
syms a b c d xa xb xc xd u1 u2 u3 u4;
syms x he;
[a,b,c,d]=solve(a+b*xa+c*xa^2+d*xa^3==u1,a+b*xb+c*xb^2+d*xb^3==u2,a+b*xc+c*xc^2+d*xc^3==u3,a+b*xd+c*xd^2+d*xd^3==u4,a,b,c,d);


Ux=a+b*x+c*x^2+d*x^3;   %��z�len a,b,c,d katsay�lar� U(x) fonksiyonunda yerine yaz�l�r
Ux=simplify(Ux);        %U(x) denklemi sadele�tirilir.
Phi_1=subs(Ux,{u1,u2,u3,u4},{1,0,0,0}); % U2 , U3 ve U4'�n t�m de�erlerine 0 vererek ve sadece U1'i 1 yaparak elde edilir
Phi_2=subs(Ux,{u1,u2,u3,u4},{0,1,0,0}); % U1 , U3 ve U4'�n t�m de�erlerine 0 vererek ve sadece U2'i 1 yaparak elde edilir
Phi_3=subs(Ux,{u1,u2,u3,u4},{0,0,1,0}); % U1 , U2 ve U4'�n t�m de�erlerine 0 vererek ve sadece U3'i 1 yaparak elde edilir
Phi_4=subs(Ux,{u1,u2,u3,u4},{0,0,0,1}); % U1 , U2 ve U3'�n t�m de�erlerine 0 vererek ve sadece U4'i 1 yaparak elde edilir

%Fonksiyonlar�n global hali g�sterilir
disp("Global Fonksiyonlar");
disp(Phi_1);
disp(Phi_2);
disp(Phi_3);
disp(Phi_4);

% Phi_1=subs(Phi_1,{xd-xa,xd-xb,xd-xc,},{he,2*he/3,he/3});%e�itilikteki ifadeleri he cinsinden tekrar yazd�m

%Lokal Koordinata �evirmek i�in d���mlerin x eksenindeki lokal de�i�kenleri say�sal ifadelerle %de�i�tirilir.
Phi_1=subs(Phi_1,{xd,xc,xb,xa},{1,2/3,1/3,0});%Xa=0, xb=1/3 , xc=2/3 xd=3/3
Phi_2=subs(Phi_2,{xd,xc,xb,xa},{1,2/3,1/3,0});%Xa=0, xb=1/3 , xc=2/3 xd=3/3
Phi_3=subs(Phi_3,{xd,xc,xb,xa},{1,2/3,1/3,0});%Xa=0, xb=1/3 , xc=2/3 xd=3/3
Phi_4=subs(Phi_4,{xd,xc,xb,xa},{1,2/3,1/3,0});%Xa=0, xb=1/3 , xc=2/3 xd=3/3

Phi_1=expand(Phi_1); %parantezleri da��tma komutunu kulland�m
Phi_2=expand(Phi_2); %parantezleri da��tma komutunu kulland�m
Phi_3=expand(Phi_3); %parantezleri da��tma komutunu kulland�m
Phi_4=expand(Phi_4); %parantezleri da��tma komutunu kulland�m

disp("Lokal Fonksiyonlar"); %Lokal de�erler ile elde edilen fonksiyonlar yazd�r�l�r.
disp(Phi_1);
disp(Phi_2);
disp(Phi_3);
disp(Phi_4);

%Grafikleri �izdirme
deger=0:.02:1; %x de�erinin 0'dan 1'e 0.02 aral�klarla de�i�imi i�in olu�turulan de�i�ken, x de�erleri ile de�i�tirilir
Phi1Grafik=double(subs(Phi_1,x,deger)); 
Phi2Grafik=double(subs(Phi_2,x,deger));
Phi3Grafik=double(subs(Phi_3,x,deger));
Phi4Grafik=double(subs(Phi_4,x,deger));

plot(deger,Phi1Grafik,'g');
hold on; 
plot(deger,Phi2Grafik,'b');
plot(deger,Phi3Grafik,'r');
plot(deger,Phi4Grafik,'m');
%a�a��daki kod x ekseni boyunca �izgi �eker
XL=xlim;
line(XL,[0 0]);
xlabel('Local x');
ylabel('U(x)');
title('4 d���m noktal� 3 eleman i�in Shape Function');
legend('Phi_1','Phi_2','Phi_3','Phi_4');