N = 1000; %Number of particles

p = zeros(3,N);

for i = 1:N
   p(1,i) = rand;
   p(2,i) = rand;
   p(3,i) = rand;
end

figure()

tstep = 1000; %Number of timestep for particles to decay
count = 0;
for i = 1:tstep
   scatter3(p(1,:),p(2,:),p(3,:));
   title(['The number of particles detected is ',num2str(count)])
   r = randi([1 1000],1,1);
   if(p(3,r) ~= 0)
       dir = [randn;randn;randn];
       if(dir(3)<0)
           t = -p(3,r)/dir(3);
           xfin = p(1,r)+dir(1)*t;
           yfin = p(2,r)+dir(2)*t;
           display(t)
           if(((xfin-0.5)^2+(yfin-0.5)^2)<(0.4)^2)
               count = count + 1;
           end
       end
   end
   p(:,r) = zeros(3,1);
   pause(0.01)
end



