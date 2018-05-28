#!/usr/bin/env python
 
import i3ipc

i3 = i3ipc.Connection()
# Show workspaces
def print_workspaces():
    workspaces = i3.get_workspaces()
    file = open("/home/paul/.i3/workspaces", "w")
    for i in workspaces:
        if i['focused']==True:
            file.write("1")
            #file.write("%{F$color4} "+i['name']+" %{F-}")
        elif i['urgent']==True:
            file.write("2")
            #file.write("%{F$color11}%{A:i3-msg -q workspace number "+i['name']+":} "+i['name']+" %{A}%{F-}")
        else:
            file.write("3")
            #file.write("%{A:i3-msg -q workspace number "+i['name']+":} "+i['name']+" %{A}")
    file.close()

def on_workspace_focus(self, e):
    print_workspaces()

# Show current mode
def on_mode_change(self, event):
    mode = event.change
    file = open("/home/paul/.i3/mode", "w")
    file.write("mode: "+mode)
    file.close()


i3.on('workspace::', on_workspace_focus)

i3.on('mode::', on_mode_change)

i3.main()

