$(document).on('turbolinks:load', function() {
  // New bookのfileinput関連
  $('.custom-file-input').on('change', handleFileSelect);

  function handleFileSelect(evt) {
    $('#preview').remove();// 繰り返し実行時の処理
    $(this).parents('.input-group').after('<div id="preview"></div>');

    var files = evt.target.files;

    for (var i = 0, f; f = files[i]; i++) {
      var reader = new FileReader();
      reader.onload = (function (theFile) {
        return function (e) {
          if (theFile.type.match('image.*')) {
            var $html = [
              '<div class="d-inline-block mr-1 mt-1"><img class="img-thumbnail" src="',
              e.target.result, '" title="',
              escape(theFile.name),
              '" style="height:100px;" /><div class="small text-muted text-center">',
              escape(theFile.name),
              '</div></div>'].join('');// 画像では画像のプレビューとファイル名の表示
          } else {
            var $html = [
              '<div class="d-inline-block mr-1"><span class="small">',
              escape(theFile.name), 
              '</span></div>'].join('');//画像以外はファイル名のみの表示
          }
          $('#preview').append($html);
        };
      })(f);
      reader.readAsDataURL(f);
    }
    $(this).next('.custom-file-label').html(+ files.length + ' file select');
  }

  //ファイルの取消
  $('.reset').click(function () {
    $(this).parent().prev().children('.custom-file-label').html('Book Image...');
    $('#preview').remove();
    $('.custom-file-input').val('');
  })
  // New bookのfileinput関連/

  //bookimageのギャラリー表示
  // オプションを指定してSkipprの実行
  $("#theTarget").skippr({
    // スライドショーの変化 ("fade" or "slide")
    transition : 'slide',
    // 変化に係る時間(ミリ秒)
    speed : 1000,
    // easingの種類
    easing : 'easeOutQuart',
    // ナビゲーションの形("block" or "bubble")
    navType : 'bubble',
    // 子要素の種類("div" or "img")
    childrenElementType : 'img',
    // ナビゲーション矢印の表示(trueで表示)
    arrows : true,
    // スライドショーの自動再生(falseで自動再生なし)
    autoPlay : false,
    // 自動再生時のスライド切替間隔(ミリ秒)
    autoPlayDuration : 1000,
    // キーボードの矢印キーによるスライド送りの設定(trueで有効)
    keyboardOnAlways : true,
    // 一枚目のスライド表示時に戻る矢印を表示するかどうか(falseで非表示)
    hidePrevious : false
  });
  //bookimageのギャラリー表示/
});