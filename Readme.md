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
​    Výstup bude vyzerať podobne:

```
Timestamp: 1970-01-01T01:00:01.000001+01:00
Src MAC: 5c:87:9c:f2:71:f5
Dst MAC: 0:1a:1e:6:87:10
Type: IPV4
Frame length: 52
Time to live: 64
Src IP: 100.64.199.51
Dst IP: 18.184.0.129
Header length: 20
Protocol: tcp
Src port: 43058
Dst port: 443
Sequence number: 345144025
Ack number: 3873966775
Flags: 0x010
0x0000:  00 1a 1e 06 87 10 5c 87 9c f2 71 f5 08 00 45 00  ......\...q...E.
0x0010:  00 34 bd ff 40 00 40 06 3e 18 64 40 c7 33 12 b8  .4..@.@.>.d@.3..
0x0020:  00 81 a8 32 01 bb 14 92 7a d9 e6 e8 0a b7 80 10  ...2....z.......
0x0030:  01 f5 3e d3 00 00 01 01 08 0a 6c 6a aa 0c 4e cc  ..>.......lj..N.
0x0040:  4e 33                                            N3
```

 # Spustenie CableFish

CableFish je grafická nadstavba nad snifferom.

Musí byť spúštaná s právami `root` a preferuje sa spúštanie cez skript `run_cablefish.sh`. Ešte pred spustením musí byť program sniffer preložený a spustiteľný.

Pri spustení sa otvorí okno. Ak chcete zistiť dostupné rozhrania, tlačítko `Interfaces` ich vypíše. Pred zachytávaním paketov je nutné špecifikovať rozhranie v `Interface` vstupe. Pomocou vstupov `Port` a `Count` sa definuje port na zachytávanie a koľko paketov zachytiť. Implicitne sa odpočúva na vśetkých portoch a jeden paket. Checkboxami sa filtrujú zachytené pakety. Ak nie je zaškrtnutý ani jeden, sú odchytávané všetky rovnako akoby boli zaškrtnuté všetky políčka.



# Spustenie testov

Na statické otestovanie parsovania paketov je v zložke `./testovanie/` skript na automatické spustenie a analyzovanie výsledkov. Samotný skript je napísaný v jazyku PHP. Pri jeho spustení sa pre každý paket spustí sniffer a porovnáva sa vysledok s referenčným. Výsledková listina je potom prehľadne spracovaná v html dokumente. 

Na zjednodušenie spúštania testov je skript `run_tests.sh`, postará sa o správne zadanie parametrov. Inak sa dá špecifikovať regulárnym výrazom filtrovanie spúštaných scenárov podľa mena a textovým súborom sa dá špecifikovať, ktoré adresáre budú prehľadávané na testy.

Pre použitie pokročilejších možností použite nápovedu z príkazom `--help`.