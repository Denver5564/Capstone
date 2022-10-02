$(document).ready(function(){
	
	$.ajax({
		url : "http://localhost:8080/IceCream/try.jsp",
		type : "GET",
		success : function (denver) {
			console.log(denver);
			
			var denv1 = denver.length;
			console.log(denv1)
			},
		error : function (denver)	{
			console.log(denver);
		}
	});
});