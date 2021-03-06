function [status] = ASE_log_is_open(log_list)
%
% Tests if any of the selected logs are open in an XBAT sound browser


%% make list of open logs (very quick, because logs already loaded!!!)
open_logs = cell(0,0);

h = get_xbat_figs('type','sound');

for k = 1:length(h)
  
  data = get(h(k),'userdata');
  
  curr_logs = data.browser.log;
  
  if ~isempty(curr_logs)
  
    open_logs = [open_logs, log_name(curr_logs)];
    
  end
  
end

%% if any selected logs are open, warn user and set status

status = 0;

NumLogs = length(log_list);

for i = 1:NumLogs

  CurrentLog = log_list{i};

  %find source path  
  [path, fn] = fileparts(CurrentLog);
  
  %skip log if log is open    
  if any(strcmp(fn, open_logs))
%     
%     fail(sprintf('Close log before copying:\n   %s', fn), 'WARNING')
%     
    status(i)= 1;
  else
    
       status(i)= 0;
       
  end
end