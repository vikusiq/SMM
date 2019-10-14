close all
figure
hold on

base = 3;
prec = 3;

maxval = base ^ prec - 1;
mantissas = (-maxval: maxval) / (maxval + 1)

for expo = -prec: prec
    nums = mantissas * base ^ expo;
    plot(nums, 0, 'b.')
end