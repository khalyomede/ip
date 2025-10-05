module ip

pub fn (ipv6 Ipv6) str() string {
    // Find the longest run of consecutive zeros
    mut max_zero_start := -1
    mut max_zero_len := 0
    mut current_zero_start := -1
    mut current_zero_len := 0

    for i in 0 .. 8 {
        if ipv6.address[i] == 0 {
            if current_zero_start == -1 {
                current_zero_start = i
                current_zero_len = 1
            } else {
                current_zero_len++
            }
        } else {
            if current_zero_len > max_zero_len {
                max_zero_start = current_zero_start
                max_zero_len = current_zero_len
            }
            current_zero_start = -1
            current_zero_len = 0
        }
    }

    // Check if the last run of zeros is the longest
    if current_zero_len > max_zero_len {
        max_zero_start = current_zero_start
        max_zero_len = current_zero_len
    }

    // Build the string
    mut parts := []string{}

    if max_zero_len > 1 {
        // Use :: compression for the longest run
        for i in 0 .. max_zero_start {
            parts << ipv6.address[i].hex()
        }

        // Add :: for the compressed zeros
        if max_zero_start == 0 {
            parts << ''
            parts << ''
        } else if max_zero_start + max_zero_len == 8 {
            parts << ''
        } else {
            parts << ''
        }

        for i in max_zero_start + max_zero_len .. 8 {
            parts << ipv6.address[i].hex()
        }
    } else {
        // No compression needed
        for i in 0 .. 8 {
            parts << ipv6.address[i].hex()
        }
    }

    result := parts.join(':')

    // Handle edge case where result is just ':'
    if result == ':' {
        return '::'
    }

    return result
}
