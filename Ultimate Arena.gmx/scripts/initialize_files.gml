///initialize_directories(directory)
//Will set directory[i] to list all of the directories
//and return number of directories

var i = 0;
var _find = file_find_first(working_directory + argument0 + "\*", 0); 

if(_find != "")
{
    
    directory[i] = _find;
    i++;
}

while (_find != "")
{
    _find = file_find_next(); 
    if(_find != "")
    {
        directory[i] = _find;
        i++;
    }
}
file_find_close();

return i;
