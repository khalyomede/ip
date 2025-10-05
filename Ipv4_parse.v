module ip

pub fn Ipv4.parse(input string) !Ipv4 {
    // Check for empty input
    if input.len == 0 {
        return error('Invalid IPv4: empty string')
    }

    // Split by dots
    octets := input.split('.')

    // Must have exactly 4 octets
    if octets.len != 4 {
        return error('Invalid IPv4: incorrect number of octets')
    }

    mut address := [4]u8{}

    for i, octet in octets {
        // Check for whitespace
        if octet.contains(' ') || octet.trim_space() != octet {
            return error('Invalid IPv4: whitespace in octet')
        }

        // Parse as integer
        value := octet.parse_uint(10, 8) or {
            return error('Invalid IPv4: non-numeric octet')
        }

        // Check range (0-255)
        if value > 255 {
            return error('Invalid IPv4: octet out of range')
        }

        address[i] = u8(value)
    }

    return Ipv4{address: address}
}
