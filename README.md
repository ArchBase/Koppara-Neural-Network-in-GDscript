# 🌌 Koppara - Neural Network Library in GDScript
**Koppara** is a framework that enables the implementation of fully functional neural networks, machine learning models, and more—all natively within Godot.

## 🧠 Possibilities (Experimental)
Although some applications may be challenging, Koppara holds the potential for implementing:
- **Language Models**
- **Computer Vision Models**
- **Voice Recognition Models**

## 🚗 Demo Features
The Koppara demo includes:
- **Self-Driving Simple Car**: An autonomous driving simulation using basic neural networks.
- **RNN-Based Language Model**: A simple Recurrent Neural Network for basic language generation.

---

## 🔧 How to Use Koppara
1. **Clone or Copy** this repository to `res://` in your Godot project.
2. **Use the Demos** as a reference to implement and train your own models.

---

## ⚙️ How Koppara Works

### 📐 Architecture
Koppara utilizes a **sequential, layer-by-layer, neuron-by-neuron architecture** to build neural networks from the ground up, providing flexibility for custom implementations.

### 📈 Training Process
Koppara introduces a unique optimization approach, distinct from traditional algorithms:

1. **Random Variation**: The optimizer applies random variations to all weights.
2. **Gradient Selection**: If the model improves, this gradient is saved for the next iteration.
3. **Negated Variation**: If no improvement occurs, a negated variation is attempted in the next iteration, and previous weights are restored.
4. **Revert & Retry**: If the negated variation also fails to improve the model, a new random gradient is generated, and weights are restored.
5. **Repeat**: This cycle continues, iterating until optimal performance is reached.

---

## ❓ Should You Use Koppara?

Koppara is in early development, with known and undiscovered bugs. It’s not production-ready, but is suitable for experimentation, learning, and testing in the Godot environment.

---

## 🙌 Contribute to Koppara
We welcome contributions to help expand Koppara’s potential! Join us in pushing Koppara to new heights.

---

## 💬 Join the Community
For support and updates, join our Discord: [Koppara Discord](https://discord.gg/WZyyT5kMUk)
