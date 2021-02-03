$(()=>{
    $(document).on('click', '.tweet_submit', ()=>{
        $.get({
            url: '/tweets/create',
            data: {tweet: {text: $('.tweet_input').val()}}
        }).done((res)=>{
            $('.tweet_input').val('')
            $('.tweet_submit').removeClass('active')
            if(res.text.text){
                $('.wrapper-right-tweets').prepend(`
                    <div class="wrapper-right-tweets-tweet">
                        <div class="wrapper-right-tweets-tweet-left">
                            <i class="fas fa-user"></i>
                        </div>
                        <div class="wrapper-right-tweets-tweet-right">
                            <div class="wrapper-right-tweets-tweet-right-top">
                                <a class="wrapper-right-tweets-tweet-right-top-userName" href="/users/${res.user.id}">${res.user.name}</a>
                                <span class="wrapper-right-tweets-tweet-right-top-userId">${res.user.account}</span>
                                <span class="wrapper-right-tweets-tweet-right-top-time">・less than a minute</span>
                            </div>
                            <div class="wrapper-right-tweets-tweet-right-middle">
                                ${res.text.text}
                            </div>
                            <div class="wrapper-right-tweets-tweet-right-bottom">
                                <i class="far fa-comment"><span class="rep-num">0</span></i>
                                <i class="fas fa-retweet"><span class="ret-num">0</span></i>
                                <i class="far fa-heart" action="/tweets/${res.text.id}/like"><span class="hea-num">0</span></i>
                                <i class="far fa-share-square"></i>
                            </div>
                        </div>
                    </div>
                `)
            }
        })
    })
    let textarea = $('.tweet_input')
    let lineHeight = textarea.height()
    textarea.on('input', ()=>{
        if(textarea.val().length){
            $('.tweet_submit').addClass('active')
        } else {
            $('.tweet_submit').removeClass('active')
        }
        let lines = (textarea.val() + '\n').match(/\n/g).length
        textarea.height(lineHeight * lines)
    })
    // 以下の処理を追記。.fa-heart要素がクリックされた場合のイベントとして、likeアクションを動作させるための記述
    $(document).on('click', '.fa-heart', function(){
        let self = $(this)
        $.get({
            url: self.attr('action')
        }).done((res)=>{
            self.find('.hea-num').text(res.count)
            self.toggleClass('far')
                .toggleClass('fas')
            res.flag ? self.css('color','red') : self.css('color','gray')
        })
    })
})
