$(document).on('ready page:load', function () {
	$(".show-more a").on("click", function() {
	    var $this = $(this); 
	    var $content = $this.parent().prev("div.content");
	    var linkText = $this.text().toUpperCase();    
	    
	    if(linkText === "SHOW MORE"){
	        linkText = "Show less";
	        $content.switchClass("hideContent", "showContent", 400);
	    } else {
	        linkText = "Show more";
	        $content.switchClass("showContent", "hideContent", 400);
	    };

	    $this.text(linkText);
	});

    $('select').material_select();
    
    $('.materialboxed').materialbox();
});