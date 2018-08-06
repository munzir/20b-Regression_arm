function J = inertiaMat(f, key)

param = f(key).param;
J = param([5 6 7; 6 8 9; 7 9 10]);