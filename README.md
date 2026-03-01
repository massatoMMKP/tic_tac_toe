# Tic Tac Toe

This project is an implementation of the classic Tic Tac Toe game, developed as a technical challenge for an internship position.

The main focus was not only delivering a working game, but designing it with clear architecture, separation of responsibilities, and strong object-oriented principles.

The goal was to model a simple domain in a way that reflects clean structure, extensibility, and maintainability.

---

## Game Modes

The application supports three player combinations:

- Player vs Player  
- Player vs Computer  
- Computer vs Computer  

The existence of the Computer vs Computer mode is not just an extra feature — it is a direct consequence of the architectural decisions made.

The game does not depend on concrete player types, but on behavior.

Any entity that implements `move(board)` can participate in a match.

---

## Architectural Decisions

The project was structured with a clear separation between:

- Game state  
- Domain rules  
- Game flow control  
- Decision strategy  

### Board

Represents the game state and encapsulates all core rules:

- Move validation  
- Win detection  
- Draw detection  

It has no responsibility related to interface or flow control.

### Game

Coordinates the match:

- Turn switching  
- Interaction between players and the board  

It does not implement internal game rules.

### Players

Players are treated as behavioral abstractions.

The game simply requests a move — regardless of whether it comes from a human or an algorithm.

This decision reduces coupling and makes the system extensible.

---

## Computer Strategy

The computer opponent uses **Negamax**, a simplified variation of the Minimax algorithm.

The choice was intentional.

Negamax guarantees optimal decisions within the limited domain of Tic Tac Toe while maintaining mathematical clarity and avoiding duplicated logic.

The computer:

- Simulates future game states  
- Evaluates terminal outcomes  
- Propagates values recursively  
- Selects the best available move  

The implementation prioritizes correctness and readability over micro-optimizations.

---

## Tests

The core domain logic is covered with unit tests using RSpec.

The following behaviors are validated:

- Win conditions  
- Draw conditions  
- Invalid moves  
- Proper turn alternation  
- Guarantee that the computer always returns a valid move  
- Strategic behavior of the AI  

Tests were written focusing on observable behavior rather than internal implementation details.

---

## Applied Principles

During development, the following principles were prioritized:

- Clear separation between domain and interface  
- Low coupling  
- Single responsibility  
- Predictable and readable code  
- Structural readiness for future evolution  

The current architecture allows:

- Replacing the CLI with a web interface without changing domain logic  
- Adding new types of players  
- Implementing different AI heuristics  
- Running automated simulations between strategies  

---

## Running the Project

### Clone the repository

```bash
git clone https://github.com/massatoMMKP/tic_tac_toe.git
cd tic_tac_toe
```

### Install dependencies

```bash
bundle install
```

### Run the game

```bash
ruby main.rb
```

### Run the tests

```bash
rspec
```

