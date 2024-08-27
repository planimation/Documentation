# Bloxorz

[Editor session](https://editor.planning.domains/#read_session=TGIjNkoTZQ)

Bloxorz is a web game famously hosted on [CoolMathGames](https://www.coolmathgames.com/0-bloxorz). The player controls a two-block cube stack, which can roll in 3D space to sit on any of its faces. The challenge is to navigate through tightly-designed courses to slot into the hole at the end of each level.

![](https://prideout.net/blog/group_theory/Bloxorz.gif)

# Implementation Details

Instead of simulating a 3D world, pseudo-3D is created by sending whichever block is "on top" of the other to a reserved location.

# Todo

- Add images to resemble original game.
- Animate wall / blocker features
- Improve efficiency
- Add switches and bridges
- Add orange tiles
- Recreate levels