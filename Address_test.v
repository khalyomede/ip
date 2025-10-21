module test

import ip { Address, Ipv4, Ipv6 }

fn test_it_can_match_against_an_address() {
    address := Address(Ipv4{address: [u8(192), 168, 1, 1]!})
    result := match address {
        Ipv4 { address.str() }
        Ipv6 { address.to_full_string() }
    }

    assert result == "192.168.1.1"
}
