function U = PE(f, key)

% Calculate the potential energy of the link

syms g real 

% Gravitational acceleration expressed in the base frame
gVec = [sym(0); sym(0); -g];
MS = mCOM(f, key);
m = mass(f, key);
U = -[gVec' sym(0)]*Tf(f, key, '0')*[MS; m];