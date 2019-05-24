# IdleBox
My shell toolkit.

## Installation

Make sure that you have [zsh](https://en.wikipedia.org/wiki/Z_shell) and [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh) installed.

### with curl

```shell
zsh -c "$(curl -fsSL https://raw.githubusercontent.com/libook/IdleBox/master/install)"
# Or install all dependences via:
zsh -c "$(curl -fsSL https://raw.githubusercontent.com/libook/IdleBox/master/install-all)"
```

### with wget

```shell
zsh -c "$(wget https://raw.githubusercontent.com/libook/IdleBox/master/install -O -)"
# Or install all dependences via:
zsh -c "$(wget https://raw.githubusercontent.com/libook/IdleBox/master/install-all -O -)"
```

### Change configuration in ~/.idlebox/config

## Directory Structure

```
.
├── LICENSE           - Just license.
├── README.md         - The manual which you are reading now.
├── config.example    - An example of configure file.
├── scripts           - Directory of scripts.
│   ├── private/      - Git will ignore this directory.
│   └── public/       - All public scripts.
├── zshrc             - Main "run command" file of zsh.
└── zshrcs            - Directory of extra "run command" files.
    ├── private/      - Git will ignore this directory.
    └── public/       - All public "run command" files.
```
