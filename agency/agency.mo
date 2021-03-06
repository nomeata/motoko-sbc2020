import Prim "mo:prim";
import Array "mo:stdlib/array";
import Nat "mo:stdlib/nat";
import Principal "mo:stdlib/principalId";
import TrieMap "mo:stdlib/trieMap";
import Utils "utils";

actor TravelAgency {

    type Hotel = actor { getRate: (location : Text) -> async Nat };

    var hotels : [Hotel] = [];

    var discounts : TrieMap.TrieMap<Principal,Nat> = Utils.emptyMap();

    public func registerHotel(h : Hotel) : async Nat {
        hotels := Array.append<Hotel>(hotels, [h]);
        return hotels.len();
    };
    
    public shared(msg) func getBestRate(location: Text) : async Nat {
        var rates : [Nat] = [];
        // ask all hotels
        for (h in hotels.vals()) {
            let rate = await h.getRate(location);
            rates := Array.append<Nat>(rates, [rate]);
        };
        let rate = Utils.minimum(rates);
        switch (discounts.get(msg.caller)) {
            case null { return rate; };
            case (?d) { return (rate * (100 - d) / 100); };
        };
    };
};
