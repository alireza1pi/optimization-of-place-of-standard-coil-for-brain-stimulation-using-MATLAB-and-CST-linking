%%
clc
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
filepath='C:\Users\alire\OneDrive\Desktop\Projects\scattering\Dr Soheyl\head fields cst\coi_head.cst';

invoke(mws, 'OpenFile', filepath)

z=0:5:50;
for i=1:length(z)
    mws.invoke('StoreDoubleParameter','z', z(i));
    
end








