function A = Rot(f, key1, key2)

% Find the rotation transform of a frame
% f denotes the map container that contains information of the frames. 
% key1 identifies the frame1 that is being represented
% key2 identifies frame2 in which frame1 is being represented
% This function assumes frame1 immediately follows frame2 or frame2
% immendiately follows frame1

if(isequal(f(key1).a, key2)) % if frame2 is the antecedent of frame1 
    A = [f(key1).x f(key1).y f(key1).z];
elseif(isequal(f(key2).a, key1)) % if frame1 is the antecedent of frame2
    A = [f(key2).x'; f(key2).y'; f(key2).z'];
end