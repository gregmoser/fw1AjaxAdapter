/*
	Copyright (c) 2010, Greg Moser

	Licensed under the Apache License, Version 2.0 (the "License");
	you may not use this file except in compliance with the License.
	You may obtain a copy of the License at

		http://www.apache.org/licenses/LICENSE-2.0

	Unless required by applicable law or agreed to in writing, software
	distributed under the License is distributed on an "AS IS" BASIS,
	WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
	See the License for the specific language governing permissions and
	limitations under the License.
*/

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