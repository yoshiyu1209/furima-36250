document.addEventListener('DOMContentLoaded', function(){
  if ( document.getElementById('item-image')){
    const ImageList = document.getElementById('image-list');

    const createImageHTML = (blob) => {
    
      // 画像を表示するためのdiv要素を生成
      const imageElement = document.createElement('div');
      // 画像の横位置を調整するためにclassを追加↓
      // imageElement.setAttribute('class', 'center-imgs');
      // 表示する画像を生成
      const blobImage = document.createElement('img');
      blobImage.setAttribute('src', blob);
      // ファイル選択ボタンを生成
      const inputHTML = document.createElement('input')
      // 画像の高さを調整するためにclassを追加↓
      blobImage.setAttribute('class', 'center-img');
      // 生成したHTMLの要素をブラウザに表示させる
      imageElement.appendChild(blobImage);
      ImageList.appendChild(imageElement);
    };

    document.getElementById('item-image').addEventListener('change', function(e){
      // 画像が表示されている場合のみ、すでに存在している画像を削除する
      const imageContent = document.querySelector('img');
      if (imageContent){
        imageContent.remove();
      }
      const file = e.target.files[0];
      const blob = window.URL.createObjectURL(file);

      createImageHTML(blob);
    });
  }
});