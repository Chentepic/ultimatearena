///fighter_list_ui

// Whenever you click on a name in the fighter list, this is the code that runs.

var WS = global.WSCALE;
var HS = global.HSCALE;

var d = sID+1;
if (instance_number(obj_uiWindow) < 100)
{
    with (obj_uiWindowCaption) 
    {
        if(caption == global.NAMES[d] + " - Fighter \#" + string(d))
            exit;
    }
    with (zui_main()) 
    {
        create_window_fighter(d);
    }
}

