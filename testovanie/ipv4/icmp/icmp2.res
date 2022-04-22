Frame 221: 98 bytes on wire (784 bits), 98 bytes captured (784 bits) on interface wlo1, id 0
    Interface id: 0 (wlo1)
        Interface name: wlo1
    Encapsulation type: Ethernet (1)
    Arrival Time: Apr 22, 2022 18:52:11.262736099 CEST
    [Time shift for this packet: 0.000000000 seconds]
    Epoch Time: 1650646331.262736099 seconds
    [Time delta from previous captured frame: 0.007943688 seconds]
    [Time delta from previous displayed frame: 0.007943688 seconds]
    [Time since reference or first frame: 3.012804203 seconds]
    Frame Number: 221
    Frame Length: 98 bytes (784 bits)
    Capture Length: 98 bytes (784 bits)
    [Frame is marked: False]
    [Frame is ignored: False]
    [Protocols in frame: eth:ethertype:ip:icmp:data]
    [Coloring Rule Name: ICMP]
    [Coloring Rule String: icmp || icmpv6]
Ethernet II, Src: HewlettP_e9:c9:ce (44:31:92:e9:c9:ce), Dst: IntelCor_f2:71:f5 (5c:87:9c:f2:71:f5)
    Destination: IntelCor_f2:71:f5 (5c:87:9c:f2:71:f5)
        Address: IntelCor_f2:71:f5 (5c:87:9c:f2:71:f5)
        .... ..0. .... .... .... .... = LG bit: Globally unique address (factory default)
        .... ...0 .... .... .... .... = IG bit: Individual address (unicast)
    Source: HewlettP_e9:c9:ce (44:31:92:e9:c9:ce)
        Address: HewlettP_e9:c9:ce (44:31:92:e9:c9:ce)
        .... ..0. .... .... .... .... = LG bit: Globally unique address (factory default)
        .... ...0 .... .... .... .... = IG bit: Individual address (unicast)
    Type: IPv4 (0x0800)
Internet Protocol Version 4, Src: 104.22.12.230, Dst: 100.64.199.51
    0100 .... = Version: 4
    .... 0101 = Header Length: 20 bytes (5)
    Differentiated Services Field: 0x00 (DSCP: CS0, ECN: Not-ECT)
        0000 00.. = Differentiated Services Codepoint: Default (0)
        .... ..00 = Explicit Congestion Notification: Not ECN-Capable Transport (0)
    Total Length: 84
    Identification: 0x73f0 (29680)
    Flags: 0x0000
        0... .... .... .... = Reserved bit: Not set
        .0.. .... .... .... = Don't fragment: Not set
        ..0. .... .... .... = More fragments: Not set
    Fragment offset: 0
    Time to live: 57
    Protocol: ICMP (1)
    Header checksum: 0x6d49 [validation disabled]
    [Header checksum status: Unverified]
    Source: 104.22.12.230
    Destination: 100.64.199.51
Internet Control Message Protocol
    Type: 0 (Echo (ping) reply)
    Code: 0
    Checksum: 0x81f9 [correct]
    [Checksum Status: Good]
    Identifier (BE): 8 (0x0008)
    Identifier (LE): 2048 (0x0800)
    Sequence number (BE): 9 (0x0009)
    Sequence number (LE): 2304 (0x0900)
    [Request frame: 220]
    [Response time: 7.944 ms]
    Timestamp from icmp data: Apr 22, 2022 18:52:11.000000000 CEST
    [Timestamp from icmp data (relative): 0.262736099 seconds]
    Data (48 bytes)
        Data: 1de3030000000000101112131415161718191a1b1c1d1e1f…
        [Length: 48]
