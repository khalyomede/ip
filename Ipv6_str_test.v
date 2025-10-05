module test

import ip { Ipv6 }

fn test_it_converts_uninitialized_ipv6_to_string() {
    assert Ipv6{}.str() == "::"
}

fn test_it_convert_initialized_ipv6_to_string() {
    assert Ipv6{address: ["2001".hex(), "db8".hex(), "85a3".hex(), "0".hex(), "8a2e".hex(), "370".hex(), "7334".hex()]}.str() == "2001:db8:85a3::8a2e:370:7334"
}

fn test_it_converts_initialized_ipv6_with_several_empty_blocks_to_string() {
    assert Ipv6{address: ["2001".hex(), "0".hex(), "0".hex(), "0".hex(), "0".hex(), "0".hex(), "1".hex(), "1".hex()]}.str() == "2001::1:1"
}
