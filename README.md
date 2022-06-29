# Genetic_Algorithm_WFLOP
Genetic Algorithm code to solve Wind Farm Layout Optimisation Problem 
To use this code: refer gen_mul.m which is the master module.
Usage is: [lt,power,cos,n_t,eff,n] = gen_mul(x,y,wf), 
where, Inputs to the model --> x - no.of rows (5D distance apart); D - turbine rotor Dia.
                               y - no.of columns (3D distance apart);
                               wf - refers to the wind farm case in the study
                                    conducted (refer to:- https://doi.org/10.5194/adgeo-54-79-2020)
                                    wf takes the values (1, 21, 22, 23, and 3);
       Outputs from the Model are --> lt - best performing layout at each generation
                                      power - power of the best performing layout at each generation
                                      cos - cost of the best performing layout at each generation
                                      n_t - no.of turbines in the best performing layout at each generation
                                      eff - efficiency of the ebst performing layout at each generation
                                      n - no.of generations/iterrations completed
