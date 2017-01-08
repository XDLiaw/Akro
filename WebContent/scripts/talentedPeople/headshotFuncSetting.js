$(document).ready(function() {
	fileBrowseSetting();
});

function fileBrowseSetting() {
	$(".btn-fake-browse").click(function(){
		$(this).parents(".headShot").find("input[type=file]").trigger("click");
	});
	
	$("input[type=file]").change(function() {
		readURL(this); // display thumbnail
	});
	
	$("input[type=button].cancelSelectFile").click(function(){
		$(this).parents(".headShot").find("input[type=file]").val("");
		$(this).parents(".headShot").find("input[name='talentedPeople.base64HeadShot']").val("");
		$(this).parents(".headShot").find("img").attr('src', '');
	});
}

function readURL(input) {
    if (input.files && input.files[0]) {
        var reader = new FileReader();

        reader.onload = function (e) {
        	$(input).parents(".headShot").find("img").attr('src', e.target.result);
        }

        reader.readAsDataURL(input.files[0]);
    }
}