# config
Configuración linux

## Instalación
```
1. echo ".cfg" >> .gitignore
2. git clone https://github.com/carlosescutia/config $HOME/.cfg
3. vim ~/.bashrc
    alias config='/usr/bin/git --git-dir=$HOME/.cfg/.git --work-tree=$HOME'
4. source ~/.bashrc
5. config config --local status.showUntrackedFiles no
6. config config --local core.filemode false
7. config checkout
```
