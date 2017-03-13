clear all
close all

ons = 0:2:48;
offs = 48 - ons;

for i=1:25
    modelfunc(ons(i), offs(i))
end
