# BooleanControl
A repository designed to work as a MATLAB working directory to model Circadian gene regulation using boolean networks

## Contents

### Classes
* **eval_tree.m**
	* This class is designed to be used recursively at each gate leading to a particular node. The class method '<eval>' is called at each time step for each node.

* **gatetype.m**
	* This class is a simple enumeration of the four allowed gate types, AND, OR, NOT, and ID (The identity gate). Any other gate is produced by combining these gate types.

* **fetch_node.m**
	* This class is the base of the evaluation recursion. It contains a signal delay and a node for which it is fetching the state.

* **light_node.m**
	* This class is for implementing the paper because the light node '<eval>' has to depend on dawn and dusk and not on any edges leading into the node.

### Scripts
* **basic_boolean.m** 
	* This file contains a sample implementation of a 4 node network using each gate type and a random set of starting states.

* **papermodel.m**
	* This file is where we implement the models taken from the paper also found in the repository.

### PDFs
* **BooleanMathBioPaper.pdf**
	* Aptly named, this paper was the inspiration for this project.

* **BooleanSuppMats.pdf**
	* This is all of the math they couldn't fit in the actual published paper.

### Text Files
* **adamtest.txt**
	* We can probably delete this.

## Things to Accomplish

- [x] Make a git repository
- [x] Figure out basic boolean network implementation
- [x] Add signal delay functionality
- [ ] Iron out light node difficulties
- [ ] Implement the model from the paper
- [ ] Start turning out the lights and seeing what happens