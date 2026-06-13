/// @function() spt_palette_actions
/// @desc												Stores profiles for different palettes
/// @param {Real}				_palette_id				Identifier for the palette (e.g., 0 = default palette)
/// @returns {void}	

function spt_palette_properties(_id)
{
	enum PALETTE
	{
		EXAMPLE
	}
	
	enum PROPERTY
	{
		SPRITE,
		X_SCALE,
		Y_SCALE,
		ANGLE,
		ALPHA,
		CURSOR,
		SOUND
	}
	
	switch(_id)
	{
		case PALETTE.EXAMPLE:
		
			x_gap = 32;
			y_gap = 32;
			
			palette_item_qty = 35;
			max_row_qty = 6;
			
			cursor_default = window_get_cursor();
			cursor_hover = cr_handpoint;
			
			sprite_inset_enabled[_id] = false;
			sprite_inset_enabled[30] = false;
			
			data[STATE.ENABLED][PROPERTY.SPRITE] = spr_example_buttons;
			data[STATE.ENABLED_HOVER][PROPERTY.SPRITE] = spr_example_buttons;
			data[STATE.ENABLED_CLICK][PROPERTY.SPRITE] = spr_example_buttons;
			
			data[STATE.DISABLED][PROPERTY.SPRITE] = spr_example_buttons_disabled;
			data[STATE.DISABLED_HOVER][PROPERTY.SPRITE] = spr_example_buttons_disabled;
			data[STATE.DISABLED_CLICK][PROPERTY.SPRITE] = spr_example_buttons_disabled;
			
			data[STATE.INSET][PROPERTY.SPRITE] = spr_example_buttons_inset;
			data[STATE.INSET_HOVER][PROPERTY.SPRITE] = spr_example_buttons_inset;
			data[STATE.INSET_CLICK][PROPERTY.SPRITE] = spr_example_buttons_inset;
			
			data[STATE.ENABLED][PROPERTY.X_SCALE] = 0.25;
			data[STATE.ENABLED_HOVER][PROPERTY.X_SCALE] = 0.24;
			data[STATE.ENABLED_CLICK][PROPERTY.X_SCALE] = 0.23;
			
			data[STATE.DISABLED][PROPERTY.X_SCALE] = 0.25;
			data[STATE.DISABLED_HOVER][PROPERTY.X_SCALE] = 0.25;
			data[STATE.DISABLED_CLICK][PROPERTY.X_SCALE] = 0.25;
			
			data[STATE.INSET][PROPERTY.X_SCALE] = 0.24;
			data[STATE.INSET_HOVER][PROPERTY.X_SCALE] = 0.23;
			data[STATE.INSET_CLICK][PROPERTY.X_SCALE] = 0.22;
			
			data[STATE.ENABLED][PROPERTY.Y_SCALE] = 0.25;
			data[STATE.ENABLED_HOVER][PROPERTY.Y_SCALE] = 0.24;
			data[STATE.ENABLED_CLICK][PROPERTY.Y_SCALE] = 0.23;
			
			data[STATE.DISABLED][PROPERTY.Y_SCALE] = 0.25;
			data[STATE.DISABLED_HOVER][PROPERTY.Y_SCALE] = 0.25;
			data[STATE.DISABLED_CLICK][PROPERTY.Y_SCALE] = 0.25;
			
			data[STATE.INSET][PROPERTY.Y_SCALE] = 0.24;
			data[STATE.INSET_HOVER][PROPERTY.Y_SCALE] = 0.23;
			data[STATE.INSET_CLICK][PROPERTY.Y_SCALE] = 0.22;
			
			data[STATE.ENABLED][PROPERTY.ANGLE] = 0;
			data[STATE.ENABLED_HOVER][PROPERTY.ANGLE] = 0;
			data[STATE.ENABLED_CLICK][PROPERTY.ANGLE] = 0;
			
			data[STATE.DISABLED][PROPERTY.ANGLE] = 0;
			data[STATE.DISABLED_HOVER][PROPERTY.ANGLE] = 0;
			data[STATE.DISABLED_CLICK][PROPERTY.ANGLE] = 0;
			
			data[STATE.INSET][PROPERTY.ANGLE] = 0;
			data[STATE.INSET_HOVER][PROPERTY.ANGLE] = 0;
			data[STATE.INSET_CLICK][PROPERTY.ANGLE] = 0;
			
			data[STATE.ENABLED][PROPERTY.ALPHA] = 1;
			data[STATE.ENABLED_HOVER][PROPERTY.ALPHA] = 1;
			data[STATE.ENABLED_CLICK][PROPERTY.ALPHA] = 1;
			
			data[STATE.DISABLED][PROPERTY.ALPHA] = 1;
			data[STATE.DISABLED_HOVER][PROPERTY.ALPHA] = 1;
			data[STATE.DISABLED_CLICK][PROPERTY.ALPHA] = 1;
			
			data[STATE.INSET][PROPERTY.ALPHA] = 1;
			data[STATE.INSET_HOVER][PROPERTY.ALPHA] = 1;
			data[STATE.INSET_CLICK][PROPERTY.ALPHA] = 1;
			
			data[STATE.ENABLED][PROPERTY.SOUND] = undefined;
			data[STATE.ENABLED_HOVER][PROPERTY.SOUND] = snd_hover;
			data[STATE.ENABLED_CLICK][PROPERTY.SOUND] = snd_click;
		
			data[STATE.DISABLED][PROPERTY.SOUND] = undefined;
			data[STATE.DISABLED_HOVER][PROPERTY.SOUND] = snd_hover;
			data[STATE.DISABLED_CLICK][PROPERTY.SOUND] = snd_disabled;
			
			data[STATE.INSET][PROPERTY.SOUND] = undefined;
			data[STATE.INSET_HOVER][PROPERTY.SOUND] = snd_hover;
			data[STATE.INSET_CLICK][PROPERTY.SOUND] = snd_pop;
			
		break;
	}
}