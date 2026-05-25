// CREATES A CONSTRUCTOR OR 'CLASS' FOR GENERATING PALETTES //

/// @description Generate 2D grid

global.palette_list = ds_list_create();

/// @function() palette
/// @constructor
/// @desc												Generates palette based on parameters										
/// @param {Real}				_x_pos					Palette horizontal draw offset
/// @param {Real}				_y_pos					Palette vertical draw offset

/// @returns {Struct}									A new grid struct

function palette
(	
	_enabled_sprite = spr_example_buttons, _disabled_sprite = spr_example_buttons_disabled, _inset_sprite = spr_example_buttons_inset, _hover_sprite = spr_example_buttons, _click_sprite = spr_example_buttons,
	_enabled_sound = snd_hover, _disabled_sound = snd_disabled, _inset_sound = snd_inset, _hover_sound = snd_click, 
	_enabled_scale = 0.25, _disabled_scale = 0.25, _inset_scale = 0.23, _hover_scale = 0.24, _click_scale = 0.22,
	_enabled_angle = 0, _disabled_angle = 0, _inset_angle = 0, _hover_angle = 0, _click_angle = 0,
	_enabled_alpha = 1, _disabled_alpha = 0.9, _inset_alpha = 1, _hover_alpha = 0.99, _click_alpha = 1,
	_x_pos = 16, _y_pos = 16,
	_x_gap = 8, _y_gap = 8,
	_max_row_qty = 6
) 

