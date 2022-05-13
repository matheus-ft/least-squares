function [A, b] = grab_data(filename)
    b = dlmread(filename, "")(:,2);
    interval = 1:rows(b);
    interval = interval - (rows(b) / 2);  # this way we reduce the absolute value of the elements in A
    A = [];
    for i = 1:rows(b)
        A(i, :) = interval(i) .^ [1:10];
    endfor
endfunction