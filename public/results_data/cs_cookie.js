var TRACK_CS_COOKIE = true;

function get_cookie(name)
{
	name = name+"=";
	var content = "";
	var allcookies = document.cookie;
	//Get cookie value
	var cpos = allcookies.indexOf(name);
	if (cpos != -1)
	{	
		//cookie exists so get content
		var start = cpos + name.length;
		var end = allcookies.indexOf(";",start);
		if (end == -1) end = allcookies.length;
		content = allcookies.substring(start,end);
	}
	return content;
}

function set_cookie(name, value)
{	
	document.cookie = name+"="+value+";path=/";
}

function set_cookie_persistent(name, value)
{	
	document.cookie = name+"="+value+";expires='Thu, 02 Oct 3000 04:19:20 GMT';path=/";
}

function delete_cookie(name)
{
	document.cookie = name+"=;path=/";
}

function add_cookie(name,value)
{
	var current_value = get_cookie(name);
	if (current_value.indexOf(value) == -1)
	{
		//not in list so add value
		if (current_value == "")
			current_value = value;
		else
			current_value = current_value+","+value;
	}
	set_cookie(name,current_value);
}		

function remove_cookie(name,value)
{
	var current_value = get_cookie(name);
	value = escape(value).toLowerCase();
	if (current_value.indexOf(value) != -1)
	{
		//remove from list
		current_value = current_value.replace(","+value,"");
		current_value = current_value.replace(value+",","");
		current_value = current_value.replace(value,"");
	}
	set_cookie(name,current_value);
}		

function toggle_cookie(name,value)
{
	var current_value = get_cookie(name);
	if (current_value.indexOf(value) != -1)
	{
		//remove from list
		current_value = current_value.replace(","+value,"");
		current_value = current_value.replace(value+",","");
		current_value = current_value.replace(value,"");
	}
	else if (current_value.indexOf(value) == -1)
	{
		//not in list so add value
		if (current_value == "")
			current_value = value;
		else
			current_value = current_value+","+value;
	}
	set_cookie(name,current_value);
}		
