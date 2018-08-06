function [A, C, Q] = efficientComputeDynamics(q, dq, ddq)

%% Initial
    %Tools
    zeroMat = zeros(3);
    [xMat, yMat, zMat] = deal(zeros(3));
    xMat(1,1) = 1;
    yMat(2,2) = 1;
    zMat(3,3) = 1;
    
    %Characteristics of the arm
    parameters;
    nDOF = 7;
%     Jacobian = ;
    
    %Inputs
    q_1 = q(1); dq_1 = dq(1); ddq_1 = ddq(1);
    q_2 = q(2); dq_2 = dq(2); ddq_2 = ddq(2);
    q_3 = q(3); dq_3 = dq(3); ddq_3 = ddq(3);
    q_4 = q(4); dq_4 = dq(4); ddq_4 = ddq(4);
    q_5 = q(5); dq_5 = dq(5); ddq_5 = ddq(5);
    q_6 = q(6); dq_6 = dq(6); ddq_6 = ddq(6);
    q_7 = q(7); dq_7 = dq(7); ddq_7 = ddq(7);
    
%% Algorithm 
    
    %Screw Cross Product Operators
    T_1 = [dq_1*eye(3) zeroMat; zeroMat dq_1*eye(3)];
    T_2 = [dq_2*eye(3) zeroMat; zeroMat dq_2*eye(3)];
    T_3 = [dq_3*eye(3) zeroMat; zeroMat dq_3*eye(3)];
    T_4 = [dq_4*eye(3) zeroMat; zeroMat dq_4*eye(3)];
    T_5 = [dq_5*eye(3) zeroMat; zeroMat dq_5*eye(3)];
    T_6 = [dq_6*eye(3) zeroMat; zeroMat dq_6*eye(3)];
    T_7 = [dq_7*eye(3) zeroMat; zeroMat dq_7*eye(3)];
    
    %Mass Matrices
    M_1 = [m_1*eye(3) zeroMat; zeroMat J_m1*yMat];
    M_2 = [m_2*eye(3) zeroMat; zeroMat J_m2*xMat];
    M_3 = [m_3*eye(3) zeroMat; zeroMat J_m3*yMat];
    M_4 = [m_4*eye(3) zeroMat; zeroMat J_m4*xMat];
    M_5 = [m_5*eye(3) zeroMat; zeroMat J_m5*yMat];
    M_6 = [m_6*eye(3) zeroMat; zeroMat J_m6*xMat];
    M_7 = [m_7*eye(3) zeroMat; zeroMat J_m7*zMat];
    
    
    
    E_1 = [0 0 0 0 1 0]';
    A_1 = [0 0 0 ddq_1 0 0]';
    W_1 = M_1*A_1 + cross(T_1,M_1*T_1);
    Q_1 = E_1*W_1;
    

    %Dummy Returns
    A = eye(7);
    C = eye(7);
    Q = zeros(7,1);
    Q(1) = Q_1;
end