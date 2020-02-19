import Debug "mo:stdlib/debug";
import Nat "mo:stdlib/nat";

var i = 20;
var fac = 1;
while (i > 0) {
    fac *= i; i -= 1;
};

Debug.print(Nat.toText(fac))   

