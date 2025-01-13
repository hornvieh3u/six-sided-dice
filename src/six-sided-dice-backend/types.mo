import Nat "mo:base/Nat";
import Text "mo:base/Text";

module {
    // id
    public type SessionId = Int;
    public type PlayerId = Int;
    public type PlayerName = Text;

    public type Session = {
        id : SessionId;
    };

    public type Player = {
        id : PlayerId;
        name : PlayerName;
    };
};
