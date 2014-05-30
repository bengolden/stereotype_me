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
            console.log("Ajax returned properly");
            $("#rate_page").load("/rate #rate_page");
            // var newParams = $.parseJSON(response);
            // $("#voting_question").html('<p id="voting_question">' + newParams["question"] + '</p>')
            // $("#voting_on").html('<p id="voting_on">You are fucking with: ' + newParams["sampled_user_id"] + '</p>')
            // $("#hidden_user").html('<input id="hidden_user" type="hidden" name="user_id" value="' + newParams["sampled_user_id"] + '>')
            // $("#hidden_question").html('<input id="hidden_question" type="hidden" name="question_id" value="' + newParams["question_id"] + '>')
            // $(".slider_attrs").html('<span class="slider_attrs"> ' + newParams["endpoint1"] + '<input type="range" name="slider_points" min="1" max="100"> ' + newParams["endpoint2"] + '</span>')
        })
        .fail(function(){
            console.log(postData);
        });
    });
});
