// CREATES A CONSTRUCTOR OR 'CLASS' FOR GENERATING 2D GRIDS //

/// @description Generate 2D grid

global.grid_list = ds_list_create();

/// @enum TEXT_STATE
/// @description Determines what format to diplay the coordinates in
/// @member NONE
/// @member NUMBER
/// @member LETTER

enum TEXT_STATE
{
    NONE,
    NUMBER,
    LETTER
}

/// @description The amount of padding between the coordinate text and the grid lines.

#macro TEXT_X_PAD 4
#macro TEXT_Y_PAD 4

/// @function() create grid
/// @constructor
/// @param {Real}				_x						Number of pixels to offset grid horizontally
/// @param {Real}				_y						Number of pixels to offset grid vertically
/// @param {Real}				_x_qty					Number of cells horizontally
/// @param {Real}				_y_qty					Number of cells vertically
/// @param {Real}				_x_size					Width of each cell in pixels
/// @param {Real}				_y_size					Height of each cell in pixels
/// @param {Real}				_x_scale				Modify the X scale of drawn tiles
/// @param {Real}				_y_scale				Modify the y scale of drawn tiles
/// @param {Real}				_x_offset				Visial horizontal offset for coordinate numbering.
/// @param {Real}				_y_offset				Visial vertical offset for coordinate numbering.
/// @param {String}				_x_coord_text			Draw horizontal coordinates in numbers, letters or none
/// @param {String}				_y_coord_text			Draw vertical coordinates in numbers, letters or none
/// @param {Asset.GMFont}		_text_font				Select the font to use when drawing coordinate text
/// @param {Constant.Colour}	_select_colour			Colour of selected text
/// @param {Constant.Colour}	_unselect_colour		Colour of non-selected text
/// @param {Constant.Colour}	_grid_colour			Grid line colour
/// @param {Asset.GMSprite}		_sprite					The sprite sheet to draw tiles from
/// @returns {Struct}									A new grid struct

function grid
(	
	_x = 0, _y = 0,
	_x_qty = 0, _y_qty = 0, 
	_x_size = 0, _y_size = 0,
	_x_scale = 0, _y_scale = 0,
	_x_offset = 0, _y_offset = 0,
	_x_coord_text = TEXT_STATE.LETTER, _y_coord_text = TEXT_STATE.NUMBER, 
	_text_font = fnt_default,
	_select_colour = c_red, _unselect_colour = c_white, _grid_colour = c_green,
	_sprite = spr_sample,
	_data
) 

constructor
{
	x = _x;
	y = _y;
	
	
	
	
	/// @function step
    /// @description Execute step code for grid constructor instance
	
	static step = function()
	{


	}
	
	/// @function draw
    /// @description Execute draw code for grid constructor instance
	
	static draw = function()
	{

	}
	
	/// @function destroy
    /// @description Execute clean-up code for grid contructor instance
	
	static destroy = function() 
	{

    }
	
	/// @description Add this newly created grid instance to the global list
	
	ds_list_add(global.grid_list,self);
}


new grid();