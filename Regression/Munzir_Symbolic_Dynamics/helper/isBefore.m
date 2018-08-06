function b = isBefore(f, key1, key2)

% Check if frame identified by key1 precedes frame identified by key2 in
% the chain

if(isequal(f(key2).a, key1))
    b = 1;
elseif(isequal(f(key2).a, '0'))
    b = 0;
else
    b = isBefore(f, key1, f(key2).a);
end