actor hotel {
    var rate = 100;

    public func setRate(newRate : Nat) {
	    rate := newRate;
    };


    public func getRate(location : Text) : async Nat {
	    return rate;
    };

    public func registerWith(agencyUrl : Text) {
        let a = actor(agencyUrl) : actor { registerHotel : (actor{}) -> () };
        a.registerHotel(hotel);
    }
};
