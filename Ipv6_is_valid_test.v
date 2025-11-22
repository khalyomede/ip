module test

import khalyomede.expect { expect }
import khalyomede.faker { Faker }
import ip { Ipv6 }

fn test_it_returns_true_when_ipv6_is_valid() {
    mut fake := Faker{}

    address := fake.ip_v6()

    expect(Ipv6.is_valid(address)).to_be_true()
}

fn test_it_returns_false_when_ipv6_is_invalid() {
    mut fake := Faker{}

    address := fake.ip_v4()

    expect(Ipv6.is_valid(address)).to_be_false()
}
