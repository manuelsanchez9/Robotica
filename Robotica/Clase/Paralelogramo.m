function [ v1, w1 ] = Paralelogramo( v, w)
v1 = v +[ones(1,2)*w(1,2);ones(1,2)*w(2,2)];
w1 = w +[ones(1,2)*v(1,2);ones(1,2)*v(2,2)];
end

