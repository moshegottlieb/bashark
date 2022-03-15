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