%Tek elemanlý 2 düðüm noktalý lineer shape function örneði
% U(x) = a+ b*(x) örneði 2 deðer için de yazýlýp U1 (düðümünde)noktasýnda x deðeri Xa , U2 noktasýnda (düðümünde) x deðeri Xb.

clear all;clc;
syms a b xa xb u1 u2;
syms x he;
[a,b]=solve(a+b*xa==u1,a+b*xb==u2,a,b);


Ux=a+b*x;
Ux=simplify(Ux);
%U2'nin tüm deðerlerine 0 vererek, U1'e de 1 vererek U1'in katsayýsý olan Phi_1 fonksiyonunu elde ettim sadece U1'i elde ettim
Phi_1=subs(Ux,{u1,u2},{1,0}); 
Phi_2=subs(Ux,{u1,u2},{0,1});

%Fonksiyonlarýn en temel hali
disp('Fonksiyonlarýn en temel hali');
disp(Phi_1);
disp(Phi_2);

disp('Xb-Xa yý eleman boyu olan he olarak yazdým');
%Xb-Xa'yý eleman boyu olan he olarak yazdým.
Phi_2=subs(Phi_2,xb-xa,he);
Phi_1=subs(Phi_1,xb-xa,he);
disp(Phi_1);
disp(Phi_2);

%Lokal Koordinata çevirmek için
Phi_2=subs(Phi_2,{xa,xb},{0,he});%Xb he'ye %Xa 0'a eþitlendi
Phi_1=subs(Phi_1,{xa,xb},{0,he});%Xb he'ye %Xa 0'a eþitlendi

Phi_1=expand(Phi_1); %parantezleri daðýtma komutunu kullandým
Phi_2=expand(Phi_2); %parantezleri daðýtma komutunu kullandým

disp("lokal koordinatlar");
disp(Phi_1);
disp(Phi_2);


%Grafikleri çizdirme
deger=0:.1:1; %x deðerinin 0'dan 1'e deðiþimi için deðiþken

Phi1=subs(Phi_1,he,1);
Phi2=subs(Phi_2,he,1);

Phi1Grafik=double(subs(Phi1,x,deger));
Phi2Grafik=double(subs(Phi2,x,deger));
plot(0:.1:1,Phi1Grafik,'g');
hold on;
plot(0:.1:1,Phi2Grafik,'b');
%aþaðýdaki kod x ekseni boyunca çizgi çeker
XL=xlim;
line(XL,[0 0]);
xlabel('Local x');
ylabel('U(x)');
title('2 düðüm noktalý 1 eleman için Shape Function');
legend('Phi_1','Phi_2');