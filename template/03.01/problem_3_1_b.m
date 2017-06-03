#!/usr/bin/env octave
## problem_3_1_b.m
## Mac Radigan

  FORCES__SCRIPT_FILE=1;
  ux=false;

  function ax = do_plot(ux, rad, thk, c1, c2, x1, x2, w)
    
    if ux
      show = 'on';
    else
      show = 'off';
    end
    
    %% plot input dataset
    ax = figure(30112);
    set(ax, 'visible', show);
      plot(x1(c1), x2(c1), 'LineWidth', 1, 'r.');
      hold on;
      plot(x1(c2), x2(c2), 'LineWidth', 1, 'b.');
      hold on;
    
    %% plot input dataset
    ax = figure(30112);
    set(ax, 'visible', show);
      plot(x1(c1), x2(c1), 'rx');
      hold on;
      plot(x1(c2), x2(c2), 'bx');
      hold on;
    
    %% plot final hypothesis, g(x)
    ext = rad + thk;
    m = -w(2)/w(3);
    b = -w(1)/w(3);
    dx1 = linspace(-ext, ext, 2);
    dx2 = m * dx1 + b;
    ax = figure(30112);
    set(ax, 'visible', show);
      plot(dx1, dx2, 'Color', 'green', 'LineWidth', 3);
      hold off;
    
    drawnow();
    
  end % function do_plot

  N   = 2e3;  % number of training samples
  rad = 10;   % radius of semi-circle
  thk =  5;   % thickness of semi-circle
  sep =  5;   % separation between semi-circles

  %% uniformly distributed data
  z = (rad - thk * (1 - rand(1,N))) .* exp(-j*2*pi*rand(1,N));

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

  %% Linear Regression
  X = [ones(size(y)); x1; x2];   % training data
  w = y * pinv(X);

  %% plot results
  ax = do_plot(ux, rad, thk, c1, c2, x1, x2, w);

  if ~ux
    saveas(ax, 'figures/p3.1b.png');
  end

## *EOF*
