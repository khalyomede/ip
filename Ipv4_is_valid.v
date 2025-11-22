module ip

pub fn Ipv4.is_valid(address string) bool {
    Ipv4.parse(address) or {
        return false
    }

    return true
}
