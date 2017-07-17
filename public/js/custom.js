function like_post(id) {
    $.ajax({
        url: "post/like",
        type: "POST",
        data: { 'id': id },
        success: function(data)
        {
            $('.like-post-' + id).html(data + " Likes");
        }
    });
}



