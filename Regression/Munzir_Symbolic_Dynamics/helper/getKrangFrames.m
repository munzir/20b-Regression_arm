function f = getKrangFrames(nFrames)

% This function generates a map. The keys to the maps are string literals
% in {'1', '2', '3', '4', '5', '6', '7'}
% and the values are structs that have members associated with the 
% respective joints of the robot. 
% 'x', 'y', 'z', 'P' define the unit vectors and position of origin of the 
% frame represented in the antecedent frame
% 'e' is the local angular speed of the frame represented in the same frame
% 'a' contains the key to the antecedent frame
% 'param' contains the inertial parameters of the respective link 
% 'q','dq' and 'ddq' contain associated joint pos, vel and acc variables
% 'o' defines the row of inertia matrix A (in the dynamic equations) that 
% corresponds to the current joint.

syms q_1 q_2 q_3 q_4 q_5 q_6 q_7 real
syms L1 L2 L3 L4 L5 L6 L7 L8 L9 L10 real
syms dq_1 dq_2 dq_3 dq_4 dq_5 dq_6 dq_7 real
syms ddq_1 ddq_2 ddq_3 ddq_4 ddq_5 ddq_6 ddq_7 real
syms m_1 MX_1 MY_1 MZ_1 XX_1 XY_1 XZ_1 YY_1 YZ_1 ZZ_1 real
syms m_2 MX_2 MY_2 MZ_2 XX_2 XY_2 XZ_2 YY_2 YZ_2 ZZ_2 real
syms m_3 MX_3 MY_3 MZ_3 XX_3 XY_3 XZ_3 YY_3 YZ_3 ZZ_3 real
syms m_4 MX_4 MY_4 MZ_4 XX_4 XY_4 XZ_4 YY_4 YZ_4 ZZ_4 real
syms m_5 MX_5 MY_5 MZ_5 XX_5 XY_5 XZ_5 YY_5 YZ_5 ZZ_5 real
syms m_6 MX_6 MY_6 MZ_6 XX_6 XY_6 XZ_6 YY_6 YZ_6 ZZ_6 real
syms m_7 MX_7 MY_7 MZ_7 XX_7 XY_7 XZ_7 YY_7 YZ_7 ZZ_7 real

nullSym = sym([0; 0; 0]); nullSymParam = sym(zeros(10,1));
frame.x = nullSym; frame.y = nullSym; frame.z = nullSym; frame.P = nullSym;
frame.e = nullSym; frame.a = ''; frame.param = nullSymParam;
frame.q = sym(0); frame.dq = sym(0); frame.o = 0;
frame.angVel = sym(0); frame.linVel = sym(0); 
frame.angAcc = sym(0); frame.linAcc = sym(0); 
frame.gotAngVel = false; frame.gotLinVel = false; 
frame.gotAngAcc = false; frame.gotLinAcc = false; 

frame.x = sym([1; 0; 0]); frame.y = sym([0; 1; 0]);
frame.z = sym([0; 0; 1]); frame.P = sym([0; 0; 0]);
frame.e = [0; 0; 0]; frame.a = '0';
frame.q = sym(0); frame.dq = sym(0); frame.o = 0;
frame.param = nullSymParam;
% f('0') = frame;
F{1} = frame;

frame.x = [0; -sin(q_1); cos(q_1)]; frame.y = sym([1; 0; 0]);
frame.z = [0; cos(q_1); sin(q_1)]; frame.P = sym([L6; 0; 0]);
frame.e = [0; -1; 0];  frame.a = '0';
frame.q = q_1; frame.dq = dq_1; frame.ddq = ddq_1; frame.o = 1;
frame.param = [m_1 MX_1 MY_1 MZ_1 XX_1 XY_1 XZ_1 YY_1 YZ_1 ZZ_1];
% f('1') = frame;
F{2} = frame;

