 sbr=100;
 clear layermax
 for i = 1:size(bl,2)   % i = wt percent
     for j = 1:size(bl(i).maxbleaching,1) % j*100 = laser power
         layermax(i,j)=0;
         for k = 1:size(bl(i).maxbleaching,2)
             if bl(i).maxbleaching(j,k)>=sbr
                layermax(i,j)=k;
             end
         end
     end
 end