constructor
{	
	// Inherited Values
	
	enabled_sprite = _enabled_sprite;
	disabled_sprite = _disabled_sprite;
	inset_sprite = _inset_sprite;
	hover_sprite = _hover_sprite;
	click_sprite = _click_sprite;
	
	enabled_scale = _enabled_scale;
	disabled_scale = _disabled_scale;
	inset_scale = _inset_scale;
	hover_scale = _hover_scale;
	hover_scale = _click_scale;
	
	enabled_alpha = _enabled_alpha;
	disabled_alpha = _disabled_alpha;
	inset_alpha = _inset_alpha;
	hover_alpha = _hover_alpha;
	hover_scale = _click_alpha;
	
	enabled_angle = _enabled_alpha;
	disabled_angle = _disabled_alpha;
	inset_angle = _inset_alpha;
	hover_angle = _hover_alpha;
	click_angle = _click_angle;
	
	click_sound = _enabled_scale;
	hover_sound = _disabled_scale;
	disabled_sound = _inset_scale;
	
	x_gap = _x_gap;
	y_gap = _y_gap;
	
	max_row_qty = _max_row_qty;
	
	// Calculated Values
	
	palette_item_qty = sprite_get_number(_enabled_sprite);
	
	initialise_palette();
	
	/// @function() initialise_palette
	/// @constructor
	/// @desc												Build default palette array										

	/// @returns {Struct}									A new grid struct
	
	function initialise_palette()
	{	
	    for (var _i = 0; _i < palette_item_qty; ++_i)
		{			
			sprite_data[_i] = enabled_sprite;
			sprite_index_data[_i] = _i;
			
			x_scale_data[_i] = enabled_scale;
			y_scale_data[_i] = enabled_scale;
			
			sprite_width_data[_i] = sprite_get_width(sprite_data[_i]) * x_scale_data[_i];
			sprite_height_data[_i] = sprite_get_height(sprite_data[_i]) * y_scale_data[_i];
			
			x_pos_data[_i] = (_i % max_row_qty) * (sprite_width_data[_i] + x_gap);
			y_pos_data[_i] = floor(_i / max_row_qty) * (sprite_height_data[_i] + y_gap);
			
			angle_data[_i] = enabled_angle;
			alpha_data[_i] = enabled_alpha;
		}
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
			var _x1 =  x_pos_data[_i];
			var _y1 =  y_pos_data[_i];
			var _x2 =  x_pos_data[_i] + sprite_width_data[_i];
			var _y2 =  y_pos_data[_i] + sprite_height_data[_i];
			
			if point_in_rectangle(_x, _y, _x1, _y1, _x2, _y2)
			{
				return _i;
			}
		}
	}
	
	function set_palette_state(_state, _id)
	{
		enum STATE
		{
		    HOVER,
			CLICK,
			ENABLED,
			DISABLED,
			INSET,
		}
		
		switch _state
		{
			case STATE.HOVER:
			
					sprite_data[_id] = hover_sprite;
					x_scale_data[_id] = hover_scale;
					y_scale_data[_id] = hover_scale;
					sprite_width_data[_id] = sprite_get_width(sprite_data[_id]) * x_scale_data[_id];
					sprite_height_data[_id] = sprite_get_height(sprite_data[_id]) * y_scale_data[_id];
					angle_data[_id] = hover_angle;
					alpha_data[_id] = hover_alpha;
			
			break;
			
			case STATE.CLICK:
			
					sprite_data[_id] = click_sprite;
					x_scale_data[_id] = click_scale;
					y_scale_data[_id] = click_scale;
					sprite_width_data[_id] = sprite_get_width(sprite_data[_id]) * x_scale_data[_id];
					sprite_height_data[_id] = sprite_get_height(sprite_data[_id]) * y_scale_data[_id];
					angle_data[_id] = click_angle;
					alpha_data[_id] = click_alpha;
			
			break;
			
			case STATE.ENABLED:
			
					sprite_data[_id] = enabled_sprite;
					x_scale_data[_id] = enabled_scale;
					y_scale_data[_id] = enabled_scale;
					sprite_width_data[_id] = sprite_get_width(sprite_data[_id]) * x_scale_data[_id];
					sprite_height_data[_id] = sprite_get_height(sprite_data[_id]) * y_scale_data[_id];
					angle_data[_id] = enabled_angle;
					alpha_data[_id] = enabled_alpha;
			
			break;
			
			case STATE.DISABLED:
			
					sprite_data[_id] = disabled_sprite;
					x_scale_data[_id] = disabled_scale;
					y_scale_data[_id] = disabled_scale;
					sprite_width_data[_id] = sprite_get_width(sprite_data[_id]) * x_scale_data[_id];
					sprite_height_data[_id] = sprite_get_height(sprite_data[_id]) * y_scale_data[_id];
					angle_data[_id] = disabled_angle;
					alpha_data[_id] = disabled_alpha;
			
			break;
			
			case STATE.INSET:
			
					sprite_data[_id] = inset_sprite;
					x_scale_data[_id] = inset_scale;
					y_scale_data[_id] = inset_scale;
					sprite_width_data[_id] = sprite_get_width(sprite_data[_id]) * x_scale_data[_id];
					sprite_height_data[_id] = sprite_get_height(sprite_data[_id]) * y_scale_data[_id];
					angle_data[_id] = inset_angle;
					alpha_data[_id] = inset_alpha;
			
			break;
		}
	}
	
	/// @function step
    /// @description Execute step code for palette constructor instance
	
	static step = function()
	{
		if mouse_check_button(mb_left)
		{
			for (var _i = 0; _i < palette_item_qty; ++_i)
			{
				set_palette_state(STATE.DISABLED, get_palette_id());
			}
		}
	}
	
	/// @function draw
    /// @description Execute draw code for palette constructor instance
	
	static draw = function()
	{
	
		for (var _i = 0; _i < palette_item_qty; ++_i)
		{
			draw_sprite_ext(sprite_data[_i], _i, x_pos_data[_i], y_pos_data[_i], x_scale_data[_i], y_scale_data[_i], angle_data[_i], c_white, alpha_data[_i]);
		}
	}
	
	/// @description Add this newly created palette instance to the global list
	
	ds_list_add(global.palette_list,self);
}


new palette();