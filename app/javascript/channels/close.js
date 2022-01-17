document.addEventListener('turbolinks:load', function() {

    $("#close,.account_overlay,.login_overlay").on('click', function(){
        history.back();
    })
    
    $(".login_link").on('click', function(){
        $("body").addClass(".login_overlay");
    })

    $(".account_link").on('click', function(){
        $("body").addClass(".account_overlay");

    })
})