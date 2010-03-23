function t_ok(cond, msg)
%T_OK  Tests if a condition is true.
%   T_OK(EXPR, MSG) increments the global test count and if the EXPR
%   is true it increments the passed tests count, otherwise increments
%   the failed tests count. Prints 'ok' or 'not ok' followed by the
%   MSG, unless the global variable t_quiet is true. Intended to be
%   called between calls to T_BEGIN and T_END.
%
%   Example:
%       quiet = 0;
%       t_begin(5, quiet);
%       t_ok(pi > 3, 'size of pi');
%       t_skip(3, 'not yet written');
%       t_is(2+2, 4, 12, '2+2 still equals 4');
%       t_end;
%
%   See also T_IS, T_SKIP, T_BEGIN, T_END, T_RUN_TESTS.

%   MATPOWER
%   $Id$
%   by Ray Zimmerman, PSERC Cornell
%   Copyright (c) 2004-2010 by Power System Engineering Research Center (PSERC)
%   See http://www.pserc.cornell.edu/matpower/ for more info.

global t_quiet;
global t_counter;
global t_ok_cnt;
global t_not_ok_cnt;

if nargin < 2 || strcmp(msg, '')
    msg = '';
else
    msg = [' - ', msg];
end
if cond
    t_ok_cnt = t_ok_cnt + 1;
else
    t_not_ok_cnt = t_not_ok_cnt + 1;
    if ~t_quiet
        fprintf('not ');
    end
end
if ~t_quiet
    fprintf('ok %d%s\n', t_counter, msg);
end
t_counter = t_counter + 1;