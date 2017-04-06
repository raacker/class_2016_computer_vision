function out=gh(a)

a1=ceil(size(a,1)/2);
a2=ceil(size(a,2)/2);
aa=repmat([1 2;2 1], a1, a2);
aa=aa(1:size(a,1),1:size(a,2)).*a;

done=0;
N=2;
last=aa;
previous=gh_odd(last);
current=gh_even(previous);
while done==0,
    if all(current(:)==last(:)),
        done=1;
    end;
    N=N+1;
    last=previous;
    previous=current;
    
    if mod(N,2)==0,
        current=gh_even(current);
    else
        current=gh_odd(current);
    end;
end;

current(find(current>0))=1;
out=current;