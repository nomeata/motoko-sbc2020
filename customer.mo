import Debug "mo:stdlib/debug";
import Nat "mo:stdlib/nat";

let my_customer = {
    first_name = "John";
    last_name = "Doe";
    status = #standard;
};

type Customer = {
    first_name : Text;
    last_name : Text;
    status : { #standard; #premium; }
};

func status_report(customer : Customer) : Text {
    var report = "Loyalty status of ";
    report #= full_name(customer);
    report #= ": ";
    switch (customer.status) {
        case (#standard) {
            report #= "standard tier";
        };
        case (#premium) {
            report #= "premium tier";
        };
    };
    return report
};

func full_name({first_name : Text; last_name : Text}) : Text {
    first_name # " " # last_name;
};
