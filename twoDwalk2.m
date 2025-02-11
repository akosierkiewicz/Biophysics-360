
nsteps = 1000;
nparticles = 10000;
position2d = twoDwalk(nsteps,nparticles);


 
%for i = 1:nparticles

    %position2d = twoDwalk(nsteps,nparticles);

%end



bins = -100:5:100;


figure();

subplot(1,3,1)
hist(position2d(1, :),bins)
title("X Values")

subplot(1,3,2)
hist(position2d(2, :),bins)
title("Y Values")

subplot(1,3,3)
scatter(position2d(1,:),position2d(2,:),8,"filled")

%ypositions = position2d()




