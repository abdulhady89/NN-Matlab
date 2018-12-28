clear
clc

%% initialization
nn.k=2;                     % number of hidden node
nn.m=1;                     % number of output node
nn.n=2;                     % number of input node
%nn.w=(2*rand(nn.n+1,nn.k+1))-1;   % weight
nn.w=[ 0    1    -1 ;...
       1    0   2   ;...
      -0.5 -1.5 0];

x=[0 0;0 1;1 0;1 1];        % input
fd=[0;1;1;0];               % output XOR

maxepoch=1000;                 % number of epoch
epoch=1;

lr=0.5;                    % learning rate

%% Learning Process
while epoch <= maxepoch
    for data=1:length(x)    %data loop
        % feedforward
        nn.x=[x(data,:) 1];
        nn=ffNNbp(nn);
        
        % error calculation
        e=fd(data,1)-nn.fo;
        err(1,data)=e;
        
        % backprop and update weight output
        zoex=[nn.zo 1];
        for i=1:nn.k+1
            dwo(i)=1*e*zoex(i);
            nn.w(i,3)=nn.w(i,3)+lr*dwo(i);
        end
        
        % backprop and update weight input
        for i=1:nn.k
            for j=1:nn.n+1
                dwi(i,j)=1*e*nn.w(i,3)*nn.x(i);
                nn.w(i,j)=nn.w(i,j)+lr*dwi(i,j);
            end
        end
        
    fos(data)=nn.fo;
    end
    rmse(epoch)=sqrt(err*err')/4;
    epoch=epoch+1;
end
%% Results
plot(rmse)
nn.w