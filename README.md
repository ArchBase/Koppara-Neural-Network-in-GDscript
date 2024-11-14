# Koppara-Neural Network in GDscript
 Koppara library with its framework allows you to implment fullly functional neural networks, ML models etc. in Godot natively.
 ## Possibility💪(may not  be practical)
  * Language Models
  * Computer vision models
  * Voice recognition models
 ## Things included in demo✔️
  * Self driving simple car
  * Simple RNN based Language Model

# How to use Koppara❓
 Just copy paste or clone this repo to res:// of your godot project
 Use any demo as a reference to implement and train your model

# How this works⚙️
 ## Architecture
  Koppara uses sequential layer by layer, neuron by neuron architecture to implement fully functional neural networks
 ## Training
  Koppara implements a completely different optimization algorithm
  1 . Optimizer tries a random variation to all the weights
  2 . If model was improved after variation, save same variation gradient for next iteration
  3 . If model was not improved, try negated variation in next iteration, restore previous weights
  4 . If negated variation is also not improving, generate new random gradient for next iteration, restore previous weights
  4 . repeat
  
# Should you use Koppara?🤔
 Koppara is not fully developed and contains many bugs which are not even discovered, so you can't consider y=this as a production ready library/framework
 
# Contribute to Koppara😊
 Contributions are welcome, let's make this skyhigh

