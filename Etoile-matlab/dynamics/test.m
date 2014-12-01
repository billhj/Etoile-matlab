figure;
hold on;
plot(armmodel.tau(3,20:100), 'r')   %z y x order
% plot(armtorque.storquenograivity(1,20:100), 'g') % x y z cross
plot(armtorque.storque(1,20:100), 'g')
plot(armtorque.storqueS(1,20:100), 'b')
% plot(armtorque.gravity(1,20:100), 'c')

figure;
hold on;
plot(armmodel.tau(2,20:100), 'r')   %z y x order
% plot(armtorque.storquenograivity(2,20:100), 'g') % x y z cross
plot(armtorque.storque(2,20:100), 'g')
plot(armtorque.storqueS(2,20:100), 'b')
% plot(armtorque.gravity(2,20:100), 'c')

figure;
hold on;
plot(armmodel.tau(1,20:100), 'r')   %z y x order
% plot(armtorque.storquenograivity(3,20:100), 'g') % x y z cross
plot(armtorque.storque(3,20:100), 'g')
plot(armtorque.storqueS(3,20:100), 'b')
% plot(armtorque.gravity(3,20:100), 'c')
%plot(armtorque.ssepratetorque(3,5:100), 'b')
% plot(humanoid.skeleton(2).rxyz(3,1:1000), 'r')
% plot(humanoid.skeleton(3).rxyz(3,1:1000), 'g')
% plot(humanoid.skeleton(4).rxyz(3,1:1000)+0.0001, 'b')
% plot(humanoid.skeleton(5).rxyz(3,1:1000), 'c')
% 
% x = humanoid.skeleton(3).rxyz(3,1:1000);
% y = humanoid.skeleton(5).rxyz(3,1:1000);
% mdl_q = LinearModel.fit(x,y);
% mdl_q
%plot(model.q(10, 1:1000), 'm')
% figure;
%plot(model.tauNoAcc(4, 1:1000), 'g')
% figure;
%plot(model.tauRest(4, 1:1000), 'b')
% figure;
% plot(model.tau(4, 1:1000), 'red')