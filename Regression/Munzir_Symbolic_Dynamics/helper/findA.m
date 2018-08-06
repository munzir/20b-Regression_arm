function A = findA(f, E)

% Compute the matrix A from the kinetic energy expression  
% 'f' contains map of the frames
% 'E' contains the symbolic expression for the kinetic energy

% Declaring an empty A matrix
key = keys(f);
A=sym(zeros(length(key)-2, length(key)-2));

dq=dqVec(f);

for i=1:length(dq)
    A(i,i)=2*getcoeff(E, dq(i), 2);
    coeffdq_i = getcoeff(E, dq(i), 1);
    for j=i+1:length(dq)
        A(i,j)=getcoeff(coeffdq_i, dq(j), 1);
        A(j,i)=A(i,j);
    end
end