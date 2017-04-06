function out=gh_even(a)

height=size(a,1);
width=size(a,2);
out = a;

for i=2:height-1,
    for j=2:width-1,
        if a(i,j)==2
            nbhd=a(i-1:i+1,j-1:j+1);
            nbhd(find(nbhd>0))=1;
            b=sum(nbhd(:))-1;
            if eight_comps(nbhd)==1 & b>1,
                out(i,j)=3;
            end;
        end;
    end;
end;

out(find(out==3))=0;