document.addEventListener('turbolinks:load', function() {
  document.querySelectorAll('.comment-edit-link').forEach(function(a) {
    a.addEventListener('ajax:success', function() {
      //クリックしたリンクが所属する.comment-display-blockを
      //display: noneに設定する
      var div_comment_compilation_links = a.parentNode;
      var div_comment_display_block = div_comment_compilation_links.parentNode;
      div_comment_display_block.style.display = 'none';
      //.comment-edit-blockを
      //display: blockに設定する
      var div_comment_edit_block = div_comment_display_block.nextElementSibling;
      div_comment_edit_block.style.display = 'block';
    });

    //コメント更新ボタンのクラスにイベントリスナーをセットする
    document.querySelectorAll('.comment-edit-form').forEach(function(a) {
      a.addEventListener('ajax:success', function(event) {
        [data, status, xhr] = event.detail;
        //更新したフォームが所属する.comment-edit-blockを
        //display: noneに設定する
        var div_comment_edit_block = a.parentNode;
        div_comment_edit_block.style.display = 'none';
        //フォームと同じコメントの.comment-display-blockを
        //display: blockに設定する
        var div_comment_display_block = div_comment_edit_block.previousElementSibling;
        div_comment_display_block.style.display = 'block';
      });
    });
  });
});