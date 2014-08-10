function control = parameter__control__create(parameter, context)

% XBAT2RAVEN_V33 - parameter__control__create

control = empty(control_create);

%%% pitz's changes added 11/19/12


% Optional fields separator
control(1) = control_create( ...
    'string','Choose Optional Fields to add to Selection Table', ...
    'style','separator', ...
    'type','header', ...
    'space', .75 ...
    );
  
%% -- pitz -- Tabs  
  
tabs = {'Filled Fields', 'Empty Fields'};

control(end + 1) = control_create( ...
    'style', 'tabs', ...
    'lines', 1.25, ...
    'tab', tabs ...
    );

%% Filled Field Tab

% Use XBAT scores CHECKBOX
control(end + 1) = control_create( ...
    'name', 'scores_flag', ...
    'alias', 'Event scores', ...
  'tab',tabs{1}, ...
    'style', 'checkbox', ...
    'space', .75, ...
    'value', parameter.scores_flag ...
    );

% Use XBAT ratings CHECKBOX
control(end + 1) = control_create( ...
    'name', 'ratings_flag', ...
    'alias', 'Event ratings', ...
  'tab',tabs{1}, ...
    'style', 'checkbox', ...
    'space', .75, ...
    'value', parameter.ratings_flag ...
    );

% Use XBAT tags CHECKBOX
control(end + 1) = control_create( ...
    'name', 'tags_flag', ...
    'alias', 'Event tags', ...
  'tab',tabs{1}, ...
    'style', 'checkbox', ...
    'space', .75, ...
    'value', parameter.tags_flag ...
    );



% Add filetime column CHECKBOX - BEGIN
control(end + 1) = control_create( ...
    'name', 'filetime_flag', ...
    'alias', 'Event begin offset times and begin file', ...
  'tab',tabs{1}, ...
    'style', 'checkbox', ...
    'space', 0.75, ...
    'value', parameter.filetime_flag ...
    );

% Add filetime column CHECKBOX - END FILE
control(end + 1) = control_create( ...
    'name', 'filetime_flag', ...
    'alias', 'Event end offset file', ...
  'tab',tabs{1}, ...
    'style', 'checkbox', ...
    'space', 0.75, ...
    'value', parameter.filetime_flag_end_file ...
    );

% Add filetime column CHECKBOX - END OFFSET
control(end + 1) = control_create( ...
    'name', 'filetime_flag', ...
    'alias', 'Event end offset time', ...
  'tab',tabs{1}, ...
    'style', 'checkbox', ...
    'space', 0.75, ...
    'value', parameter.filetime_flag_end ...
    );



% Add date and time columns 
control(end + 1) = control_create( ...
    'name', 'datetime_flag', ...
    'alias','Real datetimes', ...
  'tab',tabs{1}, ...
    'style', 'checkbox', ...
    'space', -2, ...
    'value', parameter.datetime_flag ...
    );

% Choose datetime format POPUP
control(end + 1) = control_create( ...
    'style', 'popup', ...
    'alias', ' ', ...
  'tab',tabs{1}, ...
    'name', 'datetime_format_out', ...
    'onload', 1, ...
	'space', 0.75, ...
    'width', 0.66, ...
    'align', 'right', ...
	'string', {'yyyymmdd_HHMMSS' ...
             'yyyymmdd_HHMMSS.FFF' ...
             'yyyymmdd_HHMMSSmFFF' ...
             'yyyymmddTHHMMSS' ...
             'yyyymmddTHHMMSS.FFF'...
             'yyyymmddTHHMMSSmFFF'...
             'mm-dd-yyyy HH:MM:SS.FFF'}, ...
    'value', 1 ...
    );
  

% Add real time CHECKBOX
control(end + 1) = control_create( ...
    'name', 'realtime_flag', ...
    'alias','Real times', ...
  'tab',tabs{1}, ...
    'style', 'checkbox', ...
    'space', -2, ...
    'value', parameter.realtime_flag ...
    );

