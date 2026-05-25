/// @function() spt_palette_actions
/// @desc												Handles actions triggered for a given palette
/// @param {Real}				_palette_id				Identifier for the palette (e.g., 0 = default palette)
/// @param {Real}				_action_id				Identifier for the action to perform for the specified palette
/// @returns {void}	

function spt_palette_actions(_palette_id, _action_id)
{
	if _palette_id == 0
	{
		switch _action_id
		{
			case 0: 
			
				sprite_data[0] = disabled_sprite;
				
				x_scale_data[0] = disabled_scale;
				y_scale_data[0] = disabled_scale;
				
				alpha_data[0] = disabled_alpha;
				alpha_data[0] = disabled_alpha;
				
				//show_message("")
			
			break;
		}
	}
}