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

    public func registerHotel(h : Hotel) {
        hotels := Array.append<Hotel>(hotels, [h]);
    };
    
    public shared{caller} func getRate(location: Text) : async Nat {
        var rates : [Nat] = [];
        // ask all hotels
        for (h in hotels.vals()) {
            rates := Array.append<Nat>(rates, [await h.getRate(location)])
        };
        let rate = Utils.minimum(rates);
        switch (discounts.get(caller)) {
            case null rate;
            case (?d) (rate * (100 - d) / 100);
        }
    };
};
