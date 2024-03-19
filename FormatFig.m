function FormatFig(hFig,Fblack,Fwhite)
figure(hFig)

set(hFig,'Units','inches')


axlist=findobj(gcf,'Type','Axes');
plotlist=findall(gcf,'Type','Line');
scatlist=findall(gcf,'Type','Scatter');
typelist=findall(gcf,'Type','Text');
leglist=findall(gcf,'Type','Legend');

for j=1:length(axlist)
    axlist(j).Box='on';
    axlist(j).XGrid='on';
    axlist(j).YGrid='on';
    axlist(j).ZGrid='on';
    axlist(j).GridAlpha=0.3;
    axlist(j).FontName='Helvetica';
    axlist(j).LineWidth=1;
    axlist(j).LabelFontSizeMultiplier=1.0;
end

    
    for j=1:length(axlist)
        axlist(j).FontSize=14;
        axlist(j).TitleFontSizeMultiplier=1.0;
        %         axlist(j).TitleFontSizeMultiplier=1.2;
    end
    
    
    
    for q=1:length(plotlist)
        plotlist(q).LineWidth=2;
    end
    
    for k=1:length(scatlist)
        scatlist(k).SizeData=80; %Normally 80
    end
    
    
    
    
    for i=1:length(typelist)
        typelist(i).FontSize=14;
        if length(typelist(1).String)>25
            typestring=typelist(1).String;
            cut=strfind(typestring,' ');
            cutnum=cut(cut>24);
            typelist(1).String={typestring(1:cutnum),typestring(cutnum+1:end)};
        end
    end
    
    
    for m=1:length(leglist)
        leglist(m).FontSize=16;
        leglist(m).LineWidth=2;
        leglist(m).Location='Best';
    end
    
    
    
    
    
 %% BLACK BG   
    if Fblack==1
        
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
        
        
        
        
        
        for m=1:length(leglist)
            leglist(m).Color='k';
            leglist(m).TextColor='w';
            leglist(m).EdgeColor='w';
        end
        
        
%         pause(1)
%         
%         set(hFig,'Position',[0 0 6.2 6.2]) %12 12?
%         
%         hFig.PaperPositionMode='auto';
%         hFig.PaperPosition=[0 0 6.2 6.2]; %Was 6 6
        drawnow

    end
 
     %% WHITE BG  
    if Fwhite==1
        
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
        
        
        drawnow
      
        
    end
    
end