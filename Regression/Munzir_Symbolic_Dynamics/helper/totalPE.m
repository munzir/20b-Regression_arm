function U = totalPE(f)

% Calculate expression for the total potential energy of the system

key = keys(f);
U=sym(0);
for i=1:length(key)
    if(~isequal(key{i}, '0') && f(key{i}).o~=0)
        U = U + PE(f, key{i});
    end
end