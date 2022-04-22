Frame 1: 96 bytes on wire (768 bits)
  Encapsulation type: Ethernet (1)
  Arrival Time: Jun  8, 2021 13:31:59.000000000 CEST
  Time shift for this packet: 0.000000000 seconds
  Epoch Time: 1623151919.000000000 seconds
  Time delta from previous captured frame: 0.000000000 seconds
  Time delta from previous displayed frame: 0.000000000 seconds
  Time since reference or first frame: 0.000000000 seconds
  Frame Number: 1
  Frame Length: 96 bytes (768 bits)
  Capture Length: 96 bytes (768 bits)
  Frame is marked: False
  Frame is ignored: False
  Protocols in frame: eth:ethertype:ip:udp:ptp
Ethernet II
  Destination: IPv4mcast_6b (01:00:5e:00:00:6b)
    Address: IPv4mcast_6b (01:00:5e:00:00:6b)
    .... ..0. .... .... .... .... = LG bit: Globally unique address (factory default)
    .... ...1 .... .... .... .... = IG bit: Group address (multicast/broadcast)
  Source: RichardH_00:09:ba (00:80:63:00:09:ba)
    Address: RichardH_00:09:ba (00:80:63:00:09:ba)
    .... ..0. .... .... .... .... = LG bit: Globally unique address (factory default)
    .... ...0 .... .... .... .... = IG bit: Individual address (unicast)
  Type: IPv4 (0x0800)
Internet Protocol Version 4
  0100 .... = Version: 4
  .... 0101 = Header Length: 20 bytes (5)
  Differentiated Services Field: 0x00 (DSCP: CS0, ECN: Not-ECT)
    0000 00.. = Differentiated Services Codepoint: Default (0)
    .... ..00 = Explicit Congestion Notification: Not ECN-Capable Transport (0)
  Total Length: 82
  Identification: 0x45a5 (17829)
  Flags: 0x00
    0... .... = Reserved bit: Not set
    .0.. .... = Don't fragment: Not set
    ..0. .... = More fragments: Not set
  Fragment Offset: 0
  Time to Live: 1
  Protocol: UDP (17)
  Header Checksum: 0xd0dc
  Header checksum status: Unverified
  Source Address: 192.168.2.6
  Destination Address: 224.0.0.107
User Datagram Protocol
  Source Port: 319
  Destination Port: 319
  Length: 62
  Checksum: [missing]
  Checksum Status: Not present
  Stream index: 0
  Timestamps
    Time since first frame: 0.000000000 seconds
    Time since previous frame: 0.000000000 seconds
  UDP payload (54 bytes)
Precision Time Protocol (IEEE1588)
  0001 .... = transportSpecific: 0x1
    ...1 .... = V1 Compatibility: True
  .... 0010 = messageId: Peer_Delay_Req Message (0x2)
  0000 .... = Reserved: 0
  .... 0010 = versionPTP: 2
  messageLength: 54
  subdomainNumber: 0
  Reserved: 0
  flags: 0x0000
    0... .... .... .... = PTP_SECURITY: False
    .0.. .... .... .... = PTP profile Specific 2: False
    ..0. .... .... .... = PTP profile Specific 1: False
    .... .0.. .... .... = PTP_UNICAST: False
    .... ..0. .... .... = PTP_TWO_STEP: False
    .... ...0 .... .... = PTP_ALTERNATE_MASTER: False
    .... .... ..0. .... = FREQUENCY_TRACEABLE: False
    .... .... ...0 .... = TIME_TRACEABLE: False
    .... .... .... 0... = PTP_TIMESCALE: False
    .... .... .... .0.. = PTP_UTC_REASONABLE: False
    .... .... .... ..0. = PTP_LI_59: False
    .... .... .... ...0 = PTP_LI_61: False
  correction: 0.000000 nanoseconds
    correction: Ns: 0 nanoseconds
    correctionSubNs: 0 nanoseconds
  Reserved: 0
  ClockIdentity: 0x008063ffff0009ba
  SourcePortID: 1
  sequenceId: 40526
  control: Other Message (5)
  logMessagePeriod: 15
  originTimestamp (seconds): 1169232213
  originTimestamp (nanoseconds): 773744420
