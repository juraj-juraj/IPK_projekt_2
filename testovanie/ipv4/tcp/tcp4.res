Frame 372: 54 bytes on wire (432 bits), 54 bytes captured (432 bits) on interface wlo1, id 0
    Interface id: 0 (wlo1)
        Interface name: wlo1
    Encapsulation type: Ethernet (1)
    Arrival Time: Apr 24, 2022 22:36:48.540201174 CEST
    [Time shift for this packet: 0.000000000 seconds]
    Epoch Time: 1650832608.540201174 seconds
    [Time delta from previous captured frame: 0.000039652 seconds]
    [Time delta from previous displayed frame: 0.000039652 seconds]
    [Time since reference or first frame: 1.830852007 seconds]
    Frame Number: 372
    Frame Length: 54 bytes (432 bits)
    Capture Length: 54 bytes (432 bits)
    [Frame is marked: False]
    [Frame is ignored: False]
    [Protocols in frame: eth:ethertype:ip:tcp]
    [Coloring Rule Name: TCP RST]
    [Coloring Rule String: tcp.flags.reset eq 1]
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
Internet Protocol Version 4, Src: 100.64.199.51, Dst: 37.157.6.245
    0100 .... = Version: 4
    .... 0101 = Header Length: 20 bytes (5)
    Differentiated Services Field: 0x00 (DSCP: CS0, ECN: Not-ECT)
        0000 00.. = Differentiated Services Codepoint: Default (0)
        .... ..00 = Explicit Congestion Notification: Not ECN-Capable Transport (0)
    Total Length: 40
    Identification: 0x0000 (0)
    Flags: 0x4000, Don't fragment
        0... .... .... .... = Reserved bit: Not set
        .1.. .... .... .... = Don't fragment: Set
        ..0. .... .... .... = More fragments: Not set
    Fragment offset: 0
    Time to live: 64
    Protocol: TCP (6)
    Header checksum: 0xe2ca [validation disabled]
    [Header checksum status: Unverified]
    Source: 100.64.199.51
    Destination: 37.157.6.245
Transmission Control Protocol, Src Port: 48260, Dst Port: 443, Seq: 1, Len: 0
    Source Port: 48260
    Destination Port: 443
    [Stream index: 6]
    [TCP Segment Len: 0]
    Sequence number: 1    (relative sequence number)
    Sequence number (raw): 451180041
    [Next sequence number: 1    (relative sequence number)]
    Acknowledgment number: 0
    Acknowledgment number (raw): 0
    0101 .... = Header Length: 20 bytes (5)
    Flags: 0x004 (RST)
        000. .... .... = Reserved: Not set
        ...0 .... .... = Nonce: Not set
        .... 0... .... = Congestion Window Reduced (CWR): Not set
        .... .0.. .... = ECN-Echo: Not set
        .... ..0. .... = Urgent: Not set
        .... ...0 .... = Acknowledgment: Not set
        .... .... 0... = Push: Not set
        .... .... .1.. = Reset: Set
            [Expert Info (Warning/Sequence): Connection reset (RST)]
                [Connection reset (RST)]
                [Severity level: Warning]
                [Group: Sequence]
        .... .... ..0. = Syn: Not set
        .... .... ...0 = Fin: Not set
        [TCP Flags: ·········R··]
    Window size value: 0
    [Calculated window size: 0]
    [Window size scaling factor: -1 (unknown)]
    Checksum: 0x08ae [unverified]
    [Checksum Status: Unverified]
    Urgent pointer: 0
    [Timestamps]
        [Time since first frame in this TCP stream: 0.001242026 seconds]
        [Time since previous frame in this TCP stream: 0.000039652 seconds]
