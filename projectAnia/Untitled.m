prompt = 'Please input letter code:';
inp = input(prompt,'s');
if strcmp(inp,'CBA')
    fprintf('answer is 1');
elseif strcmp(inp,'BAC')
    fprintf('answer is 0');
end