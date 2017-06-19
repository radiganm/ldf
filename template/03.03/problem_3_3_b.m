#!/usr/bin/env octave
## problem_3_3_b.m
## Mac Radigan

  FORCES__SCRIPT_FILE=1;
  ux = ~isempty(getenv('LFD'));
  if ux, graphics_toolkit('qt'); end

  function ax = do_plot(ux, E_in, ts)
    
    if ux
      show = 'on';
    else
      show = 'off';
    end
    
    %% plot input dataset
    ax = figure(30321);
    set(ax, 'visible', show);
      plot(E_in, ts, 'LineWidth', 1, 'ro-');
      hold on;
      set(gca, 'linewidth', 4, 'fontsize', 12)
      xlabel('in-sample error (E_in)');
      ylabel('iteration number (t)');
      title('convergence of pocket algorithm on non-seperable data');
    
    drawnow();
    
  end % function do_plot

  N   = 10e3; % number of training samples
  rad = 10;   % radius of semi-circle
  thk =  5;   % thickness of semi-circle
  sep = -5;   % separation between semi-circles

  %% uniformly distributed data
  z  = (rad - thk * (1 - rand(1,N))) .* exp(-j*2*pi*rand(1,N));

  %% target function
  f = @(z) sign(angle(z));

  %% target set
  y = f(z);

  %% cartesian basis representation
  x1 = -f(z)*(rad/2-thk/4) + abs(z) .* cos(angle(z));
  x2 = f(z)*sep/2 + abs(z) .* sin(angle(z));

  %% categorical index
  c1 = y > 0;
  c2 = y < 0;

  %% Pocket Algorithm
  t = 0;                              % training step counter
 %w = zeros(1,3);                     % initial weights
  w = randn(1,3);                     % initial weights
  X = [ones(size(y)); x1; x2];        % training data
  k_err = inf;                        % convergence criteria
  ts = 0:(N-1);
  for t = ts
    n = t+1;
    %% Perceptron Learning Algorithm (PLA)
    y_hat = sign(w*X(:,n));           % classify
    y_err = 0.5*abs(y(:,n) - y_hat);  % residual
    [k_err, k] = max(y_err);          % select misclassified point
    x_k = X(:,k);                     %   in the training data
    y_k = y(k);                       %   in the target set
    w_g  = w + y_k*x_k';              % guess weight
    %% check pocket
    y_hat_g = sign(w_g*X(:,n));            % classify
    y_err_g = 0.5*abs(y(:,n) - y_hat_g);   % residual
    [k_err_g, k_g] = max(y_err_g);    % select misclassified point
    if k_err > k_err_g                % is better than the pocket weights?
      w = w_g;                        %   ... yes, replace pocket
    end
    E_in(t+1) = min(k_err, k_err_g);
  end 

  ax = do_plot(ux, E_in, ts);
  if ux
    disp('training done.')
    input('...')
  else
    saveas(ax, 'figures/p3.3b.png');
  end
 
## *EOF*
