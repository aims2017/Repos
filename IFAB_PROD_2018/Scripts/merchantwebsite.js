/**
 * 
 */
function getData()
{
	var d = new Date();
	var n = d.getTime();
	var orderID = n +  '' +randomFromTo(0,1000);
	
	document.getElementById("hdnOrderID").value = orderID;
	return true;
}

function randomFromTo(from, to){
    return Math.floor(Math.random() * (to - from + 1) + from);
 }

function postData(linkurl, data)
{
	
	var parameters = data.split(",");
	for(var i = 0; i < parameters.length; ++i)
	{
		var dynInput = document.createElement("input");
		dynInput.setAttribute("type", "hidden");
		dynInput.setAttribute("id", parameters[i]);
		dynInput.setAttribute("name",parameters[i] );
		++i;
		dynInput.setAttribute("value", parameters[i]);

		document.forms[0].appendChild(dynInput);
	}
	document.forms[0].action =linkurl;
	document.forms[0].submit();

}