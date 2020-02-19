import Nat "mo:stdlib/nat";

type Customer = {
    first_name : Text;
    last_name : Text;
    status : { #standard; #premium : { until : Nat }; #lifetime }
};

func full_name({first_name : Text; last_name : Text}) : Text {
    first_name # " " # last_name;
};

func status_report(customer : Customer) : Text {
    var report = "Loyality status of ";
    report #= full_name(customer);
    report #= ":\n";
    switch (customer.status) {
        case (#standard) {report #= "standard tier"; };
        case (#premium {until}) {
            report #= "premium  tier (until " # Nat.toText(until) # ")";
        };
        case (#lifetime) { report #= "lifetime tier"; };
    };
    return report
}