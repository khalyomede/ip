module test

import ip { Ipv4 }

fn test_it_parses_ipv4_address() {
    assert Ipv4.parse("192.168.1.1") or { Ipv4{} } == Ipv4{address: [192, 168, 1, 1]}
}

fn test_it_doesnt_parses_ipv4_overflowed_address() {
    assert Ipv4.parse("256.168.1.1") or { Ipv4{} } == Ipv4{}
}
fn test_it_doesnt_parses_ipv4_underflowed_address() {
    assert Ipv4.parse("192.168.1") or { Ipv4{} } == Ipv4{}
}

fn test_it_doesnt_parses_ipv4_non_numeric_address() {
    assert Ipv4.parse("192.abc.1.1") or { Ipv4{} } == Ipv4{}
}

fn test_it_doesnt_parses_ipv4_empty_address() {
    assert Ipv4.parse("") or { Ipv4{} } == Ipv4{}
}

fn test_it_doesnt_parses_ipv4_address_with_spaces() {
    assert Ipv4.parse("192. 168.1.1") or { Ipv4{} } == Ipv4{}
}
