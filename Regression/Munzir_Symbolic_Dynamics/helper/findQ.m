function Q = findQ(f, U)

% Compute the symbolic expression for Q

q = qVec(f);
Q = sym(zeros(length(q), 1));
for i=1:length(q)
    Q(i) = diff(U, q(i));
end