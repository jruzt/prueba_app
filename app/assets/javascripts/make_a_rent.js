/**
 * Created by jruz on 7/17/17.
 */
$(function(){


    $(".js-add-to-cart").click(function(event) {
        var movie_title = $(this).parent().siblings(".js-movie-name").text();
        var movie_id = $(this).parents(".js-movie").data('id');
        var msg = "¿Do you want to add " + movie_title + " to the cart?";
        if (confirm(msg) == true )
            $.ajax({
                type: "POST",
                url: "/cart_line",
                data: { movie_id: movie_id},
                dataType: 'script'
            })
    });
});