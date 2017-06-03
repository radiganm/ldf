#!/usr/bin/env octave
## problem_3_1_a.m
## Mac Radigan

  FORCES__SCRIPT_FILE=1;
  ux=false;

  function ax = do_plot(ux, rad, thk, c1, c2, x1, x2, w, k_err)
    
    if ux
      show = 'on';
    else
      show = 'off';
    end
    
    %% plot input dataset
    ax = figure(30111);
    set(ax, 'visible', show);
      plot(x1(c1), x2(c1), 'LineWidth', 1, 'r.');
      hold on;
      plot(x1(c2), x2(c2), 'LineWidth', 1, 'b.');
      hold on;
    
    %% plot final hypothesis, g(x)
    ext = rad + thk;
    m = -w(2)/w(3);
    b = -w(1)/w(3);
    dx1 = linspace(-ext, ext, 2);
    dx2 = m * dx1 + b;
    ax = figure(30111);
    set(ax, 'visible', show);
      if k_err > 0
        plot(dx1, dx2, 'Color', 'magenta', 'LineWidth', 1, 'LineStyle', ':');
      else
        plot(dx1, dx2, 'Color', 'green', 'LineWidth', 3);
      end
      hold on;
    
    drawnow();
    
  end % function do_plot

  N   = 2e3;  % number of training samples
  rad = 10;   % radius of semi-circle
  thk =  5;   % thickness of semi-circle
  sep =  5;   % separation between semi-circles

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

  %% Perceptron Learning Algorithm (PLA)
  t = 0;                         % training step counter
  w = zeros(1,3);                % initial weights
 %w = randn(1,3);                % initial weights
  X = [ones(size(y)); x1; x2];   % training data
  k_err = inf;                   % convergence criteria
  while k_err > 0 
    t = t + 1;                   % update training step counter
    ax = do_plot(ux, rad, thk, c1, c2, x1, x2, w, k_err);
    if ux
      fprintf(1, 'error: %f\n', k_err);
      t
      w
    end
    y_hat = sign(w*X);           % classify
    y_err = 0.5*abs(y - y_hat);  % residual
    [k_err, k] = max(y_err);     % select misclassified point
    if k_err <= 0, continue, end
    x_k = X(:,k);                %   in the training data
    y_k = y(k);                  %   in the target set
    w   = w + y_k*x_k';          % update weights
    if ux
      disp('...')
      input('...')
    end
  end % training

  ax = do_plot(ux, rad, thk, c1, c2, x1, x2, w, k_err);
  if ux
    disp('training done.')
  else
    saveas(ax, 'figures/p3.1a.png');
  end
 
## *EOF*
