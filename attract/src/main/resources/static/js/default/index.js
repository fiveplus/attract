function get_url(url){
	window.location.href=url;
}
function search_focus(flag){
	var div = $("#search-div");
	if(flag){
		div.css("border","1px solid #4285f4");
	}else{
		div.css("border","1px solid #eee");
	}
}

function checkMobile(str){
	var re = /^1\d{10}$/;
    if(re.test(str)){
      return true;
    }else{
      return false;
    }
}

function checkEmail(str){
    var re = /^\w+((\.\w+){0,3})@\w+(\.\w{2,3}){1,3}$/;
    if (re.test(str)) {
      return true;
    } else {
      return false;
    }
}