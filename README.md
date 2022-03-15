# bashark

_Making bash printed text prettier._  

Adjusted for modern 256 color terminals.  

### Quickstart

#### Colors

```bash
#!/bin/bash
source ~/.bashark/bashark.sh

color 214 # Light orange
echo This will be light orange

# Or inline
echo $(color 190)This is light yellow$(color 171) and light purple, ${NORMAL}back to normal.

```
![Inline colors](https://github.com/moshegottlieb/bashark/blob/master/examples/screenshots/cap1.png?raw=true)

Here's a useful colormap
![Color map](https://github.com/moshegottlieb/bashark/blob/master/examples/screenshots/cap2.png?raw=true)

Here is a sample of the built in variables

![Color map](https://github.com/moshegottlieb/bashark/blob/master/examples/screenshots/builtin.gif?raw=true)

#### Commands

I wrote these little helpers for my own projects, because I believe bash users deserve animations, just like anyone else!  
To run a command with a nice animation, just call:  

```bash
source ~/.bashark/bashark.sh
cmd "Status message" command param1 param2
```

Here's an example:

![Color map](https://github.com/moshegottlieb/bashark/blob/master/examples/screenshots/command.gif?raw=true)

### Installation

Either copy the files in `source` and include `bashark.sh` from it, or use the install script to copy it to your home directory under `.bashark`.  
To use in your script:

```bash
source ~/.bashark/bashark.sh
```
or change `~/.bashark` to your custom location.