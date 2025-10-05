module test

import ip { Ipv6 }

fn test_it_converts_uninitialized_ipv6_to_string() {
    assert Ipv6{}.str() == "::"
}

fn test_it_convert_initialized_ipv6_to_string() {
    actual := Ipv6{address: [u16(0x2001), u16(0xdb8), u16(0x85a3), 0, 0, u16(0x8a2e), u16(0x370), u16(0x7334)]!}.str()
    expected := "2001:db8:85a3::8a2e:370:7334"

    assert actual == expected
}

fn test_it_converts_initialized_ipv6_with_several_empty_blocks_to_string() {
    actual := Ipv6{address: [u16(0x2001), 0, 0, 0, 0, 0, u16(0x1), u16(0x1)]!}.str()
    expected := "2001::1:1"

    assert actual == expected
}
