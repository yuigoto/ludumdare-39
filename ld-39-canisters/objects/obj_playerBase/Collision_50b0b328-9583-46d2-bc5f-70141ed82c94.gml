/// @description Reload Ammo!

// Get the canister
player_ammo += 10;
if (player_ammo > player_max_ammo) player_ammo = player_max_ammo;
instance_destroy(other);
