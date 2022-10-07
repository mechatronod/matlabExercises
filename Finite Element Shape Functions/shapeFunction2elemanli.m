%Tek elemanl� 2 d���m noktal� lineer shape function �rne�i
% U(x) = a+ b*(x) �rne�i 2 de�er i�in de yaz�l�p U1 (d���m�nde)noktas�nda x de�eri Xa , U2 noktas�nda (d���m�nde) x de�eri Xb.

clear all;clc;
syms a b xa xb u1 u2;
syms x he;
[a,b]=solve(a+b*xa==u1,a+b*xb==u2,a,b);


Ux=a+b*x;
Ux=simplify(Ux);
%U2'nin t�m de�erlerine 0 vererek, U1'e de 1 vererek U1'in katsay�s� olan Phi_1 fonksiyonunu elde ettim sadece U1'i elde ettim
Phi_1=subs(Ux,{u1,u2},{1,0}); 
Phi_2=subs(Ux,{u1,u2},{0,1});

%Fonksiyonlar�n en temel hali
disp('Fonksiyonlar�n en temel hali');
disp(Phi_1);
disp(Phi_2);

disp('Xb-Xa y� eleman boyu olan he olarak yazd�m');
%Xb-Xa'y� eleman boyu olan he olarak yazd�m.
Phi_2=subs(Phi_2,xb-xa,he);
Phi_1=subs(Phi_1,xb-xa,he);
disp(Phi_1);
disp(Phi_2);

%Lokal Koordinata �evirmek i�in
Phi_2=subs(Phi_2,{xa,xb},{0,he});%Xb he'ye %Xa 0'a e�itlendi
Phi_1=subs(Phi_1,{xa,xb},{0,he});%Xb he'ye %Xa 0'a e�itlendi

Phi_1=expand(Phi_1); %parantezleri da��tma komutunu kulland�m
Phi_2=expand(Phi_2); %parantezleri da��tma komutunu kulland�m

disp("lokal koordinatlar");
disp(Phi_1);
disp(Phi_2);


%Grafikleri �izdirme
deger=0:.1:1; %x de�erinin 0'dan 1'e de�i�imi i�in de�i�ken

Phi1=subs(Phi_1,he,1);
Phi2=subs(Phi_2,he,1);

Phi1Grafik=double(subs(Phi1,x,deger));
Phi2Grafik=double(subs(Phi2,x,deger));
plot(0:.1:1,Phi1Grafik,'g');
hold on;
plot(0:.1:1,Phi2Grafik,'b');
%a�a��daki kod x ekseni boyunca �izgi �eker
XL=xlim;
line(XL,[0 0]);
xlabel('Local x');
ylabel('U(x)');
title('2 d���m noktal� 1 eleman i�in Shape Function');
legend('Phi_1','Phi_2');