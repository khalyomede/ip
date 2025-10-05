module ip

pub fn (ipv6 Ipv6) to_full_string() string {
    mut parts := []string{}

    for i in 0 .. 8 {
        // Convert to hex and pad to 4 characters with leading zeros
        hex_value := ipv6.address[i].hex()
        padded := '0'.repeat(4 - hex_value.len) + hex_value
        parts << padded
    }

    return parts.join(':')
}
