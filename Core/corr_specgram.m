function BB = specgram_corr(f,t,dt,ch)

% specgram_corr - spectrogram based correlation computation
% ---------------------------------------------------------
%
% BB = specgram_corr(f,t,dt,ch)
%
% Input:
% ------
%  f - sound structure or type of sound
%  t - initial time
%  dt - time duration
%  ch - channels to correlate

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

%--
% create browser structure
%--

browser = browser_create(f);

%--
% read samples from file group
%--

X = sound_read(browser.sound,'time',t,dt,ch);

%--
% compute channels spectrograms
%--

% get spectrogram options

sopt = browser.specgram;
	
% compute spectrogram dB scaled power according to display options	

for k = 1:length(ch)
	
	[B{k},F{k},T{k}] = fast_specgram(X(:,k), ...
							sopt.fft, ...
							browser.sound.samplerate, ...
							feval(sopt.win.type,sopt.win.length), ...
							sopt.hop, ...
							'power' ...
						);			
% 	B{k} = lut_dB(B{k});
			
end

%--
% compute channels correlation
%--

for j = 1:length(ch)
for k = j:length(ch)
	BB{k,j} = B{k}'*B{j};
end
end
