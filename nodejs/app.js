const express = require('express'),
    app = express();

app.get('/product/all', (req,res) => {
    res.json(
        {
            item: [
                {'id':"1", "name":"상품1", "price":"10000", "img":"https://cdn.pixabay.com/photo/2014/08/14/14/21/shish-kebab-417994__480.jpg"},
                {'id':"2", "name":"상품2", "price":"20000", "img":"", "des":"상품 소개 예시 입니다. 상품 소개 예시 입니다. 상품 소개 예시 입니다. 상품 소개 예시 입니다. 상품 소개 예시 입니다. 상품 소개 예시 입니다. 상품 소개 예시 입니다."},
                {'id':"3", "name":"상품3", "price":"30000", "img":"https://cdn.pixabay.com/photo/2014/08/14/14/21/shish-kebab-417994__480.jpg", "des":"상품 소개 예시 입니다. 상품 소개 예시 입니다. 상품 소개 예시 입니다. 상품 소개 예시 입니다. 상품 소개 예시 입니다. 상품 소개 예시 입니다. 상품 소개 예시 입니다."},
                {'id':"4", "name":"상품4", "price":"40000"},
            ]
        }
    );
});

app.listen(3000, () => console.log("server start"));
