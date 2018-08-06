function T = Tf(f, key1, key2)

% Find the transform of a frame
% f denotes the map container that contains information of the frames. 
% key1 identifies the frame1 that is being represented
% key2 identifies frame2 in which frame1 is being represented

if(isBefore(f, key2, key1)) % if frame2 is before frame1 in the chain
    T = [f(key1).x f(key1).y f(key1).z f(key1).P; 0 0 0 1];
    key = f(key1).a;
    while(~isequal(key, key2))
        T = [f(key).x f(key).y f(key).z f(key).P; 0 0 0 1] * T;
        key = f(key).a;
    end
elseif(isBefore(f, key1, key2)) % if frame1 is before frame2 in the chain
    T = [f(key2).x' -f(key2).x'*f(key2).P; ...
         f(key2).y' -f(key2).y'*f(key2).P; ...
         f(key2).z' -f(key2).z'*f(key2).P; ...
         0 0 0 1];
     key = f(key2).a;
     while(~isequal(key, key1))
         T = T * [f(key).x' -f(key).x'*f(key).P; ...
              f(key).y' -f(key).y'*f(key).P; ...
              f(key).z' -f(key).z'*f(key).P; ...
              0 0 0 1];
         key = f(key).a;
     end
end        