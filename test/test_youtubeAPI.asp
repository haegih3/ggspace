<%@ Language="VBScript" %>
<% 
Dim now_host
now_host = request.servervariables("HTTP_HOST")

Call Response.AddHeader("Access-Control-Allow-Origin", now_host)
Call Response.AddHeader("Access-Control-Allow-Credentials", "true")
' Call Response.AddHeader("Access-Control-Allow-Methods: GET, POST, OPTIONS, PUT, DELETE")
' Call Response.AddHeader("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, X-Requested-With")
%>

<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="euc-kr" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1,maximum-scale=1,user-scalable=no">
    <title>TEST_youtube_API</title>
    <style>
        /* reset */
        html { font-size: 15px; }
        body { font-size: 1rem; }
        * { padding: 0; margin: 0; border: 0; box-sizing: border-box; }
        a { text-decoration: none; color: inherit; }

        /* page */
        .wrapper { max-width: 1200px; margin: 0 auto; padding: 10px; /*background: gold;*/ }

        h2 { font-size: 2rem; margin: 1em auto 1em; }
        h2 span { padding: 0 .3em; background: linear-gradient(transparent 40%, #d6fbf0 40% 80%, transparent 80%); }

        .cut_2 {
            overflow: hidden;
            text-overflow: ellipsis;
            word-wrap: break-word;
            display: -webkit-box;
            -webkit-line-clamp: 2; /* ellipsis line */
            -webkit-box-orient: vertical;

            /* webkit 엔진을 사용하지 않는 브라우저를 위한 속성. */
            /* height = line-height * line = 1.3em * 2 = 2.6em  */
            line-height: 1.3em;
            height: 2.6em;
        }

        .html5-video-container { z-index: 10; position: relative; }

        /* get */
        button { padding: 2px 3px; border: 1px solid #555; border-radius: 3px; cursor: pointer; }
        .group { display: flex; margin-bottom: 20px; margin-top: 10px; }
        /* channel */
        .box_title { align-self: center; padding: 20px; text-align: center; box-sizing: border-box; }
        .box_title a { display: block; width: 100px; }
        .box_title a span { display: block; padding-top: 20px; }
        /* .channel_logo { position: relative; width: 100%; height: 100%; border-radius: 50%; box-shadow: 2px 5px 20px -4px rgba(0,0,0,0.5), 0 -10px 15px -1px rgba(255,255,255,0.6); }
        .channel_logo::after { display: block; content: ''; position: absolute; top:0;left:0; width: 100%; height: 100%; border-radius: 50%; box-shadow: inset 0 -3px 4px -1px rgba(0,0,0,0.5), inset 0 3px 4px -1px rgba(255,255,255,0.2),inset 0 0 5px 1px rgba(255,255,255,0.8), inset 0 20px 30px 0 rgba(255,255,255,0.2); }
        .box_title a:hover .channel_logo { box-shadow: 0 5px 15px -2px rgba(0,0,0,0.6); }
        .box_title a:hover .channel_logo::after { box-shadow: inset 0 -8px 25px -1px rgb(255 255 255 / 90%), inset 0 8px 20px 0 rgb(0 0 0 / 20%), inset 0 0 5px 1px rgb(255 255 255 / 60%) } */
        .channel_logo img { display: block; width: 100%; height: 100%; border-radius: 50%; border: 1px solid #dfdfdf; }
        .channel_name { font-size: 18px; font-weight: bold; }
        /* playlist */
        .box_list { display: flex; }
        .box_list li { flex: 1; margin-left: 20px; list-style-type: none; padding: 15px; border-radius: 10px; transition: all .3s; }
        .box_list li a { display: block; }
        .box_list li a span { display: block; padding: 2px 8px; font-size: 12px; }
        .list_thumb { position: relative; width: 100%; height: 100%; }
        .list_thumb::after { display: block; opacity: 0; content: ''; width: 100%; height: 100%; position: absolute; top:0; left:0; background: rgba(0,0,0,0.3) url('/images/home/001-youtube_red.png') no-repeat center/50px 30px; transition: all .5s; }
        .list_thumb img { display: block; width: 100%; height: auto; }
        .list_title { font-weight: bold; letter-spacing: -1px; }
        .list_date { color: grey; }

        .channel_logo { position: relative; width: 100%; height: 100%; border-radius: 50%; }
        .channel_logo::after {  display: block; content: ''; position: absolute; top:0;left:0; width: 100%; height: 100%; border-radius: 50%; transition: all .3s; }
        .box_title a:hover .channel_logo::after { box-shadow: 3px 3px 15px -1px rgba(0,0,0,0.3), inset 0 -3px 6px 0 rgba(0,0,0,0.3); }
        .box_title a:hover .channel_name { text-shadow: 3px 3px 15px rgba(0,0,0,0.2); }

        /* hover */
        .box_title a:hover .channel_name { color: #0075b1; }
        .box_list li:hover { box-shadow: 3px 3px 15px -1px rgba(0,0,0,0.3), inset 0 -3px 7px 0 rgba(0,0,0,0.2); }
        .box_list li:hover .list_thumb::after { opacity: 1; }

        button {display: none;}
    </style>
    
    <!--<script type="text/javascript" src="https://www.youtube.com/iframe_api"></script>-->
    <script type="text/javascript" src="/js/jquery-1.12.4.min.js"></script>
    <script type="text/javascript">

        function resizeCpFrame(height) { var myframe = document.getElementById("iframe1");
            myframe.setAttribute("height", height);
        }

        function videoSokbo() {
    
            $.ajax({

                type: "get",
                url: "/webtest/aspBoard/inc_videoSokbo.asp",
                dataType: "html",
                async: false,
                success: function (reqData) {
                    $(".container_v").html(reqData);

                    $("#frmhyun").attr("src", $("#frmhyun").attr("data-url"));
                    $("#frmhyun_sib").attr("src", $("#frmhyun_sib").attr("data-url"));


                    videoSokbo_chk = 1;
                }, error: function (e) {
                    videoSokbo_chk = 0;
                }

            });
        }

        function getPlaylist(gbn, num, val) {
            var me = "AIzaSyD4Vw2fdwPTxWuZiLMFcT2Xss2KyDsjps4";
            var maxlists = 4;
            var commonUrl = "https://www.googleapis.com/youtube/v3/";

            if (gbn == "ch") { // 채널정보 가져오기
                
                $.ajax({
                    type: "get",
                    url: commonUrl + "channels",
                    dataType:"json",
                    data: { part: "snippet", maxResults: 1, id: val, key: me},
                    success:function(reqData){
                        if (reqData["pageInfo"]["totalResults"] >= 1) {
                            var items = reqData["items"];

                            $.each(items, function(index, item) {
                                var vUrl = "https://www.youtube.com/c/" + item["snippet"]["customUrl"],
                                    vSrc = item["snippet"]["thumbnails"]["medium"]["url"],
                                    vTitle = item["snippet"]["title"];
                                if (vTitle.indexOf("[") > 0) {
                                    vTitle = vTitle.substr(0, vTitle.indexOf("["));
                                }
                                
                                $("#title_" + num).html("<a href=''><figure class='channel_logo'><img src='' alt='로고' /></figure><span class='channel_name'></span></a>");
                                $("#title_" + num + " a").prop("href", vUrl);
                                $("#title_" + num + " .channel_name").text(vTitle);
                                $("#title_" + num + " .channel_logo img").prop("src", vSrc);
                            });
                        }
                    },
                    error:function(request, status, error){
                    //	alert("code : " +  request.status + '\r\nmessage : ' + request.responseText + '\r\nerror : ' + error);
                    }
                });

            } else if (gbn == "li") {

                $.ajax({
                    type: "get",
                    url: commonUrl + "playlistItems",
                    // dataType: "html",
                    dataType:"json",
                    data: { part: "snippet", maxResults: maxlists, playlistId: val, key: me},
                    // data: "part=snippet&maxResults" + maxlists + "&playlistId=" + val + "&key=" + me,
                    success:function(reqData){
                        // alert(reqData);
                        // var str = JSON.stringify(reqData.items);
                        // $.each(reqData, function(index, item) { // 데이터 =item
                        //     $("#list_"+num).append("[" + index + "]"); // index가 끝날때까지
                        //     $("#list_"+num).append(item + "<br>");
                        // });
                        // alert(reqData["items"]);
                        var items = reqData["items"];
                        $.each(items, function(index, item) { // 데이터 =item
                            // 셋팅
                            var vUrl = "https://www.youtube.com/watch?v=" + item["snippet"]["resourceId"]["videoId"],
                                vSrc = item["snippet"]["thumbnails"]["medium"]["url"],
                                vTitle = item["snippet"]["title"],
                                vDate = item["snippet"]["publishedAt"].substr(0,10);
                                
                            $("#list_" + num).append("<li><a href=''><figure class='list_thumb'><img class='' src='' alt='썸네일' /></figure><span class='list_title cut_2'></span><span class='list_date'></span></a></li>");
                            $("#list_" + num + " li").eq(index).children("a").prop("href", vUrl);
                            $("#list_" + num + " li").eq(index).find(".list_thumb img").prop("src", vSrc);
                            $("#list_" + num + " li").eq(index).find(".list_title").text(vTitle);
                            $("#list_" + num + " li").eq(index).find(".list_date").text(vDate);
                        });
                    },
                    error:function(request, status, error){
                    //	alert("code : " +  request.status + '\r\nmessage : ' + request.responseText + '\r\nerror : ' + error);
                    }
                });

            }
        }
    </script>
</head>

<body>
<div class="wrapper">

    <h2><span>Youtube Iframe API _ 2 video</span></h2>
    <div style="overflow: hidden; padding: 0 50px; margin-bottom: 50px;">
        <div style="float: left; width: 480px; height: 270px;">
            <div class="youtube" data-url="znAYkGAW02M"></div>
        </div>
        <div style="float: right; width: 480px; height: 270px;">
            <div class="youtube" data-url="WabdzABxRoI"></div>
        </div>
    </div>

    <script type="text/javascript">

        window.onload = function() {
            // videoSokbo();
            $(".btn_js").each(function() {
                $(this).trigger("click");
            });
            
        }

    </script>
    
    <h2><span>Youtube Search API _ 재생목록 가져오기</span></h2>
    <button type="button" class="btn_js" onclick="getPlaylist('ch','1','UCepIOLSk-tuWoD6Sgo9lZew');">지지옥션 채널 보여주기</button>
    <button type="button" class="btn_js" onclick="getPlaylist('li','1','PLovm8anK94dWkI8ZCz_YRlXZrnJJN9ccM');">재생목록보여주기</button>
    <button type="button" class="btn_js" onclick="getPlaylist('ch','2','UC6MH_2erGhx4Kc38xhtrfVQ');">고지마제이 채널 보여주기</button>
    <button type="button" class="btn_js" onclick="getPlaylist('li','2','PLhza8I5f8ZAlAkQZxSLNiHNupFthwYa94');">재생목록보여주기</button>

    <div class="group youtuber_1">
        <div class="box_title" id="title_1"></div>
        <ul class="box_list" id="list_1"></ul>
    </div>
    <div class="group youtuber_2">
        <div class="box_title" id="title_2"></div>
        <div class="box_list" id="list_2"></div>
    </div>
    <script type="text/javascript">
        var tag = document.createElement('script');
        tag.src = "https://www.youtube.com/iframe_api";
        tag.type = "text/javascript";
        var firstScriptTag = document.getElementsByTagName('script')[0];
        firstScriptTag.parentNode.insertBefore(tag, firstScriptTag);


        var idAry = [], urlAry = [], objAry = [];

        $(".youtube").each(function(i){
            $(this).prop("id", "player"+i); // 아이디 값 추가
            idAry.push("player"+i); // 아이디 값 배열에 넣기
            urlAry.push($(this).data("url")); // 동영상 url 배열에 넣기
        });

        var player;
        //플레이어의 로드를 실행
        function onYouTubeIframeAPIReady() {
            loadPlayer();
        }
        //YT.Player를 생성하는 함수
        function loadPlayer(){
            //인수로 받은 배열을 for in문으로 돌린다
            for(var i=0; i< $(".youtube").length; i++){
                var playerId = idAry[i];

                player = new YT.Player(playerId,{
                    videoId: urlAry[i],
                    host: 'https://www.youtube.com',
                    width: "100%",
                    height: "100%",
                    playerVars: {
                        // 'autoplay' : 1,
                        'controls' : 2,
                        'mute' : 1,
                        'rel' : 0,
                        'showinfo' : 0,
                        // 원하는 속성 쓰기
                        'origin' : '<%=now_host%>',
                        'enablejsapi': 1,
                    },
                    events: {
                        'onReady': onPlayerReady,
                        'onStateChange': onPlayerStateChange,
                    }
                });

                objAry.push(player); 
            }
        }

        function onPlayerReady(event) {
            if (event.target == objAry[0]) {
                event.target.playVideo();
            }
        }

        var done = false;
        function onPlayerStateChange(event) {
            // console.log(event.data);
            // event.data 종류
            // stop => -1(시작되지 않음) => 5로 넘어감
            // 0(종료됨) = YT.PlayerState.ENDED
            // 1(재생 중) = YT.PlayerState.PLAYING
            // 2(일시중지됨) = YT.PlayerState.PAUSED
            // 3(버퍼링 중) = YT.PlayerState.BUFFERING
            // 5(동영상 신호) = YT.PlayerState.CUED
            // if (event.data == YT.PlayerState.PLAYING && !done) {
            //     setTimeout(stopVideo, 6000);
            //     done = true;
            // }
            if (event.data == YT.PlayerState.PLAYING && !done) {
                // 첫실행
                objAry[0].playVideo();
                objAry[1].stopVideo();
                done = true;
            } else if (event.data == YT.PlayerState.PLAYING && done) {
                // 2번째 이후부터
                for(var i=0; i< objAry.length; i++){
                    if (objAry[i] == event.target) {
                        objAry[i].playVideo();
                        // playVideoAt() 지정위치부터 재생
                    } else {
                        if (event.data == 1) {
                            objAry[i].pauseVideo();
                        } else {
                            objAry[i].stopVideo();
                        }
                    }
                }
            }
        }

        function stopVideo() {
            player.stopVideo();
        }
    </script>

    <h2><span>썸네일 영상관련 이슈</span></h2>
    <div>
        <ul>
            <li>아래와 같은 경로를 갖음</li>
            <li>
                &lt;img id="thumbnail" alt="" class="style-scope ytd-moving-thumbnail-renderer fade-in"<br>
                src="https://i.ytimg.com/an_webp/WabdzABxRoI/mqdefault_6s.webp?du=3000&sqp=CJCgxZUG&rs=AOn4CLDc9m50iHDeJucToK_xh1gXj4ZmCQ"&gt;<br>
                src="https://i.ytimg.com/an_webp/znAYkGAW02M/mqdefault_6s.webp?du=3000&sqp=CJWKxZUG&rs=AOn4CLDyo20BcAvr4Lt8IIxIGKY_uXnIgQ"&gt;<br>
                src="https://i.ytimg.com/an_webp/8Z0di9Mi_Wc/mqdefault_6s.webp?du=3000&sqp=CIy_xZUG&rs=AOn4CLALny33EHHTgv_DhFGDkgzNY_PDQA"&gt;<br>
                <span style="padding-left: 230px;padding-right: 40px;">/ 영상ID</span>/<span style="padding-left: 198px;padding-right: 65px;">&sqp=</span>&rs=
            </li>
            <li>sqp 값과 rs 값이 필요</li>
            <li>Youtube Data Api에는 없음 (따로 가져와야할 것 같음)</li>
        </ul>
    </div>
    
<!--    <h2><span>Youtube Iframe API _ 1 video</span></h2>
    <div class="container_v"></div>
-->

</div>
</body>
</html>
