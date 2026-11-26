# Godot 4.2.2 backport

Target: Godot 4.2.2 stable, Forward+ renderer, built-in Godot Physics.

## Import
Extract the archive, open project.godot in Godot 4.2.2, wait for asset imports, then press F6 on scenes/main.tscn or F5 to run the project. No Dialogic or external physics plugin is included.

## Changes
- Used the supplied repository history (f51aa62, pre-4.3 project configuration) to restore compatible coin mesh serialization, dust resource, character GLB and existing import metadata.
- Preserved the 4.6 example level, breakable bricks, cloud fade, camera, HUD, sounds and newer gameplay scripts.
- Removed Jolt and physics interpolation settings, script UID references, newer animation properties and coin stencil outline.
- Brick particle mesh is obtained from the original GLB at runtime rather than from a newer binary resource. Collision changes are deferred during physics callbacks.
- Retained animation looping settings, corrected float accumulators, audio bus case and coin signal signature.
- Removed the supplied Git history and generated .godot cache from the distribution. Original licenses retained.

## Verification status
Static checks only: all explicit scene/script/project resource paths resolve, scene format headers are 3, and scene resource counts were recalculated. Godot is not installed in the conversion environment and network access prevented obtaining the executable. Runtime compatibility is not yet certified.

## Studio smoke test
1. Import in 4.2.2 and check the Output and Debugger for errors.
2. F5: verify world, character, sky, HUD and textures.
3. WASD / left stick, Space / gamepad jump: check movement, double jump, idle/walk/jump animations.
4. Arrow keys / right stick and +/- / triggers: check camera rotation and zoom.
5. Collect coins; check HUD, sound and particles.
6. Jump into bricks from below; check collision removal and debris.
7. Land on falling platforms; check falling and collision.
8. Fall off the world; check scene reload and HUD reset.

Visual differences: no stencil outline on coins; physics and particle appearance may differ from Godot 4.6.
