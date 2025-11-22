module ip

pub fn Address.parse(address string) !Address {
    if Ipv6.is_valid(address) {
        ipv6 := Ipv6.parse(address)!

        return Address(ipv6)
    }

    ipv4 := Ipv4.parse(address)!

    return Address(ipv4)
}
