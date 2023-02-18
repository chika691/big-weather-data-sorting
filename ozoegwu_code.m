
HDS=[0	0.25	0.5	0.75	1	1.25	1.5	1.75	2	2.25	2.5	2.75	3	3.25	3.5	3.75	4	4.25	4.5	4.75	5	5.25	5.5	5.75	6	6.25	6.5	6.75	7	7.25	7.5	7.75	8	8.25	8.5	8.75	9	9.25	9.5	9.75	10	10.25	10.5	10.75	11	11.25	11.5	11.75	12	12.25	12.5	12.75	13	13.25	13.5	13.75	14	14.25	14.5	14.75	15	15.25	15.5	15.75	16	16.25	16.5	16.75	17	17.25	17.5	17.75	18	18.25	18.5	18.75	19	19.25	19.5	19.75	20	20.25	20.5	20.75	21	21.25	21.5	21.75	22	22.25	22.5	22.75	23	23.25	23.5	23.75];
T_modAvS=[296.463	296.3851	296.3074	296.2328	296.1614	296.0902	296.0188	295.9515	295.8881	295.8249	295.7616	295.7024	295.6473	295.5921	295.5369	295.4854	295.4372	295.3893	295.3412	295.3102	295.2964	295.2826	295.2759	295.5088	295.9993	296.5863	297.2199	298.0384	298.9937	300.0686	301.2	302.4137	303.7002	304.9895	306.3091	307.6043	308.8726	310.0907	311.188	312.1786	313.0654	313.8803	314.6328	315.2486	315.7404	316.1421	316.459	316.6731	316.7675	316.8137	316.7812	316.6393	316.3757	316.0115	315.5631	314.9764	314.2341	313.4258	312.5296	311.583	310.5608	309.4439	308.3024	307.0539	305.7848	304.558	303.3934	302.2818	301.2171	300.3563	299.6676	299.2421	299.028	298.8256	298.6231	298.4632	298.3457	298.2283	298.1109	298.0007	297.8981	297.7954	297.6927	297.5944	297.5008	297.4071	297.3133	297.2223	297.1338	297.0452	296.9568	296.8708	296.7877	296.7045	296.6212	296.5407];


tmin=find(T_modAvS==min(T_modAvS));
tmax=find(T_modAvS==max(T_modAvS));

sr=5; 
DwelltUp=tmax-sr;
DwellTUp=T_modAvS(DwelltUp);
DwelltDn=tmax+sr;
DwellTDn=T_modAvS(DwelltDn); % slanted
DwellTDn=DwellTUp; % horizontal
len=length(T_modAvS);
%%P1=[1 T_modAvS(tmin)]; %not used
P1=[1 T_modAvS(1)];
Pmin=[tmin T_modAvS(tmin)];

P3=[DwelltUp T_modAvS(DwelltUp)];
P2=[tmin T_modAvS(tmin)];
x2=ceil(Pmin(1)+(P3(1)-Pmin(1))*(P1(2)-Pmin(2))/(P3(2)-Pmin(2)));
P2=[x2 P1(2)];% uncomment for algorithm 2 but comment for 1
P4=[DwelltDn DwellTDn];
P5=[len-tmin T_modAvS(len-tmin)];
P6=[len T_modAvS(len)];
x5=ceil(P4(1)+(P5(1)-P4(1))*(P6(2)-P4(2))/(P5(2)-P4(2)));
P5=[x5 P6(2)]; % uncomment for algorithm 2 but comment for 1

x=0.25*[P1(1) P2(1) P3(1) P4(1) P5(1) P6(1)]-0.25*ones(1,6);
y1=[P1(2) P2(2) P3(2) P4(2) P5(2) P6(2)]; %Current TCP
y2 = [233.15 233.15 358.15 358.15 233.15 233.15]; %IEC TCP

%% Temperature cycling profile and overall average plots
%%
figure
plot(HDS,T_modAvS,'.');
xlabel('time (h)')
ylabel('Module temperature (K)')
hold on
plot(x,y1,'-');
legend('Overall average','Current TCP', 'Location', 'Northeast');

%%
figure
plot(HDS,T_modAvS,'.');
xlabel('time (h)')
ylabel('Module temperature (K)')
hold on
plot(x,y2,'-');
legend('Overall average','IEC TCP', 'Location', 'Northeast');
%%
figure
plot(HDS,T_modAvS,'.');
xlabel('time (h)')
ylabel('Module temperature (K)')
hold on
plot(x,y1,'-');
yyaxis right
plot(x,y2,'r-'); ylabel('Module temperature (K)'); set(gca, 'XColor','k', 'YColor','r')
legend('Overall average','Current TCP', 'IEC TCP', 'Location', 'Northeast');

%% Statistical analysis of data
min = [292.098154100000,296.099758400000,296.560390500000,296.957368400000,296.755591400000,296.108888900000,295.489229400000,295.279301100000,295.608592600000,295.797921100000,295.119951900000,292.388136200000];
max = [318.549151400000,319.487810000000,319.889793500000,318.398020700000,317.115883600000,314.823230900000,313.404687200000,312.150538700000,313.006587100000,315.740773900000,319.890588900000,319.236541300000];
mean = [301.634513000000,303.678549200000,304.242401400000,304.053588600000,303.553694200000,302.375148400000,301.303236200000,300.913864000000,301.460712100000,302.440615700000,303.602090300000,302.073816000000];
names = {'Jan'; 'Feb'; 'Mar'; 'Apr'; 'May'; 'Jun'; 'Jul'; 'Aug'; 'Sept'; 'Oct'; 'Nov'; 'Dec'};
figure
plot(min, 'ks-','MarkerFaceColor','k'); xlabel('Month'); ylabel('Minimum temperature (K)')
set(gca,'xtick',[1:12],'xticklabel',names)
legend('Minimum','Location', 'best');
%%
figure
plot(max, 'ks-','MarkerFaceColor','k'); xlabel('Month'); ylabel('Maximum temperature (K)')
set(gca,'xtick',[1:12],'xticklabel',names)
legend('Maximum','Location', 'best');
%%
figure
plot(mean, 'ks-','MarkerFaceColor','k'); xlabel('Month'); ylabel('Mean temperature (K)')
set(gca,'xtick',[1:12],'xticklabel',names)
legend('Mean','Location', 'best');