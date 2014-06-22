signin('TestBot', 'r1neazxo9w')

trace1 = struct(...
  'x', [0, 1, 2, 3, 4, 5, 6, 7, 8], ...
  'y', [0, 3, 6, 4, 5, 2, 3, 5, 4], ...
  'type', 'scatter');
trace2 = struct(...
  'x', [0, 1, 2, 3, 4, 5, 6, 7, 8], ...
  'y', [0, 4, 7, 8, 3, 6, 3, 3, 4], ...
  'type', 'scatter');
data = {trace1, trace2};
layout = struct('legend', struct(...
      'x', 0, ...
      'y', 1, ...
      'bgcolor', '#E2E2E2', ...
      'bordercolor', '#FFFFFF', ...
      'borderwidth', 2, ...
      'font', struct(...
        'family', 'sans-serif', ...
        'size', 12, ...
        'color', '#000'), ...
      'showlegend', true, ...
      'traceorder', 'normal'));

response = plotly(data, struct('layout', layout, 'filename', 'legend-style', 'fileopt', 'overwrite', 'auto_open', 'false'));
plot_url = response.url