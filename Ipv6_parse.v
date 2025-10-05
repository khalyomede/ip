module ip

pub fn Ipv6.parse(input string) !Ipv6 {
    // Check for empty input
    if input.len == 0 {
        return error('Invalid IPv6: empty string')
    }

    // Check for leading or trailing single colon (except ::)
    if (input.starts_with(':') && !input.starts_with('::')) ||
       (input.ends_with(':') && !input.ends_with('::')) {
        return error('Invalid IPv6: improper colon placement')
    }

    // Count occurrences of :: to ensure there's at most one
    double_colon_count := input.count('::')
    if double_colon_count > 1 {
        return error('Invalid IPv6: multiple :: found')
    }

    mut address := [8]u16{}
    has_double_colon := double_colon_count == 1

    if has_double_colon {
        // Split by :: to get left and right parts
        parts := input.split('::')
        if parts.len != 2 {
            return error('Invalid IPv6: malformed :: usage')
        }

        left_part := parts[0]
        right_part := parts[1]

        // Parse left and right segments using helper function
        left_segments := parse_ipv6_blocks(left_part)!
        right_segments := parse_ipv6_blocks(right_part)!

        // Check total segments don't exceed 8
        total_segments := left_segments.len + right_segments.len
        if total_segments >= 8 {
            return error('Invalid IPv6: too many blocks')
        }

        // Fill address array
        mut index := 0
        for segment in left_segments {
            address[index] = segment
            index++
        }

        // Fill zeros in the middle
        zeros_count := 8 - total_segments
        for _ in 0 .. zeros_count {
            address[index] = 0
            index++
        }

        // Fill right segments
        for segment in right_segments {
            address[index] = segment
            index++
        }
    } else {
        // No :: compression, parse normally
        blocks := input.split(':')

        // Must have exactly 8 blocks
        if blocks.len != 8 {
            return error('Invalid IPv6: incorrect number of blocks')
        }

        for i, block in blocks {
            address[i] = parse_ipv6_block(block)!
        }
    }

    return Ipv6{address: address}
}
