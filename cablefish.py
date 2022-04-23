import tkinter as tk
import subprocess as sb
from abc import ABC
from typing import overload

PROGRAM_NAME = "CableFish"
WINDOW_SIZE = '800x600'
PORT_MSG = "--port"
IF_MSG = "--interface"
TCP_MSG = "--tcp"
ARP_MSG = "--arp"
ICMP_MSG = "--icmp"
UDP_MSG = "--udp"
COUNT_MSG = "-n"
PROTOCOL_LIST = (TCP_MSG, UDP_MSG, ARP_MSG, ICMP_MSG)

def set_dict(dictionary_set, key, value):
    dictionary_set[key] = value

# def print_to_label(e):
#     print("je tu")
#     print(e.widget.__dict__)

#     e.widget["text"] = message_container


class main_observer_c:
    def __init__(self) -> None:
        self.elements = []
        self.com_channel = ''

    @property
    def com_channel(self):
        return self._com_channel
    @com_channel.setter
    def com_channel(self, value):
        self._com_channel = value
    
    def initialise(self, master, this_class) -> None:
        self.frm_master = this_class(master)
        self.frm_master.place(relheight=1, relwidth=1)

    def inject_element(self, element):
        self.elements.append(element(self.frm_master))

    def notify(self):
        list(map(lambda x: x.notify(self.com_channel), self.elements))

main_observer = main_observer_c()


class sniffer_controller:
    __instance = None
    def __init__(self, bin_dest):
        if(sniffer_controller.__instance != None):
            raise Exception("Cannot instantiate more instances of sniffer controller")
        else:
            sniffer_controller.__instance = self
            self.command = ["sudo", bin_dest]
            self.__command_restore = self.command.copy()
            self.param_set = { TCP_MSG: False, UDP_MSG: False, ARP_MSG:False ,ICMP_MSG: False, IF_MSG: False, PORT_MSG: False, COUNT_MSG: False}
    
    @staticmethod
    def get_instance(bin = "./ipk-sniffer"): 
        if sniffer_controller.__instance == None:
            sniffer_controller(bin)
        return sniffer_controller.__instance
    
    def set_param(self, parameter:str, value: str ="") -> None:
        if(self.param_set.get(parameter, True) == False):
            self.param_set[parameter] = True
            self.command.append(parameter)
            if(value):
                self.command.append(str(value))
    
    def reset_command(self):
        for key in self.param_set:
            self.param_set[key] = False
        self.command = self.__command_restore.copy()

    def execute(self):
        print(self.command)
        try:
            main_observer.com_channel = sb.check_output(self.command)
        except:
            main_observer.com_channel = "Error: undefined interface"
        main_observer.notify()
        print(main_observer.com_channel)
        


class option_bar_c:
    def __init__(self, master):
        self.frm_buttons = tk.Frame(master= master)
        self.frm_buttons.place(relheight=0.15, relwidth=1)

        list(map( lambda x: self.frm_buttons.columnconfigure(x, weight=1, minsize=75), range(1, 10)))
        #self.frm_buttons.rowconfigure(weight=1, minsize=50)

        self.lbl_interface = tk.Label(master = self.frm_buttons, text = "Interface: ")
        self.lbl_interface.grid(row=1, column= 1, padx=3, pady=3)

        self.ent_interface = tk.Entry(master=self.frm_buttons, width = 10, bg="white", relief=tk.RAISED, borderwidth=3)
        self.ent_interface.grid(row=1, column=2, padx=3, pady=3)

        self.lbl_port = tk.Label(master = self.frm_buttons, text = "Port: ")
        self.lbl_port.grid(row=1, column= 3, padx=3, pady=3)
        
        self.ent_port = tk.Entry(master=self.frm_buttons, width = 10, bg="white", relief=tk.RAISED, borderwidth=3)
        self.ent_port.grid(row=1, column=4, padx=3, pady=3)

        self.lbl_count = tk.Label(master = self.frm_buttons, text = "Count: ")
        self.lbl_count.grid(row=1, column= 5, padx=3, pady=3)

        self.ent_count = tk.Entry(master=self.frm_buttons, width = 10, bg="white", relief=tk.RAISED, borderwidth=3)
        self.ent_count.grid(row=1, column=6, padx=3, pady=3)
        
        self.prot_vals = {}
        list(map(lambda key: set_dict(self.prot_vals, key, tk.IntVar()), PROTOCOL_LIST))
        for name_pair in enumerate(PROTOCOL_LIST):
            btn_prot_box = tk.Checkbutton(master=self.frm_buttons, text = name_pair[1], variable = self.prot_vals[name_pair[1]])
            btn_prot_box.grid(row = 2, column=name_pair[0] + 2, padx=3, pady = 3)


        self.btn_interface_disc = tk.Button(master=self.frm_buttons, text = "Interfaces")
        self.btn_interface_disc.grid(row=2, column=1, padx=3, pady=3)
        self.btn_interface_disc.bind("<Button>", self.bind_interfaces)

        self.btn_start_sniff = tk.Button(master=self.frm_buttons, text = "Start_sniffing")
        self.btn_start_sniff.grid(row=1, column=8, padx=3, pady=3)
        self.btn_start_sniff.bind("<Button>", self.bind_sniffing)


    def bind_interfaces(self, e):
        sniffer = sniffer_controller.get_instance()
        sniffer.reset_command()
        sniffer.execute()
        

    def bind_sniffing(self, e):
        sniffer = sniffer_controller.get_instance()
        sniffer.reset_command()

        if(self.ent_interface.get() == ""):
            main_observer.com_channel = "Set interface first"
            main_observer.notify()
            print("set interface first ")
            return
        sniffer.set_param(IF_MSG, self.ent_interface.get())

        if(self.ent_port.get() != ""):
            sniffer.set_param(PORT_MSG, self.ent_port.get())
        if(self.ent_count.get() != ""):
            sniffer.set_param(COUNT_MSG, self.ent_count.get())
            
        for val in self.prot_vals:
            if(self.prot_vals[val].get() == True):
                sniffer.set_param(val)
        sniffer.execute()

    def notify(self, msg):
        pass


class label_output_c:
    def __init__(self, master):
        self.text_frm = tk.Frame(master=master, bg="white")
        self.text_frm.place(relheight=0.8, relwidth=0.96, relx=0.02, rely=0.18)
        self.widget_txt = tk.Text(master=self.text_frm)
        self.widget_txt.pack(side=tk.LEFT, expand=True, fill="both")
        self.lbl_scroll = tk.Scrollbar(master = self.text_frm, orient='vertical', command=self.widget_txt.yview)
        self.widget_txt.config(yscrollcommand=self.lbl_scroll.set)
        self.lbl_scroll.pack(side=tk.RIGHT, fill=tk.Y)
        self.widget_txt.pack(side=tk.LEFT, expand=True, fill="both")

    def notify(self, msg):
        self.widget_txt.delete("1.0", tk.END)
        self.widget_txt.insert(tk.END, msg)


def main():
    root = tk.Tk()
    root.title(PROGRAM_NAME)
    root.geometry(WINDOW_SIZE)

    main_observer.initialise(root, tk.Frame)
    main_observer.inject_element(option_bar_c)
    main_observer.inject_element(label_output_c)
    # frm_main = tk.Frame(master = main_observer)
    # frm_main.place(relheight=1, relwidth=1)

    # option_bar = option_bar_c(frm_main)
    # label_output = label_output_c(frm_main)
    
    root.resizable(True, True)
    root.mainloop()

main()
