Frame 153: 98 bytes on wire (784 bits), 98 bytes captured (784 bits) on interface wlo1, id 0
    Interface id: 0 (wlo1)
        Interface name: wlo1
    Encapsulation type: Ethernet (1)
    Arrival Time: Apr 22, 2022 18:52:10.253216883 CEST
    [Time shift for this packet: 0.000000000 seconds]
    Epoch Time: 1650646330.253216883 seconds
    [Time delta from previous captured frame: 0.000040522 seconds]
    [Time delta from previous displayed frame: 0.996292966 seconds]
    [Time since reference or first frame: 2.003284987 seconds]
    Frame Number: 153
    Frame Length: 98 bytes (784 bits)
    Capture Length: 98 bytes (784 bits)
    [Frame is marked: False]
    [Frame is ignored: False]
    [Protocols in frame: eth:ethertype:ip:icmp:data]
    [Coloring Rule Name: ICMP]
    [Coloring Rule String: icmp || icmpv6]
Ethernet II, Src: IntelCor_f2:71:f5 (5c:87:9c:f2:71:f5), Dst: ArubaaHe_06:87:10 (00:1a:1e:06:87:10)
    Destination: ArubaaHe_06:87:10 (00:1a:1e:06:87:10)
        Address: ArubaaHe_06:87:10 (00:1a:1e:06:87:10)
        .... ..0. .... .... .... .... = LG bit: Globally unique address (factory default)
        .... ...0 .... .... .... .... = IG bit: Individual address (unicast)
    Source: IntelCor_f2:71:f5 (5c:87:9c:f2:71:f5)
        Address: IntelCor_f2:71:f5 (5c:87:9c:f2:71:f5)
        .... ..0. .... .... .... .... = LG bit: Globally unique address (factory default)
        .... ...0 .... .... .... .... = IG bit: Individual address (unicast)
    Type: IPv4 (0x0800)
Internet Protocol Version 4, Src: 100.64.199.51, Dst: 104.22.12.230
    0100 .... = Version: 4
    .... 0101 = Header Length: 20 bytes (5)
    Differentiated Services Field: 0x00 (DSCP: CS0, ECN: Not-ECT)
        0000 00.. = Differentiated Services Codepoint: Default (0)
        .... ..00 = Explicit Congestion Notification: Not ECN-Capable Transport (0)
    Total Length: 84
    Identification: 0x9c5a (40026)
    Flags: 0x4000, Don't fragment
        0... .... .... .... = Reserved bit: Not set
        .1.. .... .... .... = Don't fragment: Set
        ..0. .... .... .... = More fragments: Not set
    Fragment offset: 0
    Time to live: 64
    Protocol: ICMP (1)
    Header checksum: 0xfdde [validation disabled]
    [Header checksum status: Unverified]
    Source: 100.64.199.51
    Destination: 104.22.12.230
Internet Control Message Protocol
    Type: 8 (Echo (ping) request)
    Code: 0
    Checksum: 0x9b00 [correct]
    [Checksum Status: Good]
    Identifier (BE): 8 (0x0008)
    Identifier (LE): 2048 (0x0800)
    Sequence number (BE): 8 (0x0008)
    Sequence number (LE): 2048 (0x0800)
    [Response frame: 157]
    Timestamp from icmp data: Apr 22, 2022 18:52:10.000000000 CEST
    [Timestamp from icmp data (relative): 0.253216883 seconds]
    Data (48 bytes)
        Data: fddc030000000000101112131415161718191a1b1c1d1e1f…
        [Length: 48]
