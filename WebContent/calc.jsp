<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">
	input{
		margin:2px;
		width:100px;
		height:100px;
	}
	#calc_text{
		width:440px;
	}
</style>
<script src="jquery-2.2.0.min.js"></script>
<title>Insert title here</title>
</head>
<body>
<form action="ajax.jsp" method="get">
	<input type="text" id="calc_text" name= "calc_text" disabled="disabled">
</form>
	<input type="button" id="ce" value="ce">
	<input type="button" id="c" value="c">
	<br>
	<input type="button" id="7" value="7">
	<input type="button" id="8" value="8">
	<input type="button" id="9" value="9">
	<input type="button" id="/" value="/">
	<br>
	<input type="button" id="4" value="4">
	<input type="button" id="5" value="5">
	<input type="button" id="6" value="6">
	<input type="button" id="*" value="*">
	<br>
	<input type="button" id="1" value="1">
	<input type="button" id="2" value="2">
	<input type="button" id="3" value="3">
	<input type="button" id="-" value="-">
	<br>
	<input type="button" id="0" value="0">
	<input type="button" id="." value=".">
	<input type="button" id="+" value="+">
	<input type="button" id="=" value="=">
</body>
<script type="text/javascript">
	var resetVal = false;
	$("input[type='button']").on("click", function() {
		
		var clickValue = $(this).val();
		var calcText = $("#calc_text");
		
		if(resetVal){
			calcText.val(clickValue);
			resetVal = false;
		}
		else{
			calcText.val(calcText.val()+clickValue);
		}
		if(clickValue=="ce" || clickValue=="c"){
			calcText.val("");
		}
		if(clickValue=="="){
			resetVal = true;
			$.ajax({
				url:"ajax.jsp",
				data:{
					calc_text:encodeURIComponent(calcText.val())
				},
				success:function(data){
					calcText.val(data);
				},
				error:function(data){
					calcText.val("오류");
				}
			});
		}
	});
</script>
</html>