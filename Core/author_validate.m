function author = author_validate(author,title)

% author_validate - ensure non-empty author
% -----------------------------------------
%
% author = author_validate(author,title)
%
% Input:
% ------
%  author - author string
%  title - title of input dialog
%
% Output:
% -------
%  author - author string

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
% $Revision: 132 $
% $Date: 2004-12-02 15:58:47 -0500 (Thu, 02 Dec 2004) $
%--------------------------------

%--
% set title
%--

if (nargin < 2)
	title = 'Author';
end

%--
% ensure non-empty author
%--

if (isempty(author))
	
	ans_dialog = '';
	
	while (isempty(ans_dialog))
		
		ans_dialog = input_dialog( ...
            'Author', ...
            title, ...
            [1,40], ... 
            {''} ...
        );
	
		if (isempty(ans_dialog))
		
			author = [];
			return;
			
		else
		
			ans_dialog = deblank(fliplr(deblank(fliplr(ans_dialog{1}))));
			
			if (isempty(ans_dialog))
				
				tmp = warn_dialog( ...
					'Please enter a non-empty author.', ...
					'XBAT Warning  -  Empty Author', ...
					'modal' ...
				);
			
				waitfor(tmp);
				
			end
			
		end
		
	end	        
	
	author = ans_dialog;
	
end