% Choose  real time format POPUP
control(end + 1) = control_create( ...
    'style', 'popup', ...
    'alias', ' ', ...
  'tab',tabs{1}, ...
    'name', 'realtime_format_out', ...
    'onload', 1, ...
	'space', 0.75, ...
    'width', 0.66, ...
    'align', 'right', ...
	'string', {'HH:MM:SS' ...
              'HH:MM:SS.FFF' ...
              'HHMMSSmFFF'}, ...
    'value', 1 ...
    );


% Add real date CHECKBOX
control(end + 1) = control_create( ...
    'name', 'realdate_flag', ...
    'alias','Real dates', ...
  'tab',tabs{1}, ...
    'style', 'checkbox', ...
    'space', -2, ...
    'value', parameter.realdate_flag ...
    );

% Choose  real date format POPUP
control(end + 1) = control_create( ...
    'style', 'popup', ...
    'alias', ' ', ...
  'tab',tabs{1}, ...
    'name', 'realdate_format_out', ...
    'onload', 1, ...
	'space', 0.75, ...
    'width', 0.66, ...
    'align', 'right', ...
	'string', {'yyyymmdd' ...
              'mm/dd/yyyy' ...
              'mm-dd-yyyy'}, ...
    'value', 1 ...
    );


% Use XBAT notes CHECKBOX
control(end + 1) = control_create( ...
    'name', 'notes_flag', ...
    'alias', 'Event notes', ...
  'tab',tabs{1}, ...
    'style', 'checkbox', ...
    'space', 2, ...
    'value', parameter.notes_flag ...
    );

%% --pitz-- Empty Field Tab

%Name for Empty Field #1
control(end + 1) = control_create( ...
	'name', 'empty_field1', ...
  'alias', 'Empty Field #1',...
  'tab',tabs{2}, ...
	'style', 'edit', ...
	'string', parameter.empty_field1 ...
);

%Name for Empty Field #1
control(end + 1) = control_create( ...
	'name', 'empty_field2', ...
  'alias', 'Empty Field #2',...
  'tab',tabs{2}, ...
	'style', 'edit', ...
	'string', parameter.empty_field2 ...
);

%Name for Empty Field #1
control(end + 1) = control_create( ...
	'name', 'empty_field3', ...
  'alias', 'Empty Field #3',...
  'tab',tabs{2}, ...
	'style', 'edit', ...
	'string', parameter.empty_field3 ...
);

%Name for Empty Field #1
control(end + 1) = control_create( ...
	'name', 'empty_field4', ...
  'alias', 'Empty Field #4',...
  'tab',tabs{2}, ...
	'style', 'edit', ...
	'string', parameter.empty_field4 ...
);

%Name for Empty Field #1
control(end + 1) = control_create( ...
	'name', 'empty_field5', ...
  'alias', 'Empty Field #5',...
  'tab',tabs{2}, ...
	'style', 'edit', ...
	'string', parameter.empty_field5 ...
);


%% Empty Log Separator
control(end + 1) = control_create( ...
'string','Choose how to handle empty logs', ...
'style','separator', ...
'type','header', ...
'space', 0.75 ...
);

% Save new log CHECKBOX
control(end + 1) = control_create( ...
    'name', 'empty_logs_ok', ...
    'alias', 'Convert empty logs ', ...
    'style', 'checkbox', ...
    'space', 2, ...
      'value', parameter.empty_logs_ok ...
    );



