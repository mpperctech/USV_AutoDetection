function SE1 = se_tight(SE)

% se_tight - make structuring element support minimal
% ---------------------------------------------------
%
% SE1 = se_tight(SE)
%
% Input:
% ------
%  SE - structuring element
%
% Output:
% -------
%  SE1 - minimal support structuring element

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
% $Date: 2004-12-02 15:58:47 -0500 (Thu, 02 Dec 2004) $
% $Revision: 132 $
%--------------------------------

%--
% produce SE with minimal support
%--

if (se_rep(SE) == 'mat')
	SE1 = se_mat(se_vec(SE));
end
