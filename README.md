# CorticalSpikingNet
Implementation of a cell-type specific laminar cortical column spiking network model, as presented in [Giulia Moreni, **Rares A. Dorcioman**, et al. (2025). Cell-type-specific firing patterns in a V1 cortical column model depend on feedforward and feedback-driven states. *PLos Computational Biology*](https://journals.plos.org/ploscompbiol/article?id=10.1371/journal.pcbi.1012036).<br>

This repository contains an independent implementation of the model described above, intended to simplify simulation, analysis, and extension. The maintainer of this repository is a co-author of the referenced publication. This is not the official code release associated with the study.

## Installation and Use

Clone the repository:

```bash
git clone https://github.com/Rares-Andrei/CorticalSpikingNet.git
cd CorticalSpikingNet
```
Create conda environment:
```bash
conda env create -f environment.yml
```
Activate conda environment:
```bash
conda activate CorticalSpikingNet
```
Define environment variable (usually the path is a *runs* folder in the model directory):
```bash
export EXPERIMENT_PATH=/path/to/run_folder_where_to_save_outputs
```
Run main simulation:
```
python3 simulate.py t_sim=1000 experiment_type=experiment_name
```

Structure of the repository:
```text
├── config
│   ├── config.yaml
├── plotting
├── utils
│   ├── utils.py
├── environment.yml
├── network_main.py
├── network_parameters.py
├── README.md
├── run_simulations.sh
└── simulate.py
```

### config/config.yaml

Defines the configuration parameters to identify a particular run, such as simulation time, expertiment type etc. The project uses [Hydra](https://hydra.cc/) to manage configurations.

### plotting/

Scripts or notebooks to analyze data after a simulation finished.

### utils/utils.py

Functions to set up run folder, logger, save config etc.

### network_main.py

File that defines the network class and its specific functions: sets up neural network, creates neuronal populations, connections and prepares simulation.

### network_parameters.py

File to define parameters relevant to the cortical column: number of neurons, fractions of each population, firing thresholds, membrane time constants, neuron equation (leaky integrate-and-fire), synaptic equations, receptor equations (AMPA, GABA, NMDA) etc.

### run_simulations.sh

Bash script to run potential parameter sweeps.

### simulate.py

Defines the time resolution of the simulation, creates run folder, sets up loggers, creates the network object (with its specific neural populations and connections) and runs the simulation according to specifications. Lastly, it saves relevant data in the run folder.

### Results

Results will be saved in the run folder as indicated by the EXPERIMENT_PATH variable (usually called *runs*). It will contain the config file used at run time, the logger outputs and three folders: metrics, raster_plots and spike_times, which can be used to analyze results.

**Note**, the code might take longer to run the first time, however, Brian2 will usually keep information in cache for subsequent runs and shorten the simulation time significantly.

