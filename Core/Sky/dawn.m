function time = dawn(varargin)

% dawn - time on given date and location
% --------------------------------------
%
% time = dawn(lon, lat, cal, tz)
%
% Input:
% ------
%  lon - longitude
%  lat - latitude
%  cal - date as [year, month, day] 
%  tz - offset from UTC
%
% Output:
% -------
%  time - of dawn
%
% See also: sunrise, sunset, dusk, sunmoon
%
% NOTE: this is just a convenience function calling 'sunmoon'

% time = sunbase('dawn', varargin{:});

events = sunmoon(varargin{:});

time = events.sun.dawn;

if ~nargout
	disp(' '); disp(sec_to_clock(3600 * time)); disp(' '); clear time;
end
