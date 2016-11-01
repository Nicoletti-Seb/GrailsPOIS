
$(document).ready(function(){

    $('.container_pictures').on('click', '.picture_form > .btn_delete_picture',
            function onDeletePicture(event){
                var $elPicture = $(event.currentTarget).parent();
                $elPicture.addClass('hide');

                var type =  $('.container_pictures').data('type');
                var idPicture = $elPicture.data('picture');

                $.ajax({
                    url: 'http://localhost:8080/ProjetPOIS/' + type +'/pictures/' + idPicture + '/delete',
                    method: 'DELETE',
                    mimeType: 'text/html',
                    success: function onSuccessDeletePicture(){
                        $elPicture.remove();
                    },
                    error: function onErrorDeletePicture(err){
                        console.error('FAILED : ' + err);
                        $elPicture.removeClass('hide');
                    }
                });
            });

});