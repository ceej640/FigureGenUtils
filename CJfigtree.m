function CJfigtree(hFig,dirname,savename,saveblack,savewhite,savepng,savefig,saveeps,saveprint,savepaper,saveposter,savescreen,maintainaspect,figwidth,figunits)
figure(hFig)
hFig.InvertHardcopy = 'off';
% hFig.Visible = 'off';
defpos=hFig.Position;
% defpaperpos=hFig.PaperPosition;
set(hFig,'WindowStyle','normal')


hFig.Position=defpos;
set(hFig,'Units',figunits)
drawnow

% curdir=pwd;
cd(dirname)
% mkdir('SavedFigs')
% cd('SavedFigs')

axlist=findobj(gcf,'Type','Axes');
plotlist=findall(gcf,'Type','Line');
scatlist=findall(gcf,'Type','Scatter');
typelist=findall(gcf,'Type','Text');
leglist=findall(gcf,'Type','Legend');
cbarlist=findall(gcf,'Type','Colorbar');

for j=1:length(axlist)
    axlist(j).Box='on';
%     axlist(j).XGrid='on';
%     axlist(j).YGrid='on';
%     axlist(j).ZGrid='on';
    axlist(j).GridAlpha=0.3;
    axlist(j).FontName='Helvetica';
    axlist(j).LineWidth=2;
    axlist(j).LabelFontSizeMultiplier=1.0;
end

%% Screen Figures


if savescreen==1
    
    for j=1:length(axlist)
        axlist(j).FontSize=20;
        axlist(j).TitleFontSizeMultiplier=1.0;
        %         axlist(j).TitleFontSizeMultiplier=1.2;
    end
    
    
    
    for q=1:length(plotlist)
        plotlist(q).LineWidth=2;
    end
    
    for k=1:length(scatlist)
        scatlist(k).SizeData=80; %3; %Normally 80
    end
    
    
    
    
    for i=1:length(typelist)
        typelist(i).FontSize=16;
        if length(typelist(1).String)>30
            typestring=typelist(1).String;
            cut=strfind(typestring,' ');
            cutnum=cut(cut>24);
            typelist(1).String={typestring(1:cutnum),typestring(cutnum+1:end)};
        end
    end
    
    

    
            for n=1:length(cbarlist)
            cbarlist(n).LineWidth=2;
            cbarlist(n).FontSize=16;
        end
    
     pause(1)
        


if maintainaspect
    h2=hFig.Position(4)/hFig.Position(3)*figwidth;
           set(hFig,'Position',[0 0 figwidth h2]) %12 12?
                hFig.PaperPositionMode='auto';
                        hFig.PaperPosition=[0 0 figwidth h2]; %Was 6 6 
else
        set(hFig,'Position',[0 0 figwidth figwidth]) %12 12?
                hFig.PaperPositionMode='auto';
                        hFig.PaperPosition=[0 0 figwidth figwidth]; %Was 6 6
end    
        % % % haxx=hFig.Children
        % % % set(haxx,'Units','inches')
        % % % haxx.OuterPosition(3:4)=hFig.Position(3:4)-0.00;
        % % % haxx.OuterPosition(1:2)=[0 0]% set(haxx,'Position',[0.13 0.1 1.4 1.8])

%         hFig.PaperPosition=[0 0 6.2 6.2]; %Was 6 6
    for m=1:length(leglist)
        leglist(m).FontSize=16;
        leglist(m).LineWidth=2;
        leglist(m).Location='Best';
    end
        drawnow
    
    
    %% BLACK BG
    if saveblack==1
        
        hFig.Color =[0 0 0] ; %'k';
        
        
        for j=1:length(axlist)
            axlist(j).XColor=[1 1 1];
            axlist(j).YColor=[1 1 1];
            axlist(j).ZColor=[1 1 1];
            axlist(j).Color=[0 0 0];
            axlist(j).GridColor=[0.2 0.2 0.2] ;
        end
        
        
        
        for i=1:length(typelist)
            typelist(i).Color='w';
        end
        
        for n=1:length(cbarlist)
                    cbarlist(n).FontSize=16;
                            cbarlist(n).LineWidth=1;
            cbarlist(n).Color='w';
            cbarlist(n).EdgeColor='w';
        end
        
        
        for m=1:length(leglist)
            leglist(m).Color='k';
            leglist(m).TextColor='w';
            leglist(m).EdgeColor='w';
        end
        
        
           
        
        savename_sblk=[savename ' SCREEN BLACK']  ;
        
        if savefig==1
            saveas(hFig,[savename_sblk ' .fig']) %Save .fig
        end
        
        if savepng==1
            print([savename_sblk '.png'],'-dpng', '-r300') %Save .png HQ
        end
        
    end
    
    %% WHITE BG
    if savewhite==1
        
        hFig.Color =[1 1 1] ; %'k';
        
        
        for j=1:length(axlist)
            
            axlist(j).XColor=[0 0 0];
            axlist(j).YColor=[0 0 0];
            axlist(j).ZColor=[0 0 0];
            axlist(j).Color=[1 1 1];
            axlist(j).GridColor=[0.8 0.8 0.8] ;
        end
        
        
        
        for i=1:length(typelist)
            typelist(i).Color='k';
        end
        
        
        
        for m=1:length(leglist)
            leglist(m).Color='w';
            leglist(m).TextColor='k';
            leglist(m).EdgeColor='k';
        end
        
        for n=1:length(cbarlist)
                    cbarlist(n).FontSize=16;
                            cbarlist(n).LineWidth=1;
            cbarlist(n).Color='k';
            cbarlist(n).EdgeColor='k';
            
        end
        
        drawnow
        
        savename_swt=[savename ' SCREEN WHITE']  ;
        if savefig==1
            saveas(hFig,[savename_swt '.fig']) %Save .fig
        end
        
        if savepng==1
            drawnow
            print([savename_swt '.png'],'-dpng', '-r300') %Save .png HQ
        end
        
    end
    
