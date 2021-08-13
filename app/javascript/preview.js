document.addEventListener('DOMContentLoaded', function(){
  if ( document.getElementById('item-image')){
    const ImageList = document.getElementById('image-list');

    const createImageHTML = (blob) => {
      const imageElement = document.createElement('div');
      // 画像の横位置を調整するためにclassを追加↓
      imageElement.setAttribute('class', 'center-imgs');

      const blobImage = document.createElement('img');

      blobImage.setAttribute('src', blob);
      // 画像の高さを調整するためにclassを追加↓
      blobImage.setAttribute('class', 'center-img');
      imageElement.appendChild(blobImage);
      ImageList.appendChild(imageElement);
    };

    document.getElementById('item-image').addEventListener('change', function(e){
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