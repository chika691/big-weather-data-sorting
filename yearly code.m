%% Code to extract 24h monthly average for 19 years (February 2004 - April 2004)
filename = '24h_data_final.xlsx';
sheet = 1;
J = xlsread(filename,sheet);
T = J(:,1); Tmod1 = J(:,2); Tmod2 = J(:,3); Tmod3 = J(:,4); Tmod4 = J(:,5); Tmod5 = J(:,6); Tmod6 = J(:,7); Tmod7 = J(:,8);
Tmod8 = J(:,9); Tmod9 = J(:,10); Tmod10 = J(:,11); Tmod11 = J(:,12); Tmod12 = J(:,13);
% Overall average module temperature
Tmod13=[296.463	296.3851	296.3074	296.2328	296.1614	296.0902	296.0188	295.9515	295.8881	295.8249	295.7616	295.7024	295.6473	295.5921	295.5369	295.4854	295.4372	295.3893	295.3412	295.3102	295.2964	295.2826	295.2759	295.5088	295.9993	296.5863	297.2199	298.0384	298.9937	300.0686	301.2	302.4137	303.7002	304.9895	306.3091	307.6043	308.8726	310.0907	311.188	312.1786	313.0654	313.8803	314.6328	315.2486	315.7404	316.1421	316.459	316.6731	316.7675	316.8137	316.7812	316.6393	316.3757	316.0115	315.5631	314.9764	314.2341	313.4258	312.5296	311.583	310.5608	309.4439	308.3024	307.0539	305.7848	304.558	303.3934	302.2818	301.2171	300.3563	299.6676	299.2421	299.028	298.8256	298.6231	298.4632	298.3457	298.2283	298.1109	298.0007	297.8981	297.7954	297.6927	297.5944	297.5008	297.4071	297.3133	297.2223	297.1338	297.0452	296.9568	296.8708	296.7877	296.7045	296.6212	296.5407];

%%
figure
plot(T, Tmod1); xlabel('time (h)'); ylabel('Module temperature (K)'); 
hold on
plot(T, Tmod13,'.'); legend ('January','Overall average');
%%
figure
plot(T, Tmod2); xlabel('time (h)'); ylabel('Module temperature (K)'); 
hold on
plot(T, Tmod13,'.'); legend ('February','Overall average');
%%
figure
plot(T, Tmod3); xlabel('time (h)'); ylabel('Module temperature (K)');
hold on
plot(T, Tmod13,'.'); legend ('March','Overall average');
%%
figure
plot(T, Tmod4); xlabel('time (h)'); ylabel('Module temperature (K)');
hold on
plot(T, Tmod13,'.'); legend ('April','Overall average');
%%
figure
plot(T, Tmod5); xlabel('time (h)'); ylabel('Module temperature (K)');
hold on
plot(T, Tmod13,'.'); legend ('May','Overall average');
%%
figure
plot(T, Tmod6); xlabel('time (h)'); ylabel('Module temperature (K)');
hold on
plot(T, Tmod13,'.'); legend ('June','Overall average');
%%
figure
plot(T, Tmod7); xlabel('time (h)'); ylabel('Module temperature (K)');
hold on
plot(T, Tmod13,'.'); legend ('July','Overall average');
%%
figure
plot(T, Tmod8); xlabel('time (h)'); ylabel('Module temperature (K)');
hold on
plot(T, Tmod13,'.'); legend ('August','Overall average');
%%
figure
plot(T, Tmod9); xlabel('time (h)'); ylabel('Module temperature (K)');
hold on
plot(T, Tmod13,'.'); legend ('September','Overall average');
%%
figure
plot(T, Tmod10); xlabel('time (h)'); ylabel('Module temperature (K)');
hold on
plot(T, Tmod13,'.'); legend ('October','Overall average');
%%
figure
plot(T, Tmod11); xlabel('time (h)'); ylabel('Module temperature (K)');
hold on
plot(T, Tmod13,'.'); legend ('November','Overall average');
%%
figure
plot(T, Tmod12); xlabel('time (h)'); ylabel('Module temperature (K)');
hold on
plot(T, Tmod13,'.'); legend ('December','Overall average');
%%
hold on
plot(T, Tmod2); plot(T, Tmod3); plot(T, Tmod4); plot(T, Tmod5); plot(T, Tmod6); plot(T, Tmod7); plot(T, Tmod8,'b'); plot(T, Tmod9,'g'); 
plot(T, Tmod10,'m'); plot(T, Tmod11,'k'); plot(T, Tmod12,'r');
legend('January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December')
ylabel('Module temperature (K)'); xlabel ('time (h)');