end



%% Print Figures
if saveprint==1
    set(hFig,'PaperPositionMode','auto')

if maintainaspect
    set(hFig,'PaperPositionMode','manual')
    h2=hFig.Position(4)/hFig.Position(3)*figwidth;
           set(hFig,'Position',[0 0 figwidth h2]) %12 12?
                        hFig.PaperPosition=[0 0 figwidth h2]; %Was 6 6 
else
        set(hFig,'Position',[0 0 figwidth figwidth]) %12 12?
                        hFig.PaperPosition=[0 0 figwidth figwidth]; %Was 6 6
end   

    for m=1:length(leglist)
        % leglist(m).FontSize=16;
        % leglist(m).LineWidth=2;
        leglist(m).Location='Best';
    end

    if savewhite==1
        set(hFig,'Color',[1 1 1])
        
        
        for j=1:length(axlist)
            axlist(j).GridColor=[0.2 0.2 0.2] ;
            axlist(j).XColor=[0 0 0];
            axlist(j).YColor=[0 0 0];
            axlist(j).ZColor=[0 0 0];
            axlist(j).Color=[1 1 1];
        end
        
        
        for i=1:length(typelist)
            typelist(i).Color='k';
        end
        
        
        
        for m=1:length(leglist)
            leglist(m).Color='w';
            leglist(m).TextColor='k';
            leglist(m).EdgeColor='k';
            
        end
        
        %% PAPER FIGS
        if savepaper==1
            
            for j=1:length(axlist)
                axlist(j).FontSize=8;
                axlist(j).TitleFontSizeMultiplier=1.2;
            end
            
            for q=1:length(plotlist)
                plotlist(q).LineWidth=1;
            end
            
            for k=1:length(scatlist)
                scatlist(k).SizeData=20; %Normally 80
            end
            
            for m=1:length(leglist)
                leglist(m).FontSize=8;
                leglist(m).LineWidth=1;
            end
            
            
            pause(1)
            
%             set(hFig,'Position',[1 1 3 3]) %12 12?
% % %             haxx=hFig.Children
% % %             set(haxx,'Units','inches')
            % % % haxx.OuterPosition(3:4)=hFig.Position(3:4)-0.00;
            % % % haxx.OuterPosition(1:2)=[0 0]% set(haxx,'Position',[0.13 0.1 1.4 1.8])
            
            
            drawnow
            
            savename_pppr=[savename ' PRINT PAPER'];
            
            if savefig==1
                saveas(hFig,[savename_pppr '.fig']) %Save .fig
            end
            if savepng==1
                drawnow
                export_fig(savename_pppr,'-png','-r300','-transparent')
                % exportgraphics(hFig,[savename_pppr '.png'],'Resolution',300,'BackgroundColor','none')
            end
            
            if saveeps==1
                set(hFig,'Renderer','Painters')
                export_fig(savename_pppr,'-eps','-painters','-transparent','-cmyk')
% exportgraphics(hFig,[savename_pppr '.eps'],'ContentType','vector','BackgroundColor','none','Colorspace','cmyk')
            end
        end
        %% POSTER FIGS
        
        if saveposter==1
            
%             set(hFig,'PaperSize',[5 5]) %Default: 8 8
            
            for j=1:length(axlist)
                axlist(j).FontSize=24;
                axlist(j).LineWidth=3;
                axlist(j).TitleFontSizeMultiplier=1.25;
            end
            
            
            for q=1:length(plotlist)
                plotlist(q).LineWidth=1;
            end
            
            for k=1:length(scatlist)
                scatlist(k).SizeData=20; %Normally 80
            end
            
            
            for m=1:length(leglist)
                leglist(m).FontSize=24;
                leglist(m).LineWidth=3;
                
            end
            
            
            pause(1)
%             
%             set(hFig,'Position',[1 1 5 5]) %12 12?
            % % % haxx=hFig.Children
            % % % set(haxx,'Units','inches')
            % % % haxx.OuterPosition(3:4)=hFig.Position(3:4)-0.00;
            % % % haxx.OuterPosition(1:2)=[0 0]% set(haxx,'Position',[0.13 0.1 1.4 1.8])
            
            
            drawnow
            
            
            savename_ppost=[savename ' PRINT POSTER']  ;
            if savefig==1
                saveas(hFig,[savename_ppost '.fig']) %Save .fig
            end
            
            if savepng==1
                drawnow
                export_fig(savename_ppost,'-png','-r300','-transparent')
            end
            
            if saveeps==1
                set(hFig,'Renderer','Painters')
                export_fig(savename_ppost,'-eps','-painters','-transparent','-cmyk')
            end
            
            set(gcf,'Renderer','OpenGL')
        end
        
    end
    cd(dirname)
    hFig.Visible = 'on';
    set(hFig,'WindowStyle','docked')
end
end