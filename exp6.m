N = 10000; %Number of particles

p = zeros(4,N);%Postions of particle
p(4,:) = zeros(1,N);%4th column tells you whether the particle already decayed or not
dpp = zeros(3,100000);
dpdp = zeros(3,100000);

%Put the particles into random places
for i = 1:N
   p(1,i) = rand;
   p(2,i) = rand;
   p(3,i) = rand;
end

tstep = 499; %Number of timestep for particles to decay
count = 0; %number of particle detected
numdecay = 0;
nremain = N; %number of particle remaining
countvec = zeros(tstep); %empty vector to store the number of particle detected and number of particle reamining
remainvec = zeros(tstep);
for i = 1:tstep %For each timestep
   for j = 1:N %For each paricle
         if(rand<0.05)%rand returns the uniform distribution between 0 to 1 and rand<0.01 returns whether the particle decayed or not
            dir = [2*rand-1;2*rand-1;2*rand-1];%direction of alpha particle
            numdecay = numdecay + 1;
            if(dir(3)<0)
                t = -p(3,j)/dir(3);%calculating the intersection with x-y plane
                xfin = p(1,j)+dir(1)*t;
                yfin = p(2,j)+dir(2)*t;
                %display(t)
                if(((xfin-0.5)^2+(yfin-0.5)^2)<(0.3)^2)%determine whether the intersetion is inside the circle
                    %if(((p(1,j)-xfin)^2+(p(2,j)-yfin)^2+p(3,j)^2)<(0.4)^2)
                      count = count + 1;
                    %end
                end
            end
         end 
   end
   pause(0.01)
   countvec(i) = count;
   remainvec(i) = nremain;
end

figure()
plot(countvec(1:500))
title(['N = ',num2str(N)])
xlabel('Timestep')
ylabel('Number of particle')
grid minor
hold on
plot(remainvec(1:500))
legend('Paricle detected','Particle remaining')

display(numdecay)
display(count)