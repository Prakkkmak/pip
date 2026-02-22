# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

PICO-8 game called "pip". PICO-8 is a fantasy console with strict constraints: 128x128 pixel display, 16 colors, Lua-based scripting with a custom API.

## Architecture

- `pip.p8` — PICO-8 cartridge file. Contains the `#include` directive for source code plus binary sections for graphics (`__gfx__`), map (`__map__`), and sound (`__sfx__`). This is the file PICO-8 loads directly.
- `src/main.lua` — Game entry point. Implements the three PICO-8 lifecycle callbacks: `_init()`, `_update()`, `_draw()`. Handles player movement (4-directional via `btn()`) and camera scrolling.
- `src/chunk.lua` — Chunk-based map rendering system. Divides the world into 8x8 tile chunks and renders them via `map()`. Chunks are arranged in a 2-column layout, scrolling vertically upward (negative Y).

## Key Concepts

- The world scrolls **upward** — positive chunk indices go in negative Y direction.
- The camera follows the player vertically with `camera(0, cam_y - 64)`, clamped so it doesn't go below y=0.
- Sprite palette transparency: color 0 (black) is opaque, color 14 (pink) is transparent (`palt()`).
- Chunk size is 8 tiles (64 pixels). Map bank selection is stored in `chunk[index]`.

## PICO-8 Specifics

- PICO-8 Lua is a subset: no `require`/`module`, all files are concatenated via `#include`.
- Token limit: 8192 tokens max. Keep code terse.
- Standard API: `spr()`, `map()`, `btn()`, `camera()`, `cls()`, `palt()`, `flr()`, `min()`, `max()`.
- To test: open `pip.p8` in PICO-8 and run with `ctrl+r`.
