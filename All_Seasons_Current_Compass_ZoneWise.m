%% Task

% The task was, it was necessary to plot multiple velocity compass
% (direction of current) of the results obtained from Delft 3D simulation
% in excel format. The work was done for 3 zones. All the plots were drawn
% from the excel using this code.

clc 
clear

%% plot for Zone-1

% Pick data from excel (Sheet-1)

Sheet='Zone-1'
Title_Name=['All seasons' ' (' Sheet ')']  %provide title
Figure_Name=['All seasons' Sheet '.jpg']   % Assign figure (JPG)

%Pic data from sheet-1 (Colm 1 and 2)

Vel_X=xlsread('Zonewise_All_Season_All_Current_Vector_Data.xlsx',Sheet,'A2:A248')
Vel_Y=xlsread('Zonewise_All_Season_All_Current_Vector_Data.xlsx',Sheet,'B2:B248')

figure1=figure; % Not entirely necessary 
compass(Vel_X,Vel_Y)
title(Title_Name)
saveas(figure1,Figure_Name)

%% plot for Zone-2 (Repeat of the same process)

% could have used loops , but in this particular situation it was more 
% efficient to just copy paste and edit. 

Sheet='Zone-2'
Title_Name=['All seasons' ' (' Sheet ')'] 
Figure_Name=['All seasons' Sheet '.jpg']


Vel_X=xlsread('Zonewise_All_Season_All_Current_Vector_Data.xlsx',Sheet,'A2:A329')
Vel_Y=xlsread('Zonewise_All_Season_All_Current_Vector_Data.xlsx',Sheet,'B2:B329')

figure1=figure;
compass(Vel_X,Vel_Y)
title(Title_Name)
saveas(figure1,Figure_Name)

%% plot for Zone-3

Sheet='Zone-3'
Title_Name=['All seasons' ' (' Sheet ')'] 
Figure_Name=['All seasons' Sheet '.jpg']


Vel_X=xlsread('Zonewise_All_Season_All_Current_Vector_Data.xlsx',Sheet,'A2:A329')
Vel_Y=xlsread('Zonewise_All_Season_All_Current_Vector_Data.xlsx',Sheet,'B2:B329')

figure1=figure;
compass(Vel_X,Vel_Y)
title(Title_Name)
saveas(figure1,Figure_Name)

%% Disclaimer: 
% The work was done in short time without any debugging. So, use the code 
% carefully.

