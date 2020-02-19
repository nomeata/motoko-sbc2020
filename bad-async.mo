actor a { 
    public func getNat() : async Nat { 0 };

    var x : async Nat = loop{};
    public func foo1() { x := a.getNat() };
    public func foo2() : async Nat { 10 + (await x) };
}
