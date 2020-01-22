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
    document.querySelectorAll('.comment-update-btn').forEach(function(a) {
      a.addEventListener('ajax:success', function() {
        //クリックしたリンクが所属する.comment-display-blockを
        //display: blockに設定する
        var div_comment_compilation_links = a.parentNode;
        var div_comment_display_block = div_comment_compilation_links.parentNode;
        div_comment_display_block.style.display = 'block';
        //.comment-edit-blockを
        //display: noenに設定する
        var div_comment_edit_block = div_comment_display_block.nextElementSibling;
        div_comment_edit_block.style.display = 'none';
      });
    });
  });
});