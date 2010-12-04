var fw1ar = 0;
function fw1AjaxFormSubmit(oForm){
	fw1ar = fw1ar + 1;
	var fw1tr = fw1ar;
	
	var rds = '.svo' + oForm.elements["action"].value.replace(":","").replace(".","");
	
	$.ajax({
		type: "get",
		url: "/org/gregmoser/fw1AjaxAdapter.cfc",
		data: {
			method: "slatFormSubmit",
			argumentCollection: JSON.stringify($(oForm).serializeObject()),
			returnFormat: "json"
		},
		dataType: "json",
		success: function(results){
			if (fw1tr = fw1ar) {
				$(rds).replaceWith(results);
			}
	}});
	return false;
}

$.fn.serializeObject = function(){
    var o = {};
    var a = this.serializeArray();
    $.each(a, function() {
        if (o[this.name]) {
            if (!o[this.name].push) {
                o[this.name] = [o[this.name]];
            }
            o[this.name].push(this.value || '');
        } else {
            o[this.name] = this.value || '';
        }
    });
    return o;
};