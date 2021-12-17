% Basically the problem was we needed to extract some data from some NetCDF 
% file for using in Delft 3D model which neede specific pattern of input 
% data of wind and wave. But the file contained many unnecessary data that
% we did not need. Also, the file contained data of 16 locations. But we
% needed data of just 8 locations.

clc
clear
format short

%NC_File=input('Write file name inside colons including .nc :')  %NC_File='July17.nc'

NC_File='Dec17.nc'  %File name. (We can use input command as well as shown in line 5)

Y= ncread(NC_File,'latitude')
X= ncread(NC_File,'longitude')
time=ncread(NC_File,'time'); %in hours w.r.to 1900-01-01 00 00 00 

TimeStep=length(time)


time=time-time(1);           % so that time starts from 0 hr.
time_in_min=time*60.00;

%% Wave Components:

SWaveH=ncread(NC_File,'swh');
WaveP=ncread(NC_File,'mwp');
WaveDirr=ncread(NC_File,'mwd');
DirSpreading(1:TimeStep,1)=4;

%% Wind Components:

Wind_U10=ncread(NC_File,'u10');
Wind_V10=ncread(NC_File,'v10');

%% All Lat long (locations of required data points)

All_Long=[92.125, 92.125, 92.125, 92.125, 92.25, 92.375, 92.25 , 92.25];
All_Lat=[21.00, 20.875, 20.75, 20.625, 20.625, 20.625, 20.75, 20.875];

%% Loop for all data extraction (Will be saved in excell in specific order for Delft 3D)

for j=1:length(All_Long)

% find Row colm no of Lat long values

ReadX=All_Long(j)    % input('Longitude: ')
ReadY=All_Lat(j)  % input('Latitude: ')


Nx=find(X==ReadX);  %finds the row no
Ny=find(Y==ReadY);  %finds the colm no

  for i=1:TimeStep



   MySWH(i,1)=SWaveH(Nx,Ny,i);
   MyWP(i,1)=WaveP(Nx,Ny,i);
   MyWD(i,1)=WaveDirr(Nx,Ny,i);


   WindU(i,1)=Wind_U10(Nx,Ny,i);
   WindV(i,1)=Wind_V10(Nx,Ny,i);



  end


WaveFile = [NC_File '_Long_' num2str(ReadX) '_Lat_' num2str(ReadY) 'Wave_.xls'];
WindFile = [NC_File '_Long_' num2str(ReadX) '_Lat_' num2str(ReadY) 'Wind_.xls'];


% Wave data write 

xlswrite(WaveFile,time_in_min,  'Sheet1', 'A1')
xlswrite(WaveFile,MySWH, 'Sheet1', 'B1')
xlswrite(WaveFile,MyWP, 'Sheet1', 'C1')
xlswrite(WaveFile,MyWD, 'Sheet1', 'D1')
xlswrite(WaveFile,DirSpreading, 'Sheet1', 'E1')

% Wind Data write

xlswrite(WindFile,time_in_min,  'Sheet1', 'A1')
xlswrite(WindFile,WindU, 'Sheet1', 'B1')
xlswrite(WindFile,WindV, 'Sheet1', 'C1')


end



plot(time,MyWP)  %just to check

%% For naming of the excels 

WaveFile = [NC_File '_Long_' num2str(ReadX) '_Lat_' num2str(ReadY) 'Wave_.xls']
WindFile = [NC_File '_Long_' num2str(ReadX) '_Lat_' num2str(ReadY) 'Wind_.xls']

%% final output excels 

xlswrite(WaveFile,[time MySWH MyWP MySWH])


%% Disclaimer

% I did the work in a hurry and did not debug. So, presence of error is 
% always a posibility
