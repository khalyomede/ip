module test

import ip { Ipv6 }

fn test_it_can_parses_compressed_format() {
    assert Ipv6.parse("2001::1") == Ipv6{address: ["2001".hex(), 0, 0, 0, 0, 0, 0, "1".hex()]}
}

fn test_it_can_parses_full_format() {
    assert Ipv6.parse("2001:0db8:85a3:0000:0000:8a2e:0370:7334") == Ipv6{
        address: ["2001".hex(), "db8".hex(), "85a3".hex(), 0, 0, "8a2e".hex(), "370".hex(), "7334".hex()]
    }
}

fn test_it_doesnt_parses_ipv6_with_overflowing_blocks() {
    assert Ipv6.parse("2001:0db8:85a3:0000:0000:8a2e:0370:7334:1234") or { Ipv6{} } == Ipv6{}
}

fn test_it_doesnt_parses_ipv6_with_invalid_hexadecimal_blocks() {
    assert Ipv6.parse("2001:0db8:85a3:0000:0000:8a2e:0370:zzzz") or { Ipv6{} } == Ipv6{}
}

fn test_it_doesnt_parses_ipv6_with_too_many_double_colons() {
    assert Ipv6.parse("2001::85a3::8a2e:0370:7334") or { Ipv6{} } == Ipv6{}
}

fn test_it_doesnt_parses_ipv6_with_too_many_blocks() {
    assert Ipv6.parse("2001:0db8:85a3:0000:0000:8a2e:0370:7334:1234") or { Ipv6{} } == Ipv6{}
}

fn test_it_doesnt_parses_ipv6_with_too_few_blocks() {
    assert Ipv6.parse("2001:0db8:85a3:0000:8a2e:0370") or { Ipv6{} } == Ipv6{}
}

fn test_it_doesnt_parses_ipv6_with_leading_trailing_colon() {
    assert Ipv6.parse("2001:0db8:85a3:0000:0000:8a2e:0370:7334:") or { Ipv6{} } == Ipv6{}
}
