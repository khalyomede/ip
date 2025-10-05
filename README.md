# IP

IP v4 / v6 structs to parse and render IPs.

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

This package parses IP v4 / v6 and ensures IPs are valid before manipulation.

## Features

- Parses IPv4 and IPv6
- Returns error if IP v4/v6 are invalid during parse
- Can be cast to string and canonical format ("full format" for IP v6)

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
  address := Ipv4.parse("8.8.8.8") or { Ipv4{address: [u8(8), 8, 8, 8]!} }
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

### Casting Ipv4 to string

```v
module main

import khalyomede.ip { Ipv4 }

fn main() {
  address := Ipv4{}

  assert "${address}" == "0.0.0.0"
}
```

[back to examples](#examples)

### Casting Ipv6 to string

```v
module main

import khalyomede.ip { Ipv6 }

fn main() {
  address := Ipv6{}

  assert "${address}" == "::"
}
```

[back to examples](#examples)

### Casting IPv6 to full string

```v
module main

import khalyomede.ip { Ipv6 }

fn main() {
  address := Ipv6.parse("2001:db8::1") or { Ipv6{} }

  assert address.to_full_string() == "2001:0db8:0000:0000:0000:0000:0000:0001"
}
```

[back to examples](#examples)

### Comparing two Ipv6

```v
module main

import khalyomede.ip { Ipv6 }

fn main() {
  first_address := Ipv6.parse("2001:db8::1") or { Ipv6{} }
  second_address := Ipv6.parse("2001:0db8:0000:0000:0000:0000:0000:0001") or { Ipv6{} }

  assert first_address == second_address
}
```

[back to examples](#examples)
