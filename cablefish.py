import tkinter as tk
import subprocess as sb
from abc import ABC

PROGRAM_NAME = "CableFish"
WINDOW_SIZE = '800x600'
PORT_MSG = "--port"
IF_MSG = "--interface"
TCP_MSG = "--tcp"
ARP_MSG = "--arp"
ICMP_MSG = "--icmp"
UDP_MSG = "--udp"
PROTOCOL_LIST = (TCP_MSG, UDP_MSG, ARP_MSG, ICMP_MSG)

def set_dict(dictionary_set, key, value):
    dictionary_set[key] = value

# def print_to_label(e):
#     print("je tu")
#     print(e.widget.__dict__)

#     e.widget["text"] = message_container


class main_window_c:
    def __init__(self) -> None:
        self.elements = []
        self.com_channel = ''

    def initialise(self, master, this_class) -> None:
        self.frm_master = this_class(master)
        self.frm_master.place(relheight=1, relwidth=1)

    def inject_element(self, element):
        self.elements.append(element(self.frm_master))

    def invoke_action(self, msg):
        list(map(lambda x: x.invoke_action(msg), self.elements))

main_window = main_window_c()


class sniffer_controller:
    __instance = None
    def __init__(self, bin_dest):
        if(sniffer_controller.__instance != None):
            raise Exception("Cannot instantiate more instances of sniffer controller")
        else:
            sniffer_controller.__instance = self
            self.command = bin_dest
            self.__command_restore = bin_dest
            self.param_set = { TCP_MSG: False, UDP_MSG: False, ARP_MSG:False ,ICMP_MSG: False, IF_MSG: False, PORT_MSG: False}
    
    @staticmethod
    def get_instance(bin = "./sniffer"): 
        if sniffer_controller.__instance == None:
            sniffer_controller(bin)
        return sniffer_controller.__instance
    
    def set_param(self, parameter, value=""):
        if(self.param_set.get(parameter, True) == False):
            self.param_set[parameter] = True
            self.command += " "+ parameter + " " + str(value)

    def reset_command(self):
        for key in self.param_set:
            self.param_set[key] = False
        self.command = self.__command_restore

    def execute(self):
        print(self.command)
        with sb.Popen(self.command, stdout=sb.PIPE) as proc:
            #main_window.com_channel = proc.stdout.read()
            pass


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
        
        self.prot_vals = {}
        list(map(lambda key: set_dict(self.prot_vals, key, tk.IntVar()), PROTOCOL_LIST))
        for name_pair in enumerate(PROTOCOL_LIST):
            btn_prot_box = tk.Checkbutton(master=self.frm_buttons, text = name_pair[1], variable = self.prot_vals[name_pair[1]])
            btn_prot_box.grid(row = 1, column=name_pair[0] + 5, padx=3, pady = 3)


        self.btn_interface_disc = tk.Button(master=self.frm_buttons, text = "Interfaces")
        self.btn_interface_disc.grid(row=2, column=1, padx=3, pady=3)
        self.btn_interface_disc.bind("<Button>", self.bind_interfaces)

        self.btn_start_sniff = tk.Button(master=self.frm_buttons, text = "Start_sniffing")
        self.btn_start_sniff.grid(row=1, column=9, padx=3, pady=3)
        self.btn_start_sniff.bind("<Button>", self.bind_sniffing)


    def bind_interfaces(self, e):
        sniffer = sniffer_controller.get_instance()
        sniffer.reset_command()
        sniffer.execute()
        

    def bind_sniffing(self, e):
        sniffer = sniffer_controller.get_instance()
        sniffer.reset_command()
        if(self.ent_interface.get() == ""):
            print("set intreface first ")
            return
        sniffer.set_param(IF_MSG, self.ent_interface.get())

        if(self.ent_port.get() != ""):
            sniffer.set_param(PORT_MSG, self.ent_port.get())
        for val in self.prot_vals:
            if(self.prot_vals[val].get() == True):
                sniffer.set_param(val)
        sniffer.execute()

    def invoke_action(self, msg):
        pass


class label_output_c:
    def __init__(self, master):
        self.lbl_output = tk.Label(master = master, bg="white")
        self.lbl_output.place(relheight=0.8, relwidth=0.96, relx=0.02, rely=0.18)

    def invoke_action(self, msg):
        self.lbl_output["text"] = msg



def main():
    root = tk.Tk()
    root.title(PROGRAM_NAME)
    root.geometry(WINDOW_SIZE)

    main_window.initialise(root, tk.Frame)
    main_window.inject_element(option_bar_c)
    main_window.inject_element(label_output_c)
    # frm_main = tk.Frame(master = main_window)
    # frm_main.place(relheight=1, relwidth=1)

    # option_bar = option_bar_c(frm_main)
    # label_output = label_output_c(frm_main)
    
    root.resizable(True, True)
    root.mainloop()

main()
