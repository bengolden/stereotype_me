$(document).ready(function() {
  $(document).on("submit", "#rate", function(e) {
        e.preventDefault();
        var postData = $("#rate").serialize();
        $.ajax({
            type: "POST",
            url : "/rate",
            data : postData,
        })
        .done(function(response) {
            $("#rate_page").load("/rate #rate_page");
        })
        .fail(function(){
        });
    });
});
