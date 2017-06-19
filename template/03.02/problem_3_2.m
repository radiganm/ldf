#!/usr/bin/env octave
## problem_3_2.m
## Mac Radigan

  FORCES__SCRIPT_FILE=1;
  ux = ~isempty(getenv('LFD'));
  if ux, graphics_toolkit('qt'); end

  function ax = do_plot(ux, seps, ts)
    
    if ux
      show = 'on';
    else
      show = 'off';
    end
    
    %% plot input dataset
    ax = figure(30211);
    set(ax, 'visible', show);
      plot(seps, ts, 'LineWidth', 1, 'ro-');
      xlabel('separation between semi-circles');
      ylabel('number of iterations');
      title('convergence rate with respect to separability');
      set(gca, 'linewidth', 4, 'fontsize', 12)
      hold on;
    
    drawnow();
    
  end % function do_plot

  function t = do_pla(sep, N, rs, thetas)
    
    rad = 10;   % radius of semi-circle
    thk =  5;   % thickness of semi-circle
    
    %% uniformly distributed data
    z  = (rad - thk * (1 - rs)) .* exp(-j*2*pi*thetas);
    
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
    
    %% Perceptron Learning Algorithm (PLA)
    t = 0;                         % training step counter
    w = zeros(1,3);                % initial weights
   %w = randn(1,3);                % initial weights
    X = [ones(size(y)); x1; x2];   % training data
    k_err = inf;                   % convergence criteria
    for n = 1:N
      x_n = X(:,n);
      t = t + 1;                      % update training step counter
      y_hat = sign(w*X);              % classify
      y_err = 0.5*abs(y - y_hat);     % residual
      [k_err, k] = max(y_err);        % select misclassified point
      if k_err <= 0 
        break
      else
        wg = w;
      end
      x_k = X(:,k);                   %   in the training data
      y_k = y(k);                     %   in the target set
      w   = w + y_k*x_k';             % update weights
    end % training
    
  end % function do_pla

  N   = 2e3;           % number of training samples
  rs = rand(1,N);      % radii
  thetas = rand(1,N);  % angles

  seps = 0.2 : 0.2 : 5; % separation between semi-circles

  f = @(seps) do_pla(seps, N, rs, thetas);

  ts = arrayfun(f, seps, 'UniformOutput', false);

  ax = do_plot(ux, seps, cell2mat(ts));
  if ux
    input('...')
  else
    saveas(ax, 'figures/p3.2.png');
  end
 
## *EOF*
