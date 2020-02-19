actor canister { 
    public func getNat() : async Nat { 0 };

    var x : [async Nat] = [];

    public func foo1() : async Nat {
        let a = canister.getNat();
        x := [a];
        let r = await a;
        return r + 1;
     };

    public func foo2() : async Nat {
        let r = await x[0];
        return r + 2;
    };
}
