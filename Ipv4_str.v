module ip

pub fn (ipv4 Ipv4) str() string {
    return '${ipv4.address[0]}.${ipv4.address[1]}.${ipv4.address[2]}.${ipv4.address[3]}'
}
