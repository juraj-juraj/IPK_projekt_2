Frame 202: 1964 bytes on wire (15712 bits), 1964 bytes captured (15712 bits) on interface /tmp/wireshark_extcap_randpkt_20220419224308_nrrqX1, id 0
    Interface id: 0 (/tmp/wireshark_extcap_randpkt_20220419224308_nrrqX1)
        Interface name: /tmp/wireshark_extcap_randpkt_20220419224308_nrrqX1
    Encapsulation type: Ethernet (1)
    Arrival Time: Jan  1, 1970 01:03:21.000000000 CET
    [Time shift for this packet: 0.000000000 seconds]
    Epoch Time: 201.000000000 seconds
    [Time delta from previous captured frame: 1.000000000 seconds]
    [Time delta from previous displayed frame: 0.000000000 seconds]
    [Time since reference or first frame: 201.000000000 seconds]
    Frame Number: 202
    Frame Length: 1964 bytes (15712 bits)
    Capture Length: 1964 bytes (15712 bits)
    [Frame is marked: False]
    [Frame is ignored: False]
    [Protocols in frame: eth:ethertype:ipv6:tcp]
    [Coloring Rule Name: TCP RST]
    [Coloring Rule String: tcp.flags.reset eq 1]
Ethernet II, Src: Private_01:01:01 (01:01:01:01:01:01), Dst: Broadcast (ff:ff:ff:ff:ff:ff)
    Destination: Broadcast (ff:ff:ff:ff:ff:ff)
        Address: Broadcast (ff:ff:ff:ff:ff:ff)
        .... ..1. .... .... .... .... = LG bit: Locally administered address (this is NOT the factory default)
        .... ...1 .... .... .... .... = IG bit: Group address (multicast/broadcast)
    Source: Private_01:01:01 (01:01:01:01:01:01)
        [Expert Info (Warning/Protocol): Source MAC must not be a group address: IEEE 802.3-2002, Section 3.2.3(b)]
            [Source MAC must not be a group address: IEEE 802.3-2002, Section 3.2.3(b)]
            [Severity level: Warning]
            [Group: Protocol]
        Address: Private_01:01:01 (01:01:01:01:01:01)
        .... ..0. .... .... .... .... = LG bit: Globally unique address (factory default)
        .... ...1 .... .... .... .... = IG bit: Group address (multicast/broadcast)
    Type: IPv6 (0x86dd)
Internet Protocol Version 6, Src: 96b5:7525:7300:937c:7e9a:81ac:144c:f3d1, Dst: 82b4:487a:8647:6cc1:5a25:7300:c4eb:44ae
    0110 .... = Version: 6
    .... 0000 0101 .... .... .... .... .... = Traffic Class: 0x05 (DSCP: LE, ECN: ECT(1))
        .... 0000 01.. .... .... .... .... .... = Differentiated Services Codepoint: Lower Effort (1)
        .... .... ..01 .... .... .... .... .... = Explicit Congestion Notification: ECN-Capable Transport codepoint '01' (1)
    .... .... .... 0110 0110 1100 1111 0110 = Flow Label: 0x66cf6
    Payload Length: 54016
        [Expert Info (Warning/Protocol): IPv6 payload length exceeds framing length (1910 bytes)]
            [IPv6 payload length exceeds framing length (1910 bytes)]
            [Severity level: Warning]
            [Group: Protocol]
    Next Header: TCP (6)
    Hop Limit: 19
    Source: 96b5:7525:7300:937c:7e9a:81ac:144c:f3d1
    Destination: 82b4:487a:8647:6cc1:5a25:7300:c4eb:44ae
Transmission Control Protocol, Src Port: 7380, Dst Port: 49922, Seq: 1, Len: 1866
    Source Port: 7380
    Destination Port: 49922
    [Stream index: 0]
    [TCP Segment Len: 1866]
    Sequence number: 1    (relative sequence number)
    Sequence number (raw): 752206817
    [Next sequence number: 1868    (relative sequence number)]
    Acknowledgment number: 2857217187
        [Expert Info (Note/Protocol): The acknowledgment number field is nonzero while the ACK flag is not set]
            [The acknowledgment number field is nonzero while the ACK flag is not set]
            [Severity level: Note]
            [Group: Protocol]
    Acknowledgment number (raw): 2857217187
    1011 .... = Header Length: 44 bytes (11)
    Flags: 0xd25 (FIN, RST, URG, NS, Reserved)
        110. .... .... = Reserved: Set
        ...1 .... .... = Nonce: Set
        .... 0... .... = Congestion Window Reduced (CWR): Not set
        .... .0.. .... = ECN-Echo: Not set
        .... ..1. .... = Urgent: Set
        .... ...0 .... = Acknowledgment: Not set
        .... .... 0... = Push: Not set
        .... .... .1.. = Reset: Set
            [Expert Info (Warning/Sequence): Connection reset (RST)]
                [Connection reset (RST)]
                [Severity level: Warning]
                [Group: Sequence]
        .... .... ..0. = Syn: Not set
        .... .... ...1 = Fin: Set
            [Expert Info (Chat/Sequence): Connection finish (FIN)]
                [Connection finish (FIN)]
                [Severity level: Chat]
                [Group: Sequence]
        [TCP Flags: RR·N··U··R·F]
    Window size value: 60667
    [Calculated window size: 60667]
    [Window size scaling factor: -1 (unknown)]
    Checksum: 0xc1ab [unverified]
    [Checksum Status: Unverified]
    Urgent pointer: 42114
    Options: (24 bytes)
        Unknown (0x1d) (option length = 67 bytes says option goes past end of options)
            [Expert Info (Note/Sequence): Unknown (0x1d) (option length = 67 bytes says option goes past end of options)]
                [Unknown (0x1d) (option length = 67 bytes says option goes past end of options)]
                [Severity level: Note]
                [Group: Sequence]
    [SEQ/ACK analysis]
        [Bytes in flight: 1866]
        [Bytes sent since last PSH flag: 1866]
    [Timestamps]
        [Time since first frame in this TCP stream: 0.000000000 seconds]
        [Time since previous frame in this TCP stream: 0.000000000 seconds]
    Reset cause: �{�S�� �\001}������}�hGj���^\023n�\030H������[BB���r\037R�=<�\agK��:�+��,�\tT�\032wi������|\004�o�)C��\177��<%s
        [Expert Info (Warning/Undecoded): Trailing stray characters]
            [Trailing stray characters]
            [Severity level: Warning]
            [Group: Undecoded]
