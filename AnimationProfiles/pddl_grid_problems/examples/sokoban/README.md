# Sokoban

[Editor session](http://editor.planning.domains/#read_session=vhs8kMhtut)

Sokoban is a Japanese puzzle game, designed in 1981. Its title translates to 'warehouse keeper'. The player controls a character who must push every box onto every storage location. The boxes can be pushed, but not pulled; the challenge is to think several steps ahead, and avoid getting stuck in a state from which it is impossible to progress.

![](https://upload.wikimedia.org/wikipedia/commons/4/4b/Sokoban_ani.gif)

# Implementation Details

This was the first attempt at moving multiple objects at once. One predicate `(move ?ply - player ?from - pos ?to - pos)` moves the player, and another predicate `(push ?ply - player ?ply-from - pos ?ply-to - pos ?blk - block ?blk-from - pos ?blk-to - pos)` allows the player to push a single block.

# Todo

- Make more efficient
