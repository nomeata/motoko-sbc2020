import Prim "mo:prim";
import Array "mo:stdlib/array";
import Nat "mo:stdlib/nat";
import Principal "mo:stdlib/principalId";
import TrieMap "mo:stdlib/trieMap";


module {
    public func emptyMap() : TrieMap.TrieMap<Principal,Nat> {
        TrieMap.TrieMap<Principal,Nat>(func (x,y) { x == y }, Principal.hash);
    };

    public func minimum (xs : [Nat]) : Nat {
        Array.foldl<Nat, Nat>(Nat.min, xs[0], xs);
    };

    public func push (xs : [Nat], x : Nat) : [Nat] {
        Array.append<Nat>(xs, [x]);
    };
}