Frame 855: 78 bytes on wire (624 bits), 78 bytes captured (624 bits) on interface wlo1, id 0
    Interface id: 0 (wlo1)
        Interface name: wlo1
    Encapsulation type: Ethernet (1)
    Arrival Time: Apr 24, 2022 22:36:52.230921353 CEST
    [Time shift for this packet: 0.000000000 seconds]
    Epoch Time: 1650832612.230921353 seconds
    [Time delta from previous captured frame: 0.000032204 seconds]
    [Time delta from previous displayed frame: 0.000032204 seconds]
    [Time since reference or first frame: 5.521572186 seconds]
    Frame Number: 855
    Frame Length: 78 bytes (624 bits)
    Capture Length: 78 bytes (624 bits)
    [Frame is marked: False]
    [Frame is ignored: False]
    [Protocols in frame: eth:ethertype:ip:tcp]
    [Coloring Rule Name: Bad TCP]
    [Coloring Rule String: tcp.analysis.flags && !tcp.analysis.window_update]
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
Internet Protocol Version 4, Src: 100.64.199.51, Dst: 18.158.74.223
    0100 .... = Version: 4
    .... 0101 = Header Length: 20 bytes (5)
    Differentiated Services Field: 0x00 (DSCP: CS0, ECN: Not-ECT)
        0000 00.. = Differentiated Services Codepoint: Default (0)
        .... ..00 = Explicit Congestion Notification: Not ECN-Capable Transport (0)
    Total Length: 64
    Identification: 0xf165 (61797)
    Flags: 0x4000, Don't fragment
        0... .... .... .... = Reserved bit: Not set
        .1.. .... .... .... = Don't fragment: Set
        ..0. .... .... .... = More fragments: Not set
    Fragment offset: 0
    Time to live: 64
    Protocol: TCP (6)
    Header checksum: 0xc061 [validation disabled]
    [Header checksum status: Unverified]
    Source: 100.64.199.51
    Destination: 18.158.74.223
Transmission Control Protocol, Src Port: 50106, Dst Port: 443, Seq: 37, Ack: 33, Len: 0
    Source Port: 50106
    Destination Port: 443
    [Stream index: 12]
    [TCP Segment Len: 0]
    Sequence number: 37    (relative sequence number)
    Sequence number (raw): 1703928678
    [Next sequence number: 37    (relative sequence number)]
    Acknowledgment number: 33    (relative ack number)
    Acknowledgment number (raw): 3840758
    1011 .... = Header Length: 44 bytes (11)
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
    Checksum: 0x8923 [unverified]
    [Checksum Status: Unverified]
    Urgent pointer: 0
    Options: (24 bytes), No-Operation (NOP), No-Operation (NOP), Timestamps, No-Operation (NOP), No-Operation (NOP), SACK
        TCP Option - No-Operation (NOP)
            Kind: No-Operation (1)
        TCP Option - No-Operation (NOP)
            Kind: No-Operation (1)
        TCP Option - Timestamps: TSval 825489540, TSecr 4097093178
            Kind: Time Stamp Option (8)
            Length: 10
            Timestamp value: 825489540
            Timestamp echo reply: 4097093178
        TCP Option - No-Operation (NOP)
            Kind: No-Operation (1)
        TCP Option - No-Operation (NOP)
            Kind: No-Operation (1)
        TCP Option - SACK 1-33
            Kind: SACK (5)
            Length: 10
            left edge = 1 (relative)
            right edge = 33 (relative)
            [TCP SACK Count: 1]
    [SEQ/ACK analysis]
        [This is an ACK to the segment in frame: 854]
        [The RTT to ACK the segment was: 0.000032204 seconds]
        [TCP Analysis Flags]
            [This is a TCP duplicate ack]
        [Duplicate ACK #: 1]
        [Duplicate to the ACK in frame: 777]
            [Expert Info (Note/Sequence): Duplicate ACK (#1)]
                [Duplicate ACK (#1)]
                [Severity level: Note]
                [Group: Sequence]
    [Timestamps]
        [Time since first frame in this TCP stream: 0.430909103 seconds]
        [Time since previous frame in this TCP stream: 0.000032204 seconds]
