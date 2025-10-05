# IP

An IP v4 / v6 compatible struct to parse and render IPs.

```v
module main

import khalyomede.ip { Ipv4 }

fn main() {
  address := Ipv4.parse("192.168.1.1") or { Ipv4{} }
}
```

## Summary

- [About](#about)
- [Features](#features)
- [Installation](#installation)
- [Examples](#examples)

## About

This package parses IP v4 / v6 and returns [Ip](https://modules.vlang.io/net.html#Ip) / [Ip6](https://modules.vlang.io/net.html#Ip6) native V structs. It allows to ensure IPs are valid before manipulation.

## Features

- Parses IPv4 and IPv6
- Returns [Ip](https://modules.vlang.io/net.html#Ip) / [Ip6](https://modules.vlang.io/net.html#Ip6) (V lang built-in structs)

## Installation

- [Using V installer](#using-v-installer)

### Using V installer

Run this command in the root of your project:

```bash
v install khalyomede/ip
```

## Examples

- Parsing
  - [Parsing IP v4](#parsing-ip-v4)
  - [Parsing IP v6](#parsing-ip-v6)
- Converting
  - [Converting to Ip](#converting-to-ip)
  - [Converting to Ip6](#converting-to-ip6)
- Casting
  - [Casting Ipv4 to string](#casting-ipv4-to-string)
  - [Casting Ipv6 to string](#casting-ipv6-to-string)
  - [Casting IPv6 to full string](#casting-ipv6-to-full-string)
- Comparison
  - [Comparing two Ipv6](#comparing-two-ipv6)

### Parsing IP v4

```v
module main

import khalyomede.ip { Ipv4 }

fn main() {
  address := Ipv4.parse("8.8.8.8") or { Ipv4{address: [8, 8, 8, 8]} }
}
```

[back to examples](#examples)

### Parsing IP v6

```v
module main

import khalyomede.ip { Ipv6 }

fn main() {
  address := Ipv6.parse("2001:db8:3333:4444:5555:6666:7777:8888") or { Ipv6{} }
}
```

[back to examples](#examples)

### Converting to Ip

```v
module main

import khalyomede.ip { Ipv4 }

fn main() {
  address := Ipv4{}.to_base() // Built-in Ip struct
}
```

[back to examples](#examples)

### Converting to Ip6

```v
module main

import khalyomede.ip { Ipv6 }

fn main() {
  address := Ipv6{}.to_base() // Built-in Ip6 struct
}
```

[back to examples](#examples)

### Casting Ipv4 to string

```v
module main

import khalyomede.ip { Ipv4 }

fn main() {
  address := Ipv4{}

  assert "Address is: ${address}" == "Address is: 0.0.0.0"
}
```

[back to examples](#examples)

### Casting Ipv6 to string

```v
module main

import khalyomede.ip { Ipv6 }

fn main() {
  address := Ipv6{}

  assert "Address is ${address}" == "Address is ::"
}
```

[back to examples](#examples)

### Casting IPv6 to full string

```v
module main

import khalyomede.ip { Ipv6 }

fn main() {
  address := Ipv6.parse("2001:db8::1")

  assert address.to_full_string() == "2001:0db8:0000:0000:0000:0000:0000:0001"
}
```

[back to examples](#examples)

## Comparing two Ipv6

```v
module main

import khalyomede.ip { Ipv6 }

fn main() {
  first_address := Ipv6.parse("2001:db8::1")
  second_address := Ipv6.parse("2001:0db8:0000:0000:0000:0000:0000:0001")

  assert first_address == second_address
}
```

[back to examples](#examples)
