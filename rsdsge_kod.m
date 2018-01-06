clear classes
clc
close all

m=rise('rsdsge.rs');
m=solve(m,'steady_state_unique',false,'steady_state_imposed',true,'solver','mfi','solve_derivatives_type','automatic','solve_order',1);
m.print_solution()
myirfs=irf(m,'irf_periods',32);

close all
var_list=m.endogenous.name;
fig1 = figure('name','Impulse responses to a output shock');
for ii=1:numel(var_list)
    subplot(3,1,ii)
    EPS_Y=myirfs.EPS_Y.(var_list{ii});
    EPS_PAI=myirfs.EPS_PAI.(var_list{ii});
    EPS_R=myirfs.EPS_R.(var_list{ii});
    plot([EPS_Y]);
    title(var_list{ii})
	     if ii==1
         legend({'reg1-m1','reg1-m2',})
		 end
    axis tight
end

fig2 = figure('name','Impulse responses to a inflation shock');
for ii=1:numel(var_list)
    subplot(3,1,ii)
    EPS_Y=myirfs.EPS_Y.(var_list{ii});
    EPS_PAI=myirfs.EPS_PAI.(var_list{ii});
    EPS_R=myirfs.EPS_R.(var_list{ii});
    plot([EPS_PAI]);
    title(var_list{ii})
	     if ii==1
         legend({'reg1-m1','reg1-m2',})
		 end
    axis tight
end

fig3 = figure('name','Impulse responses to a monetary shock');
for ii=1:numel(var_list)
    subplot(3,1,ii)
    EPS_Y=myirfs.EPS_Y.(var_list{ii});
    EPS_PAI=myirfs.EPS_PAI.(var_list{ii});
    EPS_R=myirfs.EPS_R.(var_list{ii});
    plot([EPS_R]);
    title(var_list{ii})
	     if ii==1
         legend({'reg1-m1','reg1-m2',})
		 end
    axis tight
end

