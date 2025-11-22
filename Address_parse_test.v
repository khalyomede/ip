module test

import khalyomede.expect { expect }
import khalyomede.faker { Faker }
import ip { Address, Ipv4, Ipv6 }

fn test_it_can_parse_ipv4_address() {
    mut fake := Faker{}

    expected := fake.ip_v4()

    address := Address.parse(expected)!

    actual := match address {
        Ipv4 { address.str() }
        Ipv6 { '' }
    }

    expect(actual).to_be_equal_to(expected)
}

fn test_it_can_parse_ipv6_address() {
    mut fake := Faker{}

    expected := fake.ip_v6()

    address := Address.parse(expected)!

    actual := match address {
        Ipv4 { '' }
        Ipv6 { address.to_full_string() }
    }

    expect(actual).to_be_equal_to(expected)
}
