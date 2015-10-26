
%% set up Oscar
ACCESS_TOKEN = 'copy the access token from your Account panel here';
scientist = Oscar(ACCESS_TOKEN);

%% define your experiment hyperparameters' space here
experiment.name = 'test';

experiment.parameters.x.min = -2;
experiment.parameters.x.max = 2;

experiment.parameters.c = {3, 4, 5};


%% get a job suggestion
job = scientist.suggest(experiment);
disp(job);

%% do your complex job here
loss = (job.x * job.c)^2;

%% update Oscar
scientist.update(job, loss);
