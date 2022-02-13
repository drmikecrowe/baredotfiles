# Introduction

My personal dotfiles for any system.  Uses [the excellent dotbare](https://github.com/kazhala/dotbare) to host

## Installation

### Git Install

```sh
git clone https://github.com/kazhala/dotbare.git ~/.dotbare && \
    source ~/.dotbare/dotbare.plugin.bash && \
    dotbare finit -u https://github.com/drmikecrowe/baredotfiles.git
```

### wget Install

```sh
wget https://github.com/kazhala/dotbare/archive/refs/heads/master.tar.gz -qO- | tar -xz && mv dotbare-master .dotbare && \
    source ~/.dotbare/dotbare.plugin.bash && \
    dotbare finit -u https://github.com/drmikecrowe/baredotfiles.git
```
