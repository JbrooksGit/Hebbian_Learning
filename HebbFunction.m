function [m,w] = HebbFunction(output, varargin) 
FI = ones(1,length(output)); % array of ones 
w = zeros;
m = zeros;
temp = zeros;
 
w(1) = 1/length(output) * dot(FI,output);  % Initial Weight
 
for i = 2:nargin
 
w(i) = 1/length(output) * dot(varargin{i - 1},output); %Vector of weights
 
end
 
  %This will be the vector of weights 
for j = 1:length(output)
     m(j) = w(1);
    for k = 2:nargin
        temp(j) = w(k)*varargin{k-1}(j); %this is dot product of weights and input
        m(j) = m(j) + temp(j);
        if(nargin == k)
        m(j) = sgn(m(j));
        end
    end
    
end
 m = m';



 