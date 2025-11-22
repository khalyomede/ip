module test

import ip { Ipv4 }

import khalyomede.expect { expect }
import khalyomede.faker { Faker }

fn test_it_returns_true_when_ipv4_is_valid() {
    mut fake := Faker{}

    address := fake.ip_v4()

    expect(Ipv4.is_valid(address)).to_be_true()
}

fn test_it_returns_false_when_ipv4_is_invalid() {
    mut fake := Faker{}

    address := fake.ip_v6()

    expect(Ipv4.is_valid(address)).to_be_false()
}
