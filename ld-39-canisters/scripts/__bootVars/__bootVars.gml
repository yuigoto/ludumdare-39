/// @description  __bootVars()
/// @function  __bootVars

// Define Global Handlers
global.PLAYER           = noone;
global.CAMERA           = noone;
global.CAMERA_GENERIC   = noone;
global.CROSSHAIR        = noone;

// Game Management
global.GAME_INI     = false;
global.GAME_MID     = false;
global.GAME_END     = false;
global.GAME_CURR    = 1;
global.GAME_PASS    = false;
global.GAME_OVER    = false;
global.GAME_BUILD   = false;
global.GAME_ENEMY   = 0;

// Generator Variables
global.GEN_STEPS    = 500;
global.GEN_TILES    = 100;
global.GEN_ODDS     = 100;
global.GEN_PLACED   = 0;
global.GEN_WALKED   = 0;
global.GEN_PLAYERX  = 0;
global.GEN_PLAYERY  = 0;
global.GEN_PATHGRID = noone;