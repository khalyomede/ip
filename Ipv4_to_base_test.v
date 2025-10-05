module test

import ip { Ipv4 }
import net { Ip }

fn test_it_converts_ipv4_to_ip() {
    address := Ipv4{address: [192, 168, 1, 1]}
    ip := Ip{addr: [192, 168, 1, 1]}

    assert address.to_ip() == ip
}
