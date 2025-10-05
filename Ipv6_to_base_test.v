module test

import ip { Ipv6 }
import net { Ip6 }

fn test_it_converts_canonical_ipv6_to_ip6_struct() {
    address := Ipv6.parse("2001:0db8:85a3:0000:0000:8a2e:0370:7334")
    expected := Ip6{
        addr: [u8(0x20), 0x01, 0x0d, 0xb8, 0x85, 0xa3, 0x00, 0x00, 0x00, 0x00, 0x8a, 0x2e, 0x03, 0x70, 0x73, 0x34]
    }

    assert address.to_base() == expected
}

fn test_it_converts_compressed_ipv6_to_ip6_struct() {
    address := Ipv6.parse("2001:db8::1")
    expected := Ip6{
        addr: [u8(0x20), 0x01, 0x0d, 0xb8, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01]
    }

    assert address.to_ip6() == expected
}

fn test_it_converts_uninitialized_ipv6_to_ip6_struct() {
    address := Ipv6{}
    expected := Ip6{
        addr: [u8(0), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
    }

    assert address.to_ip6() == expected
}
