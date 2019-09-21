% plots are done in this file

%% Motor angle plot
figure
hold on
for i=1:18
    plot(time,pos_sim);
end
title('Joint positions');
xlabel('Time [s]');
ylabel('Angle [rad]');
legend_entry=cell(1,18);
for i=1:18
    legend_entry{i}=strcat(['R joint ',num2str(i)]);
end
legend(legend_entry)
hold off