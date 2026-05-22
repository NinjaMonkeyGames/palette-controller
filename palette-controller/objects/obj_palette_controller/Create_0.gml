// CREATES A CONSTRUCTOR OR 'CLASS' FOR GENERATING PALETTES //

/// @description Generate 2D grid

global.palette_list = ds_list_create();

/// @function() create palette
/// @constructor

/// @param {Real}				_x_pos					Palette horizontal draw offset
/// @param {Real}				_y_pos					Palette vertical draw offset

/// @returns {Struct}									A new grid struct

function palette
(	
	_x_pos = 16, _y_pos = 16,
) 

constructor
{	
	initialise_palette();
	
	// Initialise Default Palette Values
	
	function initialise_palette()
	{	
	    
	}
	
	/// @function step
    /// @description Execute step code for palette constructor instance
	
	static step = function()
	{
		
	}
	
	/// @function draw
    /// @description Execute draw code for palette constructor instance
	
	static draw = function()
	{
		
	}
	
	/// @description Add this newly created palette instance to the global list
	
	ds_list_add(global.palette_list,self);
}


new palette();