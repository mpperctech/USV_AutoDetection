function n = better_fft_size(n)

% better_fft_size - get a compatible better fft size
% --------------------------------------------------
%
% n = better_fft_size(n)
%
% Input:
% ------
%  n - desired fft size
%
% Output:
% -------
%  n - better fft size, may be larger than input

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

N = better_fft_sizes(n, 2 * n); 

ix = find(n <= N, 1, 'first'); 

n = N(ix);