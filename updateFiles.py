import sys

def copyFile(iPath, oPath):
    ifile = open(iPath,'r')
    ofile = open(oPath,'w')
    ofile.write(ifile.read())

dic_path = {}
dic_path['i3'] = ['~/.config/i3/config','./i3/config']
dic_path['polybar'] = '~/.config/polybar/config','./polybar/config']
dic_path['zsh'] = ['~/.zshrc','./zsh/.zshrc']

# Main
argfile = sys.argv[1]
if argfile in dic_path:
    copyFile(dic_path[argfile], )
else:
    print('Error : unknown file argument')

