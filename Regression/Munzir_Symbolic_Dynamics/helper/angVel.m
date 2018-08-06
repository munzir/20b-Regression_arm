function w = angVel(f, key, varargin)

% Calculate angular velocity of the current frame represented in the same
% frame.
% 'f' is the map container of the information for all the frames
% 'key' identifies the frame whose angular veclocity is demanded
% One more argument can define non-zero angular velocity of the base frame

if(nargin == 2)
    w0 = [0; 0; 0];
else w0 = varargin{1};
end

if(isequal(f(key).a, '0')) % if it's the first link in the chain
    w = Rot(f, f(key).a, key) * w0 + f(key).e*f(key).dq;
else % recursive call if the frame is not the first link in the chain
    w = Rot(f, f(key).a, key) * angVel(f, f(key).a) + f(key).e*f(key).dq;
end