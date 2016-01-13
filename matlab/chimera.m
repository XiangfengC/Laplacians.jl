function a = chimera(n, i)
% function a = chimera(n, i)
%
% produce the ith chimera graph on n vertices from Lapsolver.jl,
% using a call to julia

nm = tempname;

cmd = ['julia -e ''using Laplacians; writeIJV("', nm, '",' ...
                    'chimera('];
       
cmd = [cmd, num2str(n), ',', num2str(i), '100,1))'' ']

unix(cmd)

dl = dlmread('graph.txt');
a = sparse(dl(:,1),dl(:,2),dl(:,3));
n = max(size(a))
a(n,n) = 0;
a = a + a';
