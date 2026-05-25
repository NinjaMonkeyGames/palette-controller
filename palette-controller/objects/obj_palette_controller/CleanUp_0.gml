/// @description Cleans up the global grid list if it exists

if (ds_exists(global.palette_list, ds_type_list))
{
    ds_list_clear(global.palette_list);
    ds_list_destroy(global.palette_list);
}