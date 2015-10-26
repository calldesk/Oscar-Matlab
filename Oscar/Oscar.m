classdef Oscar < handle

    properties (Access = private)
        scientist
    end

    methods
        function self = Oscar(api_key)
        %function self = Oscar(api_key)
            assert(verLessThan('matlab','8.4') == 0, 'Oscar:MatlabVersionError', 'Oscar requires later version of MATLAB (from 2014b)')
            try
                self.scientist = py.Oscar.Oscar(api_key);
            catch ME
                fprintf('Oscar python error\n');
                fprintf('Please check if Oscar-Python is installed\n');
                fprintf('https://github.com/sensout/Oscar-Matlab\n');

            end
        end

        function job = suggest(self, experiment)
        %function job = suggest(self, experiment)
            job = struct(self.scientist.suggest(experiment));
        end

        function update(self, job, loss)
        %function update(self, job, loss)
            self.scientist.update(job, struct('loss', loss));
        end
    end

end
