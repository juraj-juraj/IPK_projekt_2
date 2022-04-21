# Sniffer

Sniffer je utilita na odchyvanie sieťovej komunikácie. Umožnuje odhytávať a filtrovať odchytené rámce.

## Vytvorenie binárneho súboru

Na správne preloženie sú dve možnosti.

Prvá, preferovaná je spustiť skript build_binary.sh. Tento skript vytvorí zložku build, do ktorej skompiluje projekt a do hlavného adresára vytvorí linku na spustiteľný súbor. Samotný ipk-sniffer sa nachádza v build zložke.

Druhá možnosť je použiť Makefile v hlavnom adresári. Spustí sa pomocou príkazu make, ktorý skompiluje celý projekt a v hlavnom adresári vytvorí spustiteľný súbor ipk-sniffer.

## Spustenie snifferu

Použitie: ./ipk-sniffer {[-i | --interface \<rozhranie\>] {-p | --port \<port_number\>} {[--tcp|-t] [--udp|-u] [--arp|-a] [--icmp|-c] } {-n | --count \<num\>}} | [-b | --binary  <súbor>]

​    -i alebo --interface \<rozhranie\>     	Udáva na ktorom rozhraní bude chceme odchytávať. Ak nie je parameter zadaný vôbec alebo chýba meno
​                                           						    rozhrania, vypíšu sa všetky dostupné rozhrania
​    -p alebo --port \<port_number\>     	 Filtrovanie zachytávaných paketov podľa portu 
​    
​    -t alebo --tcp                         				 Filter na zachytávanie len tcp paketov
​    
​    -u alebo --udp                         			   Filter na zachytávanie udp paketov

​    -a alebo --arp                         				Filter na zachytávanie arp paketov

​    -c alebo --icmp                        			   Filter na zachytávanie icmp paketov

​    -n alebo --count \<num\>              		 Po koľkých zachytených paketoch sa má ukončiť odchytávanie paketov. Implicitne sa po jednom pakete ukonči 																	   program

​	-b alebo --binary <súbor>					Načíta paket z binárneho súboru

Program musí byť spúštaný s root oprávnením.

Priklad spustenia:

```console
$ sudo ./ipk-sniffer -i wlo1  --icmp -n 3
```
​    Spustí sniffer na rozhraní wlo1, zacyhtáva iba icmp pakety a po troch zachytených sa ukončí.
​    Výstup bude vyzert podobne:

```
Timestamp: 2022-04-21T20:55:44.390213+02:00
Src MAC: 5c:87:9c:f2:71:f5
Dst MAC: 0:1a:1e:6:87:10
Frame length: 84
Time to live: 64
Src IP: 100.64.199.51
Dst IP: 172.67.22.81
Header length: 20
Protocol: icmp
Sequence number: 256
Type: Echo request (8)
Code: 0
0x0000:  00 1a 1e 06 87 10 5c 87 9c f2 71 f5 08 00 45 00  ......\...q...E.
0x0010:  00 54 1e 31 40 00 40 01 2e 70 64 40 c7 33 ac 43  .T.1@.@..pd@.3.C
0x0020:  16 51 08 00 0c 26 00 07 00 01 b0 a8 61 62 00 00  .Q...&......ab..
0x0030:  00 00 15 f4 05 00 00 00 00 00 10 11 12 13 14 15  ................
0x0040:  16 17 18 19 1a 1b 1c 1d 1e 1f 20 21 22 23 24 25  ...........!"#$%
0x0050:  26 27 28 29 
```

 