%%
% % OUTPUT separator
% control(1) = control_create( ...
%     'string','Choose Log Fields to add to Selection Table', ...
%     'style','separator', ...
%     'type','header', ...
%     'space', .75 ...
%     );
% 
% % Use XBAT scores CHECKBOX
% control(end + 1) = control_create( ...
%     'name', 'scores_flag', ...
%     'alias', 'Event scores', ...
%     'style', 'checkbox', ...
%     'space', .75, ...
%     'value', parameter.scores_flag ...
%     );
% 
% % Use XBAT ratings CHECKBOX
% control(end + 1) = control_create( ...
%     'name', 'ratings_flag', ...
%     'alias', 'Event ratings', ...
%     'style', 'checkbox', ...
%     'space', .75, ...
%     'value', parameter.ratings_flag ...
%     );
% 
% % Use XBAT tags CHECKBOX
% control(end + 1) = control_create( ...
%     'name', 'tags_flag', ...
%     'alias', 'Event tags', ...
%     'style', 'checkbox', ...
%     'space', .75, ...
%     'value', parameter.tags_flag ...
%     );
% 
% % Add real time CHECKBOX
% control(end + 1) = control_create( ...
%     'name', 'realtime_flag', ...
%     'alias','Real times', ...
%     'style', 'checkbox', ...
%     'space', -2, ...
%     'value', parameter.realtime_flag ...
%     );
% 
% % Choose  real time format POPUP
% control(end + 1) = control_create( ...
%     'style', 'popup', ...
%     'alias', ' ', ...
%     'name', 'realtime_format_out', ...
%     'onload', 1, ...
% 	'space', 0.75, ...
%     'width', 0.66, ...
%     'align', 'right', ...
% 	'string', {'HH:MM:SS' ...
%               'HH:MM:SS.FFF' ...
%               'HHMMSSmFFF'}, ...
%     'value', 1 ...
%     );
% 
% 
% % Add real date CHECKBOX
% control(end + 1) = control_create( ...
%     'name', 'realdate_flag', ...
%     'alias','Real dates', ...
%     'style', 'checkbox', ...
%     'space', -2, ...
%     'value', parameter.realdate_flag ...
%     );
% 
% % Choose  real date format POPUP
% control(end + 1) = control_create( ...
%     'style', 'popup', ...
%     'alias', ' ', ...
%     'name', 'realdate_format_out', ...
%     'onload', 1, ...
% 	'space', 0.75, ...
%     'width', 0.66, ...
%     'align', 'right', ...
% 	'string', {'yyyymmdd' ...
%               'mm/dd/yyyy' ...
%               'mm-dd-yyyy'}, ...
%     'value', 1 ...
%     );
% 
% 
% 
% % Add date and time columns 
% control(end + 1) = control_create( ...
%     'name', 'datetime_flag', ...
%     'alias','Real datetimes', ...
%     'style', 'checkbox', ...
%     'space', -2, ...
%     'value', parameter.datetime_flag ...
%     );
% 
% % Choose datetime format POPUP
% control(end + 1) = control_create( ...
%     'style', 'popup', ...
%     'alias', ' ', ...
%     'name', 'datetime_format_out', ...
%     'onload', 1, ...
% 	'space', 0.75, ...
%     'width', 0.66, ...
%     'align', 'right', ...
% 	'string', {'yyyymmdd_HHMMSS' ...
%              'yyyymmdd_HHMMSS.FFF' ...
%              'yyyymmdd_HHMMSSmFFF' ...
%              'yyyymmddTHHMMSS' ...
%              'yyyymmddTHHMMSS.FFF'...
%              'yyyymmddTHHMMSSmFFF'...
%              'mm-dd-yyyy HH:MM:SS.FFF'}, ...
%     'value', 1 ...
%     );
% 
% 
% % Add filetime column CHECKBOX
% control(end + 1) = control_create( ...
%     'name', 'filetime_flag', ...
%     'alias', 'Event offset times from beginning of sound file', ...
%     'style', 'checkbox', ...
%     'space', 0.75, ...
%     'value', parameter.filetime_flag ...
%     );
% 
% % Use XBAT notes CHECKBOX
% control(end + 1) = control_create( ...
%     'name', 'notes_flag', ...
%     'alias', 'Event notes', ...
%     'style', 'checkbox', ...
%     'space', 2, ...
%     'value', parameter.notes_flag ...
%     );
% 
% 
% % OUTPUT separator
% control(end + 1) = control_create( ...
% 'string','Choose how to handle empty logs', ...
% 'style','separator', ...
% 'type','header', ...
% 'space', 0.75 ...
% );
% 
% % Save new log CHECKBOX
% control(end + 1) = control_create( ...
%     'name', 'empty_logs_ok', ...
%     'alias', 'Convert empty logs ', ...
%     'style', 'checkbox', ...
%     'space', 2, ...
%       'value', 1 ...
%     );
% 