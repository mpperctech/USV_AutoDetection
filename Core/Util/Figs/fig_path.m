function p = fig_path(d)

% fig_path - get and set figure save path
% ---------------------------------------
%
% p = fig_path(d)
%
% Input:
% ------
%  d - directory to set as local root
% 
% Output:
% -------
%  p - local image directory

% Copyright (C) 2002-2012 Cornell University

%
% This file is part of XBAT.
% 
% XBAT is free software; you can redistribute it and/or modify
% it under the terms of the GNU General Public License as published by
% the Free Software Foundation; either version 2 of the License, or
% (at your option) any later version.
% 
% XBAT is distributed in the hope that it will be useful,
% but WITHOUT ANY WARRANTY; without even the implied warranty of
% MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
% GNU General Public License for more details.
% 
% You should have received a copy of the GNU General Public License
% along with XBAT; if not, write to the Free Software
% Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301 USA

%--------------------------------
% Author: Harold Figueroa
%--------------------------------
% $Revision: 1.0 $
% $Date: 2003-09-16 01:30:43-04 $
%--------------------------------

%--
% set and get fig save path
%--

if (~nargin)
	try
		p = get_env('fig_path');
	catch
		set_env('fig_path','');
		p = get_env('fig_path');
	end
else
	set_env('fig_path',d);
	p = d;
end
