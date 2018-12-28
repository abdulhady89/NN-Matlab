function y=feedforwardNN(x)
k=2;            % number of hidden node
m=1;            % number of output node
n=2;            % number of input node
% w=rand(n+1,k);  % weight
% b=rand(k+m);    % bias

w=[ 1   1  ;...
    1   1  ;...
    1  -2 ];

b=[-0.5,-1.5,-0.5];
z=zeros(k,1);   % initial z
f=zeros(m);     % initial f

%% calculate Z
for i=1:k
    for j=1:n
        z(i)=z(i)+(x(j)*w(i,j));
        %zo(i)=sigmf((z(i)+b(i)),[0.001 0]);
        zo(i)=hardlim(z(i)+b(i));
    end
end

%% calculate F
for i=1:k
    f=f+zo(i)*w(3,i);
    %fo=sigmf((f+b(3)),[0.001 0]);
    fo=hardlim(f+b(3));
end

%% output function
y=fo;