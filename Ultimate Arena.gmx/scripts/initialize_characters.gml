var i = 1;
global.cNAME = 0;

global.fNAME[0] = file_find_first(working_directory + "characters\*.ini", 0);
ini_open(working_directory + "characters\" + global.fNAME[0]);

global.cNAME[0] = ini_read_string("character","name","NAMING ERROR");
global.cSOUNDS[0] = ini_read_string("character","deathsound","");
cImage = ini_read_string("character","image","sFighterImage");

if (cImage != "sFighterImage")
    global.cIMAGES[0] = sprite_add(working_directory + "characters\" + cImage,1,0,0,0,0);
else
    global.cIMAGES[0] = sFighterImage; 
    

            
if(global.cIMAGES[0] == -1)
{
    tempSprite = sprite_duplicate(sFighterImage);
    sprite_save(tempSprite,0,working_directory + "characters\" + cImage);
    sprite_delete(tempSprite);
    global.cIMAGES[0] = sprite_add(working_directory + "characters\" + cImage,1,0,0,0,0);
}

global.TAG_COUNT=0;
global.TAG_LIST=0;
global.TAGS = 0;
var tags = ini_read_string("character","tags","");

if (tags != "")
{
    var tagcount = string_parse_number(tags,",",true);
    
    for(r = 0; r < tagcount; r++)
    {
        global.TAGS[global.TAG_COUNT] = string_extract(tags,",",r);
        global.TAG_LIST[r,0] = 0;
        global.TAG_COUNT++;
    }
}

ini_close();

global.fNAME[i] = file_find_next();

while(global.fNAME[i] != "")
{
    ini_open(working_directory + "characters\" + global.fNAME[i]);
    global.cNAME[i] = ini_read_string("character","name","NAMING ERROR");
    global.cSOUNDS[i] = ini_read_string("character","deathsound","");
    
    cImage = ini_read_string("character","image","sFighterImage");
    
    if (cImage != "sFighterImage")
        global.cIMAGES[i] = sprite_add(working_directory + "characters\" + cImage,1,0,0,0,0);
    else
        global.cIMAGES[i] = sFighterImage; 
        
    if(global.cIMAGES[i] == -1)
    {
        tempSprite = sprite_duplicate(sFighterImage);
        sprite_save(tempSprite,0,working_directory + "characters\" + cImage);
        sprite_delete(tempSprite);
        global.cIMAGES[i] = sprite_add(working_directory + "characters\" + cImage,1,0,0,0,0);
    }
    
    tags = ini_read_string("character","tags","");
    if (tags != "")
    {
        tagcount = string_parse_number(tags,",",true);
        for(r = 0; r < tagcount; r++)
        {
            var curtag = string_extract(tags,",",r);
            var notInArray = 1;
            for(c = 0;c < global.TAG_COUNT; c++)
            {
                if(global.TAGS[c] == curtag)
                {
                    notInArray = 0
                    global.TAG_LIST[c,array_length_2d(global.TAG_LIST, c)] = i;
                }
            }
            if(notInArray)
            {
                global.TAGS[global.TAG_COUNT] = curtag;
                global.TAG_LIST[global.TAG_COUNT,0] = i;
                global.TAG_COUNT++;
            }    
        }
    }
    ini_close();
    i++;
    global.fNAME[i] = file_find_next();
}

file_find_close();
global.lNAME = i;
global.fighters = i;
global.FIGHTER_COUNT = i;
