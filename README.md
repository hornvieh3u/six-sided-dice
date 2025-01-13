# `six-sided-dice`

Welcome to your new `six-sided-dice` project and to the Internet Computer development community. By default, creating a new project adds this README and some template files to your project directory. You can edit these template files to customize your project and to include your own code to speed up the development cycle.

To get started, you might want to explore the project directory structure and the default configuration file. Working with this project in your development environment will not affect any production deployment or identity tokens.

To learn more before you start working with `six-sided-dice`, see the following documentation available online:

- [Quick Start](https://internetcomputer.org/docs/current/developer-docs/setup/deploy-locally)
- [SDK Developer Tools](https://internetcomputer.org/docs/current/developer-docs/setup/install)
- [Motoko Programming Language Guide](https://internetcomputer.org/docs/current/motoko/main/motoko)
- [Motoko Language Quick Reference](https://internetcomputer.org/docs/current/motoko/main/language-manual)

If you want to start working on your project right away, you might want to try the following commands:

```bash
cd six-sided-dice/
dfx help
dfx canister --help
```

## Objective: The objective of the game is to be the first player to reach a total of 100 points.

Gameplay:

Two players take turns rolling a six-sided die.
On your turn, roll the die and accumulate points based on the number rolled.
If you roll a number from 2 to 6, you have two options:
Roll Again: Choose to roll the die again to add the newly rolled points to your current turn's total.
Hold: Decide to hold and add your current turn's points to your overall score. It will then be the other player's turn.
If you roll a 1, your current turn's points are lost, and it becomes the other player's turn immediately.
Strategic Choices:

The decision to hold or roll again is crucial. You need to balance the risk and reward.
Rolling again gives you a chance to accumulate more points but also carries the risk of rolling a 1 and losing all your turn's points.
Holding ensures that your current turn's points are added to your total score but leaves the remaining points for your opponent to potentially grab.
Winning the Game: The player who reaches a total of 100 points first is declared the winner. Keep a close eye on your opponent's score and strategize accordingly.

## How many for this project?

session, user, stats storage

registerPlayer(username);

startGame() - Initiates a new game session, setting up initial states like current player, scores, etc.

rollDie(sessionId) - Simulates rolling a die for the current player. Updates the player's turn score unless a 1 is rolled.

hold(sessionId) - Adds the current turn's points to the player's total score and switches the turn to the next player.

getCurrentPlayer(sessionId) - Returns who the current player is.

getSession(sessionId) - Retrieves the session data (round history) & current scores of all players.

## Running the project locally

If you want to test your project locally, you can use the following commands:

```bash
# Starts the replica, running in the background
dfx start --background

# Deploys your canisters to the replica and generates your candid interface
dfx deploy
```

Once the job completes, your application will be available at `http://localhost:4943?canisterId={asset_canister_id}`.

If you have made changes to your backend canister, you can generate a new candid interface with

```bash
npm run generate
```

at any time. This is recommended before starting the frontend development server, and will be run automatically any time you run `dfx deploy`.

If you are making frontend changes, you can start a development server with

```bash
npm start
```

Which will start a server at `http://localhost:8080`, proxying API requests to the replica at port 4943.

### Note on frontend environment variables

If you are hosting frontend code somewhere without using DFX, you may need to make one of the following adjustments to ensure your project does not fetch the root key in production:

- set`DFX_NETWORK` to `ic` if you are using Webpack
- use your own preferred method to replace `process.env.DFX_NETWORK` in the autogenerated declarations
  - Setting `canisters -> {asset_canister_id} -> declarations -> env_override to a string` in `dfx.json` will replace `process.env.DFX_NETWORK` with the string in the autogenerated declarations
- Write your own `createActor` constructor
