function [ positions ] = subplot_pos(plotwidth,plotheight,leftmargin,rightmargin,bottommargin,topmargin,nbx,nby,spacex,spacey)
 
    subxsize=(plotwidth-leftmargin-rightmargin-spacex*(nbx-1.0))/nbx;
    subysize=(plotheight-topmargin-bottommargin-spacey*(nby-1.0))/nby;
 
    for i=1:nbx
       for j=1:nby
           xfirst=leftmargin+(i-1.0)*(subxsize+spacex);
           yfirst=bottommargin+(j-1.0)*(subysize+spacey); 
             positions{i,nby-j+1}=[xfirst/plotwidth yfirst/plotheight subxsize/plotwidth subysize/plotheight]; 
%            positions{nby-j+1,nbx-i+1}=[xfirst/plotwidth yfirst/plotheight subxsize/plotwidth subysize/plotheight]; 
       end
    end
end