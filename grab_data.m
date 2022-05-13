function [A, b] = grab_data(filename)
    b = dlmread(filename, "")(:,2);  % data vector
    interval = [1:rows(b)]';  % column vector as index for the data vector
    A = interval .^ [0:10];
endfunction
