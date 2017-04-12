function [answer] = BoxMenu (title, question) % opt1, opt2, opt3)

% Function that create a BoxMenu with these 3 options
% Enjoy :)



% Construct a questdlg with three options
choice = questdlg(question, ...
	title, ...
	'Yes','Nein','Let me go plz', 'fix');
% Handle response
switch choice
    case 'Yes'
        disp([choice ' chosen.'])
        answer = 1;
    case 'Nein'
        disp([choice ' chosen.'])
        answer = 2;
    case 'Let me go plz'
        disp([choice ' chosen.'])
        answer = 0;
end