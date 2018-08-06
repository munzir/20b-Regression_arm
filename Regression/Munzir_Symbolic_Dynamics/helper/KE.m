function E = KE(f, key, w0, V0)

% Calculate expression for kinetic energy of a link

m = mass(f, key);
J = inertiaMat(f, key);
MS = mCOM(f, key);
w = angVel(f, key,w0);
V = linVel(f, key,w0,V0);

E = 0.5*(w'*J*w + m*V'*V + 2*MS'*(cross(V, w)));
