/**
 * Created by jruz on 7/31/17.
 */
$(function(){
    $('.js-remove').click(function(event){
        var movie_id = $(this).parents(".js-movie").data('id');
        var movie_name = $(this).parent().siblings('.js-movie-name').text();
        //var total_price = $('.js-total-price').children('strong').text();
        var msg = "¿Do you want to remove " + movie_name + " from the cart?";

        if (confirm(msg))
            $.ajax({
                type: 'delete',
                url: '/cart_line',
                data: { movie_id: movie_id },
                dataType: 'script'
            })
    });
    $('.js-remove-all').click(function(event){
        var movie_id = 'all';
        if (confirm("Do you want to remove all movies from cart?") == true)
            $.ajax({
                type: 'delete',
                url: '/cart_line',
                data: { movie_id: movie_id},
                dataType: 'script'
            })
    })

    $(".js-finish-rent").click(function(event){
        var movie_id = 'all';
        var total = $(".js-total-price").children().text();
        if (confirm("You want to finish the rent?") == true)
            $.ajax({
                type: 'post',
                url: '/rent',
                data: { movie_id: movie_id},
                dataType: 'script'
            })
    });

});
