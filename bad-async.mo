actor self { 
    var x : [async ()] = [];

    public func foo() : async () {
        let a : async () = self.bar();
        x := [a];
        await a;
    };

    public func bar() : async () {
        await x[0];
    };
}
