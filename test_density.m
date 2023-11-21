n = 100;
[x,y] = meshgrid(linspace(-200,200,n),linspace(-200,200,n));

t = 1;



s=10000

for t = 1:10:s
    d = density_map(x,y,t);
    surf(x,y,d);
    % contourf(x,y,d(:,:,end),20);
    shading interp;
    pause(0.1)
end
