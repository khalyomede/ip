module ip

fn parse_ipv6_block(block string) !u16 {
    if block.len == 0 {
        return error('Invalid IPv6: empty block')
    }
    if block.len > 4 {
        return error('Invalid IPv6: block too long')
    }
    value := block.parse_uint(16, 16) or {
        return error('Invalid IPv6: invalid hexadecimal block')
    }
    return u16(value)
}
