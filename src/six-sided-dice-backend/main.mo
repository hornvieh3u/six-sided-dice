import Nat "mo:base/Nat";
import Int "mo:base/Int";

import StableRbTree "plugins/StableRBTree";
import Consts "consts";
import Types "types";

actor SixSidedDice {
  stable var Sessions = StableRbTree.init<Types.SessionId, [Types.Session]>();
  stable var Players = StableRbTree.init<Types.PlayerName, Types.Player>();

  public query func greet(name : Text) : async Text {
    return "Hello, " # name # "!";
  };

  public func registerPlayer(name : Types.PlayerName) : async Bool {
    return true;
  };

  public func startGame() : async () {

  };

  public func rollDie(sessionId : Types.SessionId) : async Nat {
    return 0;
  };

  public func hold(sessionId : Types.SessionId) : async () {

  };

  public func getCurrentPlayers(sessionId : Types.SessionId) : async () {

  };

  public func getSession(sessionId : Types.SessionId) : async ?[Types.Session] {
    StableRbTree.get(Sessions, Int.compare, sessionId);
  };
};
