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

<div style="background-color=#000">
<pr>
<font color="#F5A718">This will be light orange</font>
<font color="#CBF711">This will be light yellow</font><font color="##E854FE">&nbsp;and light purple,</font>&nbsp;<font color="white">back to normal.</font>
</pr>
</div>