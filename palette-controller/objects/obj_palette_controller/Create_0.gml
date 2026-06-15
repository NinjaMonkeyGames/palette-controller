// CREATES A CONSTRUCTOR OR 'CLASS' FOR GENERATING PALETTES //

/// @description Generate 2D grid
// Changed from ds_list_create() to a native array literal
global.palette_list = []; 

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

/// @function palette(_palette_data)
/// @constructor
/// @desc                         Generates a palette (grid of buttons) based on parameters.
/// @param {Struct}   _palette_data  Data containing palette properties
/// @returns {Struct}                A new palette/grid struct
function palette(_palette_data = PALETTE.EXAMPLE) constructor
{
    spt_palette_properties(_palette_data);
    
	


    function set_palette_state(_state, _id)
    {
        // State switching logic goes here
    }

    /// @function step
    /// @description Execute step code for palette constructor instance
	
    static step = function()
    {
        show_message("");
    }
        
    /// @function draw
    /// @description Execute draw code for palette constructor instance
	
    static draw = function()
    {
        for (var _i = 0; _i < palette_item_qty; ++_i)
        {
            // draw_sprite_ext(sprite_data[_i], sprite_index_data[_i], sprite_x_pos_data[_i], sprite_y_pos_data[_i], sprite_x_scale_data[_i], sprite_y_scale_data[_i], sprite_angle_data[_i], c_white, sprite_alpha_data[_i]);
        }
    }
	
    array_push(global.palette_list, self);
}

new palette();