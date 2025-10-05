module test

import ip { Ipv4 }

fn test_it_converts_uninitialized_ipv4_to_string() {
    assert Ipv4{}.str() == "0.0.0.0"
}

fn test_it_convert_initialized_ipv4_to_string() {
    assert Ipv4{address: [192, 168, 1, 1]}.str() == "192.168.1.1"
}
