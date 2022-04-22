Frame 733: 66 bytes on wire (528 bits), 66 bytes captured (528 bits) on interface wlo1, id 0
    Interface id: 0 (wlo1)
        Interface name: wlo1
    Encapsulation type: Ethernet (1)
    Arrival Time: Apr 22, 2022 20:57:25.101675228 CEST
    [Time shift for this packet: 0.000000000 seconds]
    Epoch Time: 1650653845.101675228 seconds
    [Time delta from previous captured frame: 0.000020205 seconds]
    [Time delta from previous displayed frame: 0.000020205 seconds]
    [Time since reference or first frame: 10.266593192 seconds]
    Frame Number: 733
    Frame Length: 66 bytes (528 bits)
    Capture Length: 66 bytes (528 bits)
    [Frame is marked: False]
    [Frame is ignored: False]
    [Protocols in frame: eth:ethertype:ip:tcp]
    [Coloring Rule Name: TCP]
    [Coloring Rule String: tcp]
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
Internet Protocol Version 4, Src: 100.64.199.51, Dst: 18.184.0.129
    0100 .... = Version: 4
    .... 0101 = Header Length: 20 bytes (5)
    Differentiated Services Field: 0x00 (DSCP: CS0, ECN: Not-ECT)
        0000 00.. = Differentiated Services Codepoint: Default (0)
        .... ..00 = Explicit Congestion Notification: Not ECN-Capable Transport (0)
    Total Length: 52
    Identification: 0xbdff (48639)
    Flags: 0x4000, Don't fragment
        0... .... .... .... = Reserved bit: Not set
        .1.. .... .... .... = Don't fragment: Set
        ..0. .... .... .... = More fragments: Not set
    Fragment offset: 0
    Time to live: 64
    Protocol: TCP (6)
    Header checksum: 0x3e18 [validation disabled]
    [Header checksum status: Unverified]
    Source: 100.64.199.51
    Destination: 18.184.0.129
Transmission Control Protocol, Src Port: 43058, Dst Port: 443, Seq: 37, Ack: 33, Len: 0
    Source Port: 43058
    Destination Port: 443
    [Stream index: 24]
    [TCP Segment Len: 0]
    Sequence number: 37    (relative sequence number)
    Sequence number (raw): 345144025
    [Next sequence number: 37    (relative sequence number)]
    Acknowledgment number: 33    (relative ack number)
    Acknowledgment number (raw): 3873966775
    1000 .... = Header Length: 32 bytes (8)
    Flags: 0x010 (ACK)
        000. .... .... = Reserved: Not set
        ...0 .... .... = Nonce: Not set
        .... 0... .... = Congestion Window Reduced (CWR): Not set
        .... .0.. .... = ECN-Echo: Not set
        .... ..0. .... = Urgent: Not set
        .... ...1 .... = Acknowledgment: Set
        .... .... 0... = Push: Not set
        .... .... .0.. = Reset: Not set
        .... .... ..0. = Syn: Not set
        .... .... ...0 = Fin: Not set
        [TCP Flags: ·······A····]
    Window size value: 501
    [Calculated window size: 501]
    [Window size scaling factor: -1 (unknown)]
    Checksum: 0x3ed3 [unverified]
    [Checksum Status: Unverified]
    Urgent pointer: 0
    Options: (12 bytes), No-Operation (NOP), No-Operation (NOP), Timestamps
        TCP Option - No-Operation (NOP)
            Kind: No-Operation (1)
        TCP Option - No-Operation (NOP)
            Kind: No-Operation (1)
        TCP Option - Timestamps: TSval 1818929676, TSecr 1322012211
            Kind: Time Stamp Option (8)
            Length: 10
            Timestamp value: 1818929676
            Timestamp echo reply: 1322012211
    [SEQ/ACK analysis]
        [This is an ACK to the segment in frame: 732]
        [The RTT to ACK the segment was: 0.000020205 seconds]
    [Timestamps]
        [Time since first frame in this TCP stream: 0.028289358 seconds]
        [Time since previous frame in this TCP stream: 0.000020205 seconds]
