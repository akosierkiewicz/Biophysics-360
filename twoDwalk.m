
function [position2d] = twoDwalk(nsteps,nparticles)

j = 1;
position2d = zeros(nparticles,2);
xpos = zeros(nparticles,1)
ypos = zeros(nparticles,1)

while j < nparticles + 1
    xposition = 0;
    yposition = 0;
    i = 0;
    while i < nsteps 
        p = rand;
        if p < 0.25
            xposition = xposition - 1;


        elseif  p < 0.5
            xposition = xposition + 1;

        elseif p < 0.75
            yposition = yposition + 1;

        else
            yposition = yposition - 1;
   
        end
       
    i  = i + 1;

    end
    position2d(j,1) = xposition;
    position2d(j,2) = yposition;
    xpos(j) = xposition;
    ypos(j) = yposition;
    j = j + 1;

end
    
 

position2d = position2d'

%xpos
%ypos

end
