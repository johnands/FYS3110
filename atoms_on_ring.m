% parameters
g = 1;   % parameter associated with electron jumping
V = 4;   % potential atom 0
N = 32;  % number of atoms

% compute the Hamiltonian
H = zeros(N);
u = zeros(N,1);
v = zeros(N,1);
for i=1:N-1
    u(i) = 1;
    v(i+1) = 1;
    H = H + u*v' + v*u';
    u(i) = 0;
    v(i+1) = 0;
end

% last step (|N> = |0>)
u(N) = 1;
v(1) = 1;
H = H + u*v' + v*u';

% final form
H = -g*H - V*(v*v');

% compute eigenvectors and eigenvalues (energies)
[V,D] = eig(H);
energies = diag(D);

% plot energy-level diagram
levels = 0:N-1;
plot(levels, energies, 'bo')
xlabel('Level number')
ylabel('Energy')
title('Energy-level diagram')

% print lowest energy
lowest_energy = min(energies(1))

% ground state
ground_state = V(:,1);

% probabilites of finding electron on atom 0 and 1
prob0 = abs(ground_state(1))^2
prob1 = abs(ground_state(2))^2

% expectation value of position operator in ground state
X = diag(linspace(0,N-1,N));
exp_value = ground_state'*X*ground_state


    
    
    