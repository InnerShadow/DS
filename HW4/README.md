# **HW4**
## Create a reinforcement learning neural network model and apply hyperparameter tuning to this model.

### [**Code**](/HW4/HW4.ipynb)

### Environment
Given a 5 by 5 matrix, the exit is in the top left corner, and the agent is in the bottom right corner. Obstacles are located in the top right, bottom left corners, and in the center. The agent has 4 actions: up, down, left, and right. The agent has 10 iterations to reach the exit. In each iteration, the agent accrues negative Euclidean distance to prevent it from standing still, encouraging it to be close to the exit. A penalty of -1000 points is given for encountering an obstacle, and +50 points for reaching the exit.

### Neural Network Model
The QNetwork model is designed for reinforcement learning, specifically using the Q-learning method. It is a machine learning method that helps the agent make decisions in an uncertain environment based on experience. The agent learns which actions lead to the best results by evaluating Q-values for each state-action pair. During training, the agent aims to improve its predictions to make optimal decisions and maximize accumulated rewards in the given environment. The model uses smooth L1 loss to correct its predictions, striving for the best reward outcome in the environment. The model can consist of any number of hidden layers and neurons with a linear activation function.

### Training the Model

1. The model was initially trained with arbitrary parameters: hidden_neurons = 24, hidden_layers = 1, episodes = 500, learning_rate = 0.01, gamma = 0.95. The score obtained was 27.242. Console and graphical versions of the agent's movement in the environment were then displayed for clarity.
2. The RandomizedSearchCV automatic hyperparameter tuning method was applied. Among the hyperparameters were: learning_rate from 0.001 to 0.02 with a step of 0.001; gamma from 0.9 to 0.95 with a step of 0.01; episodes from 250 to 1500 with a step of 50; hidden_neurons from 2 to 50 with a step of 1; hidden_layers from 1 to 5 with a step of 1. Hyperparameter tuning was performed on 25 different sets, with each set run 3 times to mitigate random learning fluctuations. The best-found parameters were: learning_rate - 0.003, hidden_neurons - 31, hidden_layers - 1, gamma - 0.91, episodes - 1350. This solution was also visualized using graphs. The score obtained was 27.242.


