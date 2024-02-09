# i bare git repo dot file har dto make so this is my solution hyp

import shutil
import os
from pathlib import Path

git_path = os.path.dirname(os.path.realpath(__file__))






def copy_curr_dir(file, dest_name):
    file = Path(file)
    dest_path = Path(git_path) / dest_name
    os.makedirs(dest_path, exist_ok=True)

    if file.is_file():
        shutil.copy(file, dest_path)
    elif file.is_dir():
        dest_dir = dest_path / file.name
        shutil.copytree(file, dest_dir, dirs_exist_ok=True)
   

def main():
    if os.name == 'posix':
        homedir = os.getenv('HOME')
        neovim = ''
        
    else:
        homedir = os.getenv('USERPROFILE')
        if homedir == None:
            exit("alskdjflasjdlkfj")
        neovim = '/AppData/Local/nvim'
        get_nvim(homedir + neovim)
        get_wezterm(homedir)



def get_nvim(path):
    dest_name = "nvim"
    copy_curr_dir(os.path.join(path, 'lua'), dest_name)
    copy_curr_dir(os.path.join(path, 'init.lua'), dest_name)
    

def get_wezterm(path):
    dest_name = "wezterm"
    copy_curr_dir(os.path.join(path, '.wezterm.lua'), dest_name)   



if __name__ == "__main__":
    main()

