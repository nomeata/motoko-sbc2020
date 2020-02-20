actor canister { 
    public func getNat() : async Nat { 0 };

    var x : [async Nat] = [];

    public func foo() : async Nat {
        let a : async Nat = canister.getNat();
        x := [a];
        let r = await a;
        return r + 1;
     };

    public func bar() : async Nat {
        let r = await x[0];
        return r + 2;
    };
}
