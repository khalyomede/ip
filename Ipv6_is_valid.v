module ip

pub fn Ipv6.is_valid(address string) bool {
    Ipv6.parse(address) or {
        return false
    }

    return true
}
