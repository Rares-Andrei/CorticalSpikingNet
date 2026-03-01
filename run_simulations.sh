# Define the parameters
t_sim=2000
base_experiment_type="g5_50k"
synaptic_densities=(0.5)

# Loop through the synaptic densities and run the python script with each value
for synaptic_density in "${synaptic_densities[@]}"
do
    # Create a new experiment_type string that includes the synaptic_density
    experiment_type="${base_experiment_type}_syn${synaptic_density}"
    
    # Run the Python script with the updated experiment_type
    python3 simulate.py t_sim=$t_sim experiment_type=$experiment_type synaptic_density=$synaptic_density
done
