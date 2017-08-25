/**
 * Created by jruz on 8/8/17.
 */
$(function(){
    $('.js-return-rent').click(function(event){
        var rent_id = $(this).parents('.js-rent').data('id');
        if (confirm("Return rent?") == true)
            $.ajax({
                type: 'delete',
                url: 'active_rents',
                data: {rent_id: rent_id},
                dataType: 'script'
            })
    })
});