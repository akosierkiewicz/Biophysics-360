% Initialize variables
NumParticles = 150000;
Imsize = 1001; % must be odd!

% Initialize an empty image with a particle in the middle
image = zeros(Imsize, Imsize);
image((Imsize/2)+0.5, (Imsize/2)+0.5) = 1;
radius = Imsize/2.5;

% Perform the random walk several times
for i = 1:NumParticles

    % Place a particle at a position along a circle
    x = 2*pi*rand;
    position = [(Imsize/2)+0.5+round(radius*cos(x)) ...
                (Imsize/2)+0.5+round(radius*sin(x))];

    % If a particle wanders too far from the origin, start over
    while position(1) < Imsize-1 && position(1) > 1 && ...
          position(2) < Imsize-1 && position(2) > 1

        % If a particle is adjacent to another one, freeze it in place
        s = image(position(1)+1, position(2)) ... 
        + image(position(1)-1, position(2))     ...
        + image(position(1), position(2)+1)     ...
        + image(position(1), position(2)-1);

        if s > 0
            image(position(1), position(2)) = 1;
            break;
        end

        % Otherwise, walk a step
        y = rand;
        if y < 0.25
            position(1) = position(1) + 1;
        elseif y < 0.5
            position(1) = position(1) - 1;
        elseif y < 0.75
            position(2) = position(2) + 1; 
        else
            position(2) = position(2) - 1;
        end

    end

end

imshow(image)
