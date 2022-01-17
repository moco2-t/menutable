document.addEventListener('turbolinks:load', function () {
  $ (function(){
    //子カテゴリー,セレクトボックスの選択
    function appendOption(child){
      var html  = `<option value=${child.id} name="food_id" form="add_form">${child.name}</option>`;
      return html;
    }
    //子カテゴリーのビュー作成
    function appendChildrenBox(insertHTML){
      var childSelectHtml = '';
      childSelectHtml = `<div class='listing-select-wrapper__added' id= 'children_wrapper'>
                          <div class='listing-select-wrapper__box'>
                          <select class="listing-select-wrapper__box--select" form="add_form">
                            ${insertHTML}
                          </select>
                          </div>
                        </div>`;
      $('.listing-product-detail__category').append(childSelectHtml);
    }

    //親カテゴリーが選択された時の処理（子カテゴリーの表示）
    $("#parent_category").on('change', function(){
      //選択された親カテゴリーの値を取得
      var parentCategory = document.getElementById('parent_category').value;
      //選択された親カテゴリーが"---"（初期設定）のままだとfalse、変わっているとtrue
      if (parentCategory != "---"){
        $.ajax({
          url: '/recipes/show_food_choices_by_category/get_category_children',
          type: 'GET',
          //コントローラーに飛ばす値です。
          data: { category: parentCategory },
          dataType: 'json'
        })
        .done(function(children){
          //まず、既に表示されている子カテゴリーを削除
          $('#children_wrapper').remove();
          //insertHTMLという変数にカテゴリーのセレクトボックスの選択肢を入れる。（一番最初の段落で設けた変数）
          var insertHTML = '';
          children.forEach(function(child){
            insertHTML += appendOption(child);
          });
          //2段落目で設定した子カテゴリーのビューの呼び出し
          appendChildrenBox(insertHTML);
        })
        .fail(function(){
          alert('カテゴリー取得に失敗しました');
        })
      }else{
        $('#children_wrapper').remove();
      }
    });
  });
})

//<select class="listing-select-wrapper__box--select">
//                              ${insertHTML}
//                          </select>