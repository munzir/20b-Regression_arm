function E = totalKE(f, varargin)

% Calculate the expression for the total KE of the robot
% 'f' is the map container containing the frames information of the robot

if(nargin == 1)
    w0 = [0;0;0];
    V0 = [0;0;0];
else
    w0 = varargin{1};
    V0 = varargin{2};
end

key = keys(f);
E = sym(0);
for i=1:length(key)
    if(~isequal(key{i}, '0') && f(key{i}).o~=0)
     E = E + KE(f, key{i}, w0, V0);
    end
end