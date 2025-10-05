module test

import ip { Ipv6 }

fn test_it_can_parses_compressed_format() {
    actual := Ipv6.parse("2001::1") or { Ipv6{} }
    expected := Ipv6{address: [u16(0x2001), 0, 0, 0, 0, 0, 0, u16(0x1)]!}

    assert actual == expected
}

fn test_it_can_parses_full_format() {
    actual := Ipv6.parse("2001:0db8:85a3:0000:0000:8a2e:0370:7334") or { Ipv6{} }
    expected := Ipv6{
        address: [u16(0x2001), u16(0xdb8), u16(0x85a3), 0, 0, u16(0x8a2e), u16(0x370), u16(0x7334)]!
    }

    assert actual == expected
}

fn test_canonical_and_compressed_formats_are_equivalent() {
    first_address := Ipv6.parse("2001:0db8:85a3:0000:0000:8a2e:0370:7334")!
    second_address := Ipv6.parse("2001:db8:85a3::8a2e:370:7334")!

    assert first_address == second_address
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
