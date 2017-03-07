clear all
close all

ons = 0:4:96;
offs = 96 - ons;

for i=1:25
    modelfunc(ons(i), offs(i))
end
