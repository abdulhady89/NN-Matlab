function nn=ffNNbp(nn)
k=nn.k;            % number of hidden node
m=nn.m;            % number of output node
n=nn.n;            % number of input node
w=nn.w;
x=nn.x;

z=zeros(1,k);   % initial z
f=zeros(1,m);     % initial f

%% calculate Z
for i=1:k
    for j=1:n+1
        z(i)=z(i)+(x(j)*w(j,i));
        zo(i)=hardlim(z(i));
    end
end

%% calculate F
zoe=[zo 1];
for i=1:k+1
    f=f+zoe(i)*w(i,3);
    fo=hardlim(f);
end

%% output function
nn.zo=zo;
nn.fo=fo;
