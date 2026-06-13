// CREATES A CONSTRUCTOR OR 'CLASS' FOR GENERATING PALETTES //

/// @description Generate 2D grid

global.palette_list = ds_list_create();

/// @function() palette
/// @constructor
/// @desc                                                Generates a palette (grid of buttons) based on parameters.
/// @param {Sprite}   _enabled_sprite                    Sprite used for enabled buttons
/// @returns {Struct}                                     A new palette/grid struct with at least these fields:

function palette
(	
	_palette_data = PALETTE.EXAMPLE
) 

constructor
{
	play_sound = undefined;
	
	spt_palette_properties(_palette_data);
	
	/// @function()				  Set_palette_state
	/// @desc                     Set palette item appearance based on state
	/// @param {Real} [_state]    Determine what state the palette item should be in
	/// @param {Real}  [_id]      The ID of the palette item to change the state of
	
	for (var _i = 0; _i < palette_item_qty; ++_i)
	{
		set_palette_state(STATE.ENABLED, _i);
	}
	
	function set_palette_state(_state, _id)
	{
		enum STATE
		{
			ENABLED,
			ENABLED_HOVER,
			ENABLED_CLICK,
			
			DISABLED,
			DISABLED_HOVER,
			DISABLED_CLICK,
			
			INSET,
			INSET_HOVER,
			INSET_CLICK,
		}
		
		sprite_data[_id] = data[_state][PROPERTY.SPRITE];
		sprite_index_data[_id] = _id;
		
		sprite_x_scale_data[_id] = data[_state][PROPERTY.X_SCALE];
		sprite_y_scale_data[_id] = data[_state][PROPERTY.Y_SCALE];
		
		sprite_width_data[_id] = sprite_get_width(sprite_data[_id]) * sprite_x_scale_data[_id];
		sprite_height_data[_id] = sprite_get_height(sprite_data[_id]) * sprite_y_scale_data[_id];
		
		sprite_x_pos_data[_id] = (_id % max_row_qty) * (sprite_width_data[_id] + x_gap);
		sprite_y_pos_data[_id] = floor(_id / max_row_qty) * (sprite_height_data[_id] + y_gap);

		sprite_angle_data[_id] = data[_state][PROPERTY.ANGLE];
		sprite_alpha_data[_id] = data[_state][PROPERTY.ALPHA];
		
		sprite_sound_data[_id] = data[_state][PROPERTY.SOUND];
		sprite_inset_enabled[_id] = false;
		
		
		
	

	}
	
	/// @function()				  get_palette_id
	/// @desc                     Returns selected palette ID
	/// @param {Real}  [_x]       The X coordinate to check overlap (Defaults to mouse_x)
	/// @param {Real}  [_y]       The Y coordinate to check overlap (Defaults to mouse_y)
	/// @returns {Real}           Palette ID
	
	function get_palette_id(_x = mouse_x, _y = mouse_y)
	{
		for (var _i = 0; _i < palette_item_qty; ++_i)
		{
			var _x1 =  sprite_x_pos_data[_i];
			var _y1 =  sprite_y_pos_data[_i];
			var _x2 =  sprite_x_pos_data[_i] + sprite_width_data[_i];
			var _y2 =  sprite_y_pos_data[_i] + sprite_height_data[_i];
			
			if point_in_rectangle(_x, _y, _x1, _y1, _x2, _y2)
			{
				return _i;
			}
		}
	}

	/// @function step
    /// @description Execute step code for palette constructor instance
	
	static step = function()
	{
		var _pid = get_palette_id();	
		
		if _pid != undefined // If palette item is selected
		{	
			window_set_cursor(cursor_hover);
			
			
			if sprite_data[_pid] == data[STATE.ENABLED, PROPERTY.SPRITE] then set_palette_state(STATE.ENABLED_HOVER, _pid);
			if sprite_data[_pid] == data[STATE.DISABLED, PROPERTY.SPRITE] then set_palette_state(STATE.DISABLED_HOVER, _pid);
			if sprite_data[_pid] == data[STATE.INSET, PROPERTY.SPRITE] then set_palette_state(STATE.INSET_HOVER, _pid);
			
			if play_sound == undefined
			{
				audio_play_sound(sprite_sound_data[_pid], 0, false);
				
				play_sound = sprite_sound_data[_pid];
			}

			if mouse_check_button(mb_left)
			{
				if sprite_data[_pid] == data[STATE.ENABLED, PROPERTY.SPRITE] then set_palette_state(STATE.ENABLED_CLICK, _pid);
				if sprite_data[_pid] == data[STATE.DISABLED, PROPERTY.SPRITE] then set_palette_state(STATE.DISABLED_CLICK, _pid);
				if sprite_data[_pid] == data[STATE.INSET, PROPERTY.SPRITE] then set_palette_state(STATE.INSET_CLICK, _pid);
			}
			
			if mouse_check_button_pressed(mb_left)
			{
				audio_play_sound(sprite_sound_data[_pid], 0, false);
				
				spt_palette_actions(PALETTE.EXAMPLE, _pid);
				
				if sprite_inset_enabled[_pid] == true
				{
					if sprite_data[_pid] == data[STATE.ENABLED, PROPERTY.SPRITE]
					{
						set_palette_state(STATE.INSET, _pid);
					}
				
						else
					{
						if sprite_data[_pid] != data[STATE.DISABLED, PROPERTY.SPRITE]
						{
							set_palette_state(STATE.ENABLED, _pid);
						}
							else
						{
							set_palette_state(STATE.DISABLED, _pid);
						}
						
					}
				}
			}
		}
			else
		{
			play_sound = undefined;
			
			for (var _i = 0; _i < palette_item_qty; ++_i)
			{
				window_set_cursor(cursor_default);
				
				if sprite_data[_i] == data[STATE.ENABLED, PROPERTY.SPRITE] then set_palette_state(STATE.ENABLED, _i);
				if sprite_data[_i] == data[STATE.INSET_CLICK, PROPERTY.SPRITE] then set_palette_state(STATE.INSET, _i);
			}
		}
		
	}
		
	/// @function draw
    /// @description Execute draw code for palette constructor instance
	
	static draw = function()
	{
		for (var _i = 0; _i < palette_item_qty; ++_i)
		{
			draw_sprite_ext(sprite_data[_i], sprite_index_data[_i], sprite_x_pos_data[_i], sprite_y_pos_data[_i], sprite_x_scale_data[_i], sprite_y_scale_data[_i], sprite_angle_data[_i], c_white, sprite_alpha_data[_i]);
		
			var _x1 =  sprite_x_pos_data[_i];
			var _y1 =  sprite_y_pos_data[_i];
			var _x2 =  sprite_x_pos_data[_i] + sprite_width_data[_i];
			var _y2 =  sprite_y_pos_data[_i] + sprite_height_data[_i];
			
			draw_rectangle(_x1, _y1, _x2, _y2, 1);
			
		}
	}
	
	/// @description Add this newly created palette instance to the global list
	
	ds_list_add(global.palette_list,self);
}

new palette();