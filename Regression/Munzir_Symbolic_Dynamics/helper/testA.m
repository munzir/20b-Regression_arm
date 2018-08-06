function b = testA(f, E, A)

% generate the dq vector
dq = dqVec(f);
EE = expand((dq'*A*dq)/2);
b = isequaln(E,EE);