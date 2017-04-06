function out=eight_comps(a)

out=min(1-a(4),max(a(7),a(8))) + min(1-a(8),max(a(9),a(6))) + min(1-a(6),max(a(3),a(2))) + min(1-a(2),max(a(1),a(4)));