frame.x = sym([-1; 0; 0]); frame.y = [0; -cos(q_2); -sin(q_2)];
frame.z = [0; -sin(q_2); cos(q_2)]; frame.P = sym([0; 0; 0]);
frame.e = [-1; 0; 0];  frame.a = '1';
frame.q = q_2; frame.dq = dq_2; frame.ddq = ddq_2; frame.o = 2;
frame.param = [m_2 MX_2 MY_2 MZ_2 XX_2 XY_2 XZ_2 YY_2 YZ_2 ZZ_2];
% f('2') = frame;
F{3} = frame;

frame.x = [-cos(q_3); 0; sin(q_3)]; frame.y = sym([0; -1; 0]);
frame.z = [sin(q_3); 0; cos(q_3)]; frame.P = sym([0; -L7; 0]);
frame.e = [0; -1; 0];  frame.a = '2'; frame.o = 3;
frame.q = q_3; frame.dq = dq_3; frame.ddq = ddq_3;
frame.param = [m_3 MX_3 MY_3 MZ_3 XX_3 XY_3 XZ_3 YY_3 YZ_3 ZZ_3];
% f('3') = frame;
F{4} = frame;

frame.x = sym([-1; 0; 0]); frame.y = [0; -cos(q_4); -sin(q_4)];
frame.z = [0; -sin(q_4); cos(q_4)]; frame.P = sym([0; 0; 0]);
frame.e = [-1; 0; 0];  frame.a = '3'; frame.o = 4;
frame.q = q_4; frame.dq = dq_4; frame.ddq = ddq_4;
frame.param = [m_4 MX_4 MY_4 MZ_4 XX_4 XY_4 XZ_4 YY_4 YZ_4 ZZ_4];
% f('4') = frame;
F{5} = frame;

frame.x = [-cos(q_5); 0; sin(q_5)]; frame.y = sym([0; -1; 0]);
frame.z = [sin(q_5); 0; cos(q_5)]; frame.P = sym([0; -L8; 0]);
frame.e = [0; -1; 0];  frame.a = '4'; frame.o = 5;
frame.q = q_5; frame.dq = dq_5; frame.ddq = ddq_5;
frame.param = [m_5 MX_5 MY_5 MZ_5 XX_5 XY_5 XZ_5 YY_5 YZ_5 ZZ_5];
% f('5') = frame;
F{6} = frame;

frame.x = sym([-1; 0; 0]); frame.y = [0; -cos(q_6); -sin(q_6)];
frame.z = [0; -sin(q_6); cos(q_6)]; frame.P = sym([0; 0; 0]);
frame.e = [-1; 0; 0];  frame.a = '5'; frame.o = 6;
frame.q = q_6; frame.dq = dq_6; frame.ddq = ddq_6;
frame.param = [m_6 MX_6 MY_6 MZ_6 XX_6 XY_6 XZ_6 YY_6 YZ_6 ZZ_6];
% f('6') = frame;
F{7} = frame;

frame.x = [-cos(q_7); 0; sin(q_7)]; frame.y = [-sin(q_7); 0; -cos(q_7)];
frame.z = sym([0; -1; 0]); frame.P = [0; -L9; 0];
frame.e = [0; 0; -1];  frame.a = '6';
frame.q = q_7; frame.dq = dq_7; frame.ddq = ddq_7; frame.o = 7;
frame.param = [m_7 MX_7 MY_7 MZ_7 XX_7 XY_7 XZ_7 YY_7 YZ_7 ZZ_7];
% f('7') = frame;
F{8} = frame;

frame.x = sym([1; 0; 0]); frame.y = sym([0; 1; 0]);
frame.z = sym([0; 0; 1]); frame.P = [0; 0; L10];
frame.e = sym([0; 0; 0]);  frame.a = '7';
frame.q = sym(0); frame.dq = sym(0); frame.ddq = sym(0); frame.o = 0;
frame.param = sym(zeros(1,10));
% f('8') = frame;
F{9} = frame;


keys = {'0', '1', '2', '3', '4', '5', '6', '7', '8'};

for i=1:nFrames+2; keySet{i} = keys{i}; frames{i} = F{i}; end

f = containers.Map( keySet, frames );
