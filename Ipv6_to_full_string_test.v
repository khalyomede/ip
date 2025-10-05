module test

import ip { Ipv6 }

fn test_it_converts_canonical_format_to_full_string() {
    actual := Ipv6.parse("2001:db8:3333:4444:5555:6666:7777:8888") or { Ipv6{} }
    expected := "2001:0db8:3333:4444:5555:6666:7777:8888"

    assert actual.to_full_string() == expected
}

fn test_it_converts_compressed_format_to_full_string() {
    actual := Ipv6.parse("2001:db8::1") or { Ipv6{} }
    expected := "2001:0db8:0000:0000:0000:0000:0000:0001"

    assert actual.to_full_string() == expected
}
