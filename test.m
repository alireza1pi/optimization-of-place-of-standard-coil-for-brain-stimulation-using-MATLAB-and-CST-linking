%%
clear 
close all

%%

f = 2e3;

d_in=27e-3;
d_out=97e-3;
N=10;
h=6e-3;

%%

cst = actxserver('CSTStudio.Application');
mws = invoke(cst , 'NewMWS');
filepath='C:\Users\alire\OneDrive\Desktop\Projects\scattering\Dr Soheyl\head fields cst\coil_head.cst';
CST = CST_MicrowaveStudio;
invoke(mws, 'OpenFile', filepath)

CST.addFieldMonitor('EField',f);
CST.addFieldMonitor('HField',f);
CST.addFieldMonitor('Surfacecurrent',f);
CST.addFieldMonitor('Powerflow',f);
CST.addFieldMonitor('Current',f);
CST.addFieldMonitor('Lossdens',f);
CST.addFieldMonitor('ParticleCurrentDensity',f);

z=0:2:20;

output_folder='C:\Users\alire\OneDrive\Desktop\result';
CST.parameterUpdate;
for i=1:length(z)
    
    mws.invoke('StoreDoubleParameter','z', z(i));
    CST.translateVoxel('Emma',0,0,3,0);
    CST.mesh1;
    CST.runSimulation;
    name=sprintf('%s%d','result',z);
    %CST.saveas(output_folder,name)
end








