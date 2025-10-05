module ip

fn parse_ipv6_blocks(part string) ![]u16 {
    if part.len == 0 {
        return []u16{}
    }

    blocks := part.split(':')
    mut segments := []u16{}

    for block in blocks {
        segment := parse_ipv6_block(block)!
        segments << segment
    }

    return segments
}
