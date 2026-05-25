/// @description Loops through step code for each grid instance

for (var i = 0; i < ds_list_size(global.palette_list); i++)
{
    var current_instance = global.palette_list[| i];
    current_instance.step();
}