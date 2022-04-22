Frame 1: 620 bytes on wire (4960 bits)
  Encapsulation type: Ethernet (1)
  Arrival Time: Apr 22, 2022 20:34:42.000000000 CEST
  Time shift for this packet: 0.000000000 seconds
  Epoch Time: 1650652482.000000000 seconds
  Time delta from previous captured frame: 0.000000000 seconds
  Time delta from previous displayed frame: 0.000000000 seconds
  Time since reference or first frame: 0.000000000 seconds
  Frame Number: 1
  Frame Length: 620 bytes (4960 bits)
  Capture Length: 620 bytes (4960 bits)
  Frame is marked: False
  Frame is ignored: False
  Protocols in frame: eth:ethertype:ipv6:udp:data
Ethernet II
  Destination: Broadcast (ff:ff:ff:ff:ff:ff)
    Address: Broadcast (ff:ff:ff:ff:ff:ff)
    .... ..1. .... .... .... .... = LG bit: Locally administered address (this is NOT the factory default)
    .... ...1 .... .... .... .... = IG bit: Group address (multicast/broadcast)
  Source: Private_01:01:01 (01:01:01:01:01:01)
    Expert Info (Warning/Protocol): Source MAC must not be a group address: IEEE 802.3-2002, Section 3.2.3(b)
      Source MAC must not be a group address: IEEE 802.3-2002, Section 3.2.3(b)
      Severity level: Warning
      Group: Protocol
    Address: Private_01:01:01 (01:01:01:01:01:01)
    .... ..0. .... .... .... .... = LG bit: Globally unique address (factory default)
    .... ...1 .... .... .... .... = IG bit: Group address (multicast/broadcast)
  Type: IPv6 (0x86dd)
Internet Protocol Version 6
  0110 .... = Version: 6
  .... 0000 1110 .... .... .... .... .... = Traffic Class: 0x0e (DSCP: Unknown, ECN: ECT(0))
    .... 0000 11.. .... .... .... .... .... = Differentiated Services Codepoint: Unknown (3)
    .... .... ..10 .... .... .... .... .... = Explicit Congestion Notification: ECN-Capable Transport codepoint '10' (2)
  .... .... .... 1101 0100 1011 0101 1111 = Flow Label: 0xd4b5f
  Payload Length: 22836
    Expert Info (Warning/Protocol): IPv6 payload length exceeds framing length (566 bytes)
      IPv6 payload length exceeds framing length (566 bytes)
      Severity level: Warning
      Group: Protocol
  Next Header: UDP (17)
  Hop Limit: 86
  Source Address: b277:2978:2573:1d:cf52:50f:ae84:dbcd
  Destination Address: 9bf3:9958:c4e9:f16a:163e:71be:b6f5:adfb
User Datagram Protocol
  Source Port: 42961
  Destination Port: 33860
  Length: 17373 (bogus, payload length 566)
    Expert Info (Error/Malformed): Bad length value 17373 &gt; IP payload length
      Bad length value 17373 &gt; IP payload length
      Severity level: Error
      Group: Malformed
  Checksum: 0x1e2b
  Checksum Status: Unverified
  Stream index: 0
  Timestamps
    Time since first frame: 0.000000000 seconds
    Time since previous frame: 0.000000000 seconds
  UDP payload (558 bytes)
