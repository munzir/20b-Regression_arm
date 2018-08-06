function dq = dqVec(f)

% Generate dq vector in the order defined by memeber 'o' of the frames
% contained in 'f'

key = keys(f);
n = length(key)-2;
dq = sym(zeros(n, 1));
for i=1:length(key)
    if(isequal(key{i}, '0')||f(key{i}).o==0); continue; end
    dq(f(key{i}).o) = f(key{i}).dq;
end