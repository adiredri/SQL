select model from car WHERE cost < (100 + (select min(cost) from car));
;
