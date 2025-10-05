module test

import ip { Ipv6 }

fn test_canonical_and_compressed_formats_are_equivalent() {
    first_address := Ipv6.parse("2001:0db8:85a3:0000:0000:8a2e:0370:7334")
    second_address := Ipv6.parse("2001:db8:85a3::8a2e:370:7334")

    assert first_address == second_address
}
