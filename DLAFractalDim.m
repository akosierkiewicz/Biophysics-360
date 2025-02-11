% Parameters
NumParticles = 30000;
Imsize = 451; % must be odd!
Cutoff = 80;
Runs = 50;
Coefficients = zeros(1, Runs);

% Run a copy of the DLA code a specified number of times
for j = 1:Runs
    image = zeros(Imsize, Imsize);
    image((Imsize/2)+0.5, (Imsize/2)+0.5) = 1;
    radius = Imsize/2.5;
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

    % Use the FractalCounter function to obtain counts
    y = FractalCounter(image);
    
    % Cut it off after some value
    y = y(1:Cutoff);
    
    % Create the x-axis
    x = 1:Cutoff;

    % Perform the fit
    f = fit(x.', y.', 'power1');

    % Obtain the exponent
    Coefficients(j) = f.b;

end

disp(Coefficients);