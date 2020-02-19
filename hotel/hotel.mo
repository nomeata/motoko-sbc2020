actor hotel {
    public func getRate(location : Text) : async Nat {
	    return 110;
    };

    public func registerWith(agencyUrl : Text) {
        let a = actor(agencyUrl) : actor { registerHotel : (actor{}) -> () };
        a.registerHotel(hotel);
    }
};
