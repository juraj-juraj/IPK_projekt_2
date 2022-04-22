Frame 2: 138 bytes on wire (1104 bits)
  Interface id: 0 (\Device\NPF_{A2A64C11-5AFC-4C51-8A4B-BF8021D2CBEA})
    Interface name: \Device\NPF_{A2A64C11-5AFC-4C51-8A4B-BF8021D2CBEA}
  Encapsulation type: Ethernet (1)
  Arrival Time: Sep 18, 2015 04:46:01.518619000 CEST
  Time shift for this packet: 0.000000000 seconds
  Epoch Time: 1442544361.518619000 seconds
  Time delta from previous captured frame: 0.000038000 seconds
  Time delta from previous displayed frame: 0.000038000 seconds
  Time since reference or first frame: 0.000038000 seconds
  Frame Number: 2
  Frame Length: 138 bytes (1104 bits)
  Capture Length: 138 bytes (1104 bits)
  Frame is marked: False
  Frame is ignored: False
  Protocols in frame: eth:ethertype:ipv6:udp:lisp
Ethernet II
  Destination: Tp-LinkT_eb:4c:b0 (30:b5:c2:eb:4c:b0)
    Address: Tp-LinkT_eb:4c:b0 (30:b5:c2:eb:4c:b0)
    .... ..0. .... .... .... .... = LG bit: Globally unique address (factory default)
    .... ...0 .... .... .... .... = IG bit: Individual address (unicast)
  Source: PcsCompu_af:f8:3f (08:00:27:af:f8:3f)
    Address: PcsCompu_af:f8:3f (08:00:27:af:f8:3f)
    .... ..0. .... .... .... .... = LG bit: Globally unique address (factory default)
    .... ...0 .... .... .... .... = IG bit: Individual address (unicast)
  Type: IPv6 (0x86dd)
Internet Protocol Version 6
  0110 .... = Version: 6
  .... 0000 0000 .... .... .... .... .... = Traffic Class: 0x00 (DSCP: CS0, ECN: Not-ECT)
    .... 0000 00.. .... .... .... .... .... = Differentiated Services Codepoint: Default (0)
    .... .... ..00 .... .... .... .... .... = Explicit Congestion Notification: Not ECN-Capable Transport (0)
  .... .... .... 0000 0000 0000 0000 0000 = Flow Label: 0x00000
  Payload Length: 84
  Next Header: UDP (17)
  Hop Limit: 255
  Source Address: 2607:f2c0:f00f:b001::face:b00c
  Destination Address: 2001:4f8:3:d::61
User Datagram Protocol
  Source Port: 4342
  Destination Port: 4342
  Length: 84
  Checksum: 0x8f5f
  Checksum Status: Unverified
  Stream index: 0
  Timestamps
    Time since first frame: 0.000038000 seconds
    Time since previous frame: 0.000038000 seconds
  UDP payload (76 bytes)
Locator/ID Separation Protocol
  0011 .... .... .... .... .... = Type: Map-Register (3)
  .... 1... .... .... .... .... = P bit (Proxy-Map-Reply): Set
  .... .0.. .... .... .... .... = S bit (LISP-SEC capable): Not set
  .... ..0. .... .... .... .... = I bit (xTR-ID present): Not set
  .... ...0 .... .... .... .... = R bit (Built for an RTR): Not set
  .... .... 0000 0000 0000 000. = Reserved bits: 0x0000
  .... .... .... .... .... ...1 = M bit (Want-Map-Notify): Set
  Record Count: 1
  Nonce: 0x0000000000000000
  Key ID: 0x0001
  Authentication Data Length: 20
  Authentication Data: c43f24c6e706f9a5bcd09287f416b53e430d58b3
  Mapping Record 1, EID Prefix: 153.16.31.80/28, TTL: 5, Action: No-Action, Authoritative
    Record TTL: 5
    Locator Count: 1
    EID Mask Length: 28
    000. .... .... .... = Action: No-Action (0)
    ...1 .... .... .... = Authoritative bit: Set
    .... .000 0000 0000 = Reserved: 0x000
    0000 .... .... .... = Reserved: 0x0
    .... 0000 0000 0000 = Mapping Version: 0
    EID Prefix AFI: IPv4 (1)
    EID Prefix: 153.16.31.80
    Locator Record 1, Local RLOC: 2607:f2c0:f00f:b001::face:b00c, Reachable, Priority/Weight: 1/100, Multicast Priority/Weight: 255/0
      Priority: 1
      Weight: 100
      Multicast Priority: 255
      Multicast Weight: 0
      Flags: 0x0005
        0000 0000 0000 0... = Reserved: 0x0000
        .... .... .... .1.. = Local: Set
        .... .... .... ..0. = Probe: Not set
        .... .... .... ...1 = Reachable: Set
      AFI: IPv6 (2)
      Locator: 2607:f2c0:f00f:b001::face:b00c
