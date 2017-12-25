var videobox={
    //变量
    time1:300,//动画时间1
    time2:1000,//动画时间2
    videoHeight: $(window).height(), //窗口的高度
    videoWidth:$(window).width(),//窗口宽度
    videoHeaderHeight:60, //header固定高度
    videoContentFooter:175,
    minwinHeight:640,//浏览器最小高度
    minwinWidth:1000,//浏览器最小宽度
    defaultvalue0:"有疑问，和大家讨论下？",//讨论输入框默认提示文字
    //videoContentHeight:"",
    //初始化
    init:function(){
        this.initVar();
        this.initSize();
    },
    //初始化变量
    initVar:function(){
        videobox.$content=$(".content"); //内容
        videobox.$contentcL=$(".content-cL");//左侧
        videobox.$contentcR=$(".content-cR");//右侧
        videobox.$Rcontent=$(".R-content")
        videobox.$Rfoot=$(".R-foot")
        videobox.$LvideoFrame=$(".L-videoFrame");//视频外框
        videobox.$classroomp=$(".classroom-participants");//教室
        videobox.$viewport=$(".viewport") //右侧外框
        videobox._overview="overview";//右侧内容
        videobox.$overview=$(".overview");//右侧内容
        videobox.$Scro=$(".scrollbar") //滚动条外框
        videobox.$tabmulu=$(".ml-icon")//目录按钮
        videobox.$mulucon=$(".ml-con")//目录内容
        videobox.$tabtaolun=$(".tl-icon")//讨论按钮
        videobox.$taoluncon=$(".tl-con")//讨论内容
        videobox.$txtArea=$("#des_txt");//讨论回复.createtopic #des_txt
        videobox.$rightTextarea=$('.createtopic1');//右侧标签.createtopic
        videobox.$tabbiji=$(".bj-icon")//笔记按钮
        videobox.$bijicon=$(".bj-con")//笔记内容
        videobox.$tabxiaoxi=$(".xx-icon")//消息按钮
        videobox.$xiaoxicon=$(".xx-con")//消息内容
        videobox.$tabshizi=$(".sz-icon")//师资按钮
        videobox.$shizicon=$(".sz-con")//师资内容

    },
    //初始化页面
    initSize:function(){
        if($(window).height()>this.minwinHeight)
        {
            this.videoHeight=$(window).height();
        }else if($(window).height()<=this.minwinHeight){
            this.videoHeight=this.minwinHeight;
        }
        if($(window).width()>this.minwinWidth){
            $("html").css("overflow","hidden");
        }else{
            $("html").css("overflow","auto");
            this.videoWidth=this.minwinHeight;
        }
        //高度值计算
        videobox.$content.height(this.videoHeight-this.videoHeaderHeight);//内容块总高度
        videobox.$contentcL.height(videobox.$content.height()-15);//左侧总高度
        videobox.$LvideoFrame.height(videobox.$contentcL.height()-videobox.$classroomp.height())
        videobox.$contentcR.height(videobox.$content.height()-15);//右侧总高度

        videobox.$Rcontent.height(videobox.$contentcR.height()-videobox.$Rfoot.height()-30)
        //videobox.$LvideoFrame.height(videobox.$Rcontent.height());
        videobox.$mulucon.height(videobox.$Rcontent.height()-2);
        videobox.$taoluncon.height(videobox.$Rcontent.height()-2);
        videobox.$bijicon.height(videobox.$Rcontent.height()-1);
        videobox.$xiaoxicon.height(videobox.$Rcontent.height()-2);
        videobox.$shizicon.height(videobox.$Rcontent.height()-2);

        //videobox.videoContentHeight=videobox.$LvideoFrame.height();
        //宽度值计算
        videobox.$contentcL.width($(window).width()- videobox.$contentcR.width()-30);//左侧总宽度
    },
    //滚动条设置
    scrollmulu:function(str){
        var viewportH = str.find(".viewport");
        viewportH.height(videobox.$Rcontent.height());//右侧外框高度
        var scrollbarH=str.find(".scrollbar");
        scrollbarH.height(videobox.$Rcontent.height());//滚动条高度
        var overviewH = str.find(".overview");
        var overviewHml=str.find(".overview-mulu");
        overviewH.height(overviewHml.height());
        if(overviewHml.height()<viewportH.height()){
            overviewHml.height(viewportH.height());
        }
        if(overviewH.height()>viewportH.height()){
            str.tinyscrollbar();
        }else{
            overviewH.height(viewportH.height());
            str.tinyscrollbar();
        }
    },
    scrolltaolun:function(str){
        var viewportH = str.find(".viewport");
        viewportH.height(videobox.$Rcontent.height()-50);//右侧外框高度
        var scrollbarH=str.find(".scrollbar");
        scrollbarH.height(viewportH.height());//滚动条高度
        var overviewH = str.find(".overview");
        var overviewHml=str.find(".overview-mulu");
        overviewH.height(overviewHml.height());
        if(overviewHml.height()<viewportH.height()){
            overviewHml.height(viewportH.height());
        }
        if(overviewH.height()>viewportH.height()){
            str.tinyscrollbar();
        }else{
            overviewH.height(viewportH.height());
            str.tinyscrollbar();
        }
    },
    scrollbiji:function(str){
        var viewportH = str.find(".viewport");//笔记外框
        var scrollbarH=str.find(".scrollbar");//滚动条
        var overviewH = str.find(".overview");//内容页
        var overviewHml=str.find(".overview-biji");//滚动页
        var bijivalue=overviewHml.attr("biji");//切换值
        if(bijivalue=="0"){
            viewportH.height(videobox.$bijicon.height()-40-100);//右侧外框高度
            overviewH.height(overviewHml.height());
            scrollbarH.height(viewportH.height());//滚动条高度
        }else{
            viewportH.height(videobox.$bijicon.height()-40);//右侧外框高度
            overviewH.height(overviewHml.height());
            scrollbarH.height(viewportH.height());//滚动条高度
        }
        if(overviewHml.height()<viewportH.height()){
            overviewHml.height(viewportH.height());
        }
        if(overviewH.height()>viewportH.height()){
            str.tinyscrollbar();
        }else{
            overviewH.height(viewportH.height());
            str.tinyscrollbar();
        }
    },
    scrollHcon:function(str){
        var viewportH = str.find(".viewport");
        viewportH.height(videobox.$Rcontent.height());//右侧外框高度
        var scrollbarH=str.find(".scrollbar");
        scrollbarH.height(videobox.$Rcontent.height());//滚动条高度
        var overviewH = str.find(".overview");
        var overviewHml=str.find(".overview-con");
        overviewH.height(overviewHml.height());
        if(overviewHml.height()<viewportH.height()){
            overviewHml.height(viewportH.height()-20);
        }
        if(overviewH.height()>viewportH.height()){
            str.tinyscrollbar();
        }else{
            overviewH.height(viewportH.height());
            str.tinyscrollbar();
        }
    },
    //窗口改变执行操作
    resize:function(){
        //if(videobox.$rightTextarea.attr('value')=='1'){videobox.$rightTextarea.attr('value','3')};
        videobox.initSize();
    },
    toMulu:function(){
        videobox.$tabmulu.addClass("ml-icon-hover");
        videobox.$tabtaolun.removeClass("tl-icon-hover");
        videobox.$tabbiji.removeClass("bj-icon-hover");
        videobox.$tabxiaoxi.removeClass("xx-icon-hover");
        videobox.$tabshizi.removeClass("sz-icon-hover");
        videobox.$mulucon.show();
        videobox.$taoluncon.hide();
        videobox.$bijicon.hide();
        videobox.$xiaoxicon.hide();
        videobox.$shizicon.hide();
        videobox.scrollmulu(videobox.$mulucon);
    },
    toTaolun:function(){
        videobox.$tabmulu.removeClass("ml-icon-hover");
        videobox.$tabtaolun.addClass("tl-icon-hover");
        videobox.$tabbiji.removeClass("bj-icon-hover");
        videobox.$tabxiaoxi.removeClass("xx-icon-hover");
        videobox.$tabshizi.removeClass("sz-icon-hover");
        videobox.$mulucon.hide();
        videobox.$taoluncon.show();
        videobox.$bijicon.hide();
        videobox.$xiaoxicon.hide();
        videobox.$shizicon.hide();
        videobox.scrolltaolun(videobox.$taoluncon);
    },
    toBiji:function(){
        videobox.$tabmulu.removeClass("ml-icon-hover");
        videobox.$tabtaolun.removeClass("tl-icon-hover");
        videobox.$tabbiji.addClass("bj-icon-hover");
        videobox.$tabxiaoxi.removeClass("xx-icon-hover");
        videobox.$tabshizi.removeClass("sz-icon-hover");
        videobox.$mulucon.hide();
        videobox.$taoluncon.hide();
        videobox.$bijicon.show();
        videobox.$xiaoxicon.hide();
        videobox.$shizicon.hide();
        videobox.scrollbiji(videobox.$bijicon);
    },
    toXiaoxi:function(){
        videobox.$tabmulu.removeClass("ml-icon-hover");
        videobox.$tabtaolun.removeClass("tl-icon-hover");
        videobox.$tabbiji.removeClass("bj-icon-hover");
        videobox.$tabxiaoxi.addClass("xx-icon-hover");
        videobox.$tabshizi.removeClass("sz-icon-hover");
        videobox.$mulucon.hide();
        videobox.$taoluncon.hide();
        videobox.$bijicon.hide();
        videobox.$xiaoxicon.show();
        videobox.$shizicon.hide();
        videobox.scrollHcon(videobox.$xiaoxicon);
    },
    toShizi:function(){
        videobox.$tabmulu.removeClass("ml-icon-hover");
        videobox.$tabtaolun.removeClass("tl-icon-hover");
        videobox.$tabbiji.removeClass("bj-icon-hover");
        videobox.$tabxiaoxi.removeClass("xx-icon-hover");
        videobox.$tabshizi.addClass("sz-icon-hover");
        videobox.$mulucon.hide();
        videobox.$taoluncon.hide();
        videobox.$bijicon.hide();
        videobox.$xiaoxicon.hide();
        videobox.$shizicon.show();
        videobox.scrollHcon(videobox.$shizicon);
    },
    Playing:function(){

    },
    // 讨论输入框展开收起
    ClearDefault:function(e){
        if(e.val()==this.defaultvalue0){
            e.val('');
        };
    },
    AddDefault:function(e){
        if(e.val()==''){
            e.val(this.defaultvalue0);
        }
    },
    textareaFocus:function(){
        if(videobox.$txtArea.height()<21){
            videobox.$txtArea.stop().animate({height:'60px'},this.time1).addClass('gray');
            videobox.$rightTextarea.stop().animate({height:'120px'},this.time1,function(){videobox.$rightTextarea.css("overflow","visible");}).attr('value','1');
            $('.tl-con .viewport').stop().animate({height:videobox.$taoluncon.height()-120},this.time1,function(){
                videobox.$taoluncon.tinyscrollbar();
            });
        }
    },
    textareaBlur:function(){
        if(videobox.$txtArea.height()>59){
            if(videobox.$rightTextarea.attr('value')=='3'){
                videobox.$txtArea.stop().animate({height:'20px'},this.time1).removeClass('gray');
                videobox.$rightTextarea.stop().animate({height:'30px'},this.time1).attr('value','0');
                $('.tl-con .viewport').stop().animate({height:videobox.$taoluncon.height()-30},this.time1,function(){
                    videobox.$taoluncon.tinyscrollbar();
                });
            }else{
                videobox.$txtArea.stop().animate({height:'20px'},this.time1).removeClass('gray');
                videobox.$rightTextarea.stop().animate({height:'30px'},this.time1).attr('value','0');
                $('.tl-con .viewport').stop().animate({height:videobox.$taoluncon.height()-40},this.time1,function(){
                    videobox.$taoluncon.tinyscrollbar();
                });
            };
        }
        //videobox.playVideo();
    }

}
$(function(){
    //获取数据参数
    var videourl= $("#videourl").val();
    var coursewareid=$("#coursewareId").val();
    var stucwid=$("#stucwid").val();
    var accountid=$("#accountId").val();
    var csHour=$("#csHour").val();
    var cwHour=$("#cwHour").val();
    var userName=$("#userName").val();
    var exams=prames(videourl,"exam");
    var exam=eval(""+exams+"");

	

    //初始化
    videobox.init();
    videobox.toMulu();
    $(window).bind("resize",function(){videobox.resize();});
    videobox.$tabmulu.on("click",function(){videobox.toMulu();});//切换到目录
    videobox.$tabtaolun.on("click",function(){videobox.toTaolun();});//切换到讨论
    videobox.$tabbiji.on("click",function(){videobox.toBiji();});//切换到笔记
    videobox.$tabxiaoxi.on("click",function(){videobox.toXiaoxi();});//切换到消息
    videobox.$tabshizi.on("click",function(){videobox.toShizi();});//切换到师资
    //创建讨论获取焦点
    videobox.$txtArea.on('focus',function(event){
        videobox.ClearDefault($(videobox.$txtArea));
        videobox.textareaFocus();
        $(document).one("click",function(e){
            if(e.target.id=='videoplay'){
                //videobox.playVideo();
                event.stopPropagation();
            }else{
                videobox.AddDefault($(videobox.$txtArea));
                videobox.textareaBlur();
            }

        });
        event.stopPropagation();
    });
    videobox.$rightTextarea.click(function(event){
        event.stopPropagation();
    });
    //初始化视频
    PlayVideo(videourl,stucwid);
    jwplayer().onReady(function (){
        initHandler();
    });
    //列表播放
    var userAmount=$("#userAmount").val();
    var renewalPrice=$("#renewalPrice").val();
    var xuqi=userAmount-renewalPrice;
    videobox.$mulucon.find("dl").each(function(i){
        $(this).find("dt a").on("click",function(){
            var cwid=$(this).attr("id");
            var begindate=$(this).attr("begindate");
            var title=$(this).attr("title");
            if(begindate<=60){
                window.location.href=requestpath+"/member/DjStucw/play.do?stucwid="+cwid;
            }else{
                if(xuqi>0){
                    jwplayer().pause();
                    $(".yq-xq").fadeIn("fast");
                    $(".full").show();
                    $(".yq-xq .xqtitle").html("您即将为<span>"+title+"</span>续期60天");
                    $(".yq-btn").attr("href",""+requestpath+"/member/userRenewal.do?stucwId="+cwid+"&play=1");
                }else{
                    jwplayer().pause();
                    $(".wq-xq").fadeIn("fast");
                    $(".full").show();
                    $(".wq-xq .xqtitle").html("您即将为<span>"+title+"</span>续期60天");
                    $(".wq-btn-alipay").attr("href",""+requestpath+"/member/payment/toAlipay.do?bankType=alipay&productName=课程续期&amount="+renewalPrice+"&stucwId="+cwid+"&url="+requestpath+"/member/DjStucw/play.do?stucwid="+cwid);
                    $(".wq-btn-kuaiqian").attr("href",""+requestpath+"/member/payment/toAlipay.do?bankType=kuaiqian&productName=课程续期&amount="+renewalPrice+"&stucwId="+cwid+"&url="+requestpath+"/member/DjStucw/play.do?stucwid="+cwid);
                }
            }
        })
    });
    $(".xqclose").on("click",function(){
        $(".yq-xq").fadeOut("slow");
        $(".wq-xq").fadeOut("slow");
        $(".full").fadeOut("slow");
        jwplayer().play();
    });
    //播放器初始话后调用的方法，这样可以避免在播放器还在加载的过程中就使用player对象
    var initHandler = function() {
        //上次播放时间，单位为秒
        if (prames(videourl,"curtime") != ""&&parseInt(prames(videourl,"curtime"))>1) {
            if (confirm("您上次听了"+parseInt(prames(videourl,"curtime"))+"分钟，是否接着听？")){
                jwplayer().play();
                seek();
            } else {
                jwplayer().play();
            }
        } else {
            jwplayer().play();
        };
        //防止缓冲造成不能seek
        function seek(){
            var id=0;
            id=window.setInterval(function(){
                if(isPlaying()){
                    jwplayer().seek(parseFloat(prames(videourl,"curtime"))*60);
                    window.clearInterval(id);
                }
            },650);
        };
        //弹窗做题计时器
        var popTime=0;
        //课件记时，记时策略为取页面停留时间加上次播放时间和播放器时间两者的最小值
        window.setInterval(function() {
                if (isPlaying()) {
                    $.ajax({
                        type: "GET",
                        url:""+requestpath+"/cwUpdateTime.do?stucwid=" + prames(videourl,"id") +"&userName=" + userName +"&csHour="+csHour  +"&cwHour="+cwHour +"&accountid="+accountid + "&curtime=" + jwplayer().getPosition(),
                        cache: false,
                        dataType: "html"
                    });
                    popTime++;
                    if(popTime==21){//弹窗做题
                        $(".full").height($(document).height());
                        jwplayer().setFullscreen(false);
                        jwplayer().pause();
                        $(".bb").fadeIn("fast");
                        $(".full").show();
                    }
                }
            },
            60000);
    };
    //时间线部分
    var currentTimeLine = 0; //当讲义发生改变是记录一个时间，以便于跟播放器的时间进行比较
    //控制播放器
    function playing(timeLine) {
        if (jwplayer().getPosition() > 0 && timeLine != "") {
            jwplayer().seek(convertToSecond(timeLine));
        }
    };
    //将时间线转成秒
    function convertToSecond(_timeLine) {
        var timeLine = _timeLine.split(":");
        return timeLine[0] * 60 * 60 + timeLine[1] * 60 + timeLine[2] * 1;
    };
    //判断视频是否正在播放
    function isPlaying(){
        return jwplayer().getState()=="PLAYING";
    };
    //笔记文本框随着字数的多少框大小变化
    var text = document.getElementById("biji_box"); //用户看到的文本框
    var shadow = document.getElementById("biji_boxhidden"); //隐藏的文本框
    var bijiformpos=document.getElementById("bijiformpos");
    text.oninput = //非IE的
        text.onpropertychange = //IE的
            onchange;
    function onchange() {
        shadow.value = text.value;
        setHeight();
        setTimeout(setHeight, 0); //针对IE 6/7/8的延迟, 否则有时会有一个字符的出入
        function setHeight() {
            if(shadow.scrollHeight<400){
                text.style.height = shadow.scrollHeight- 10 + "px";
                bijiformpos.style.height=shadow.scrollHeight + "px";
            }else{
                text.style.height = 400+"px";
                bijiformpos.style.height=400+"px";
                text.style.overflow="auto";
            }
        }
    };
    //笔记提交
    var btnStatus = 0;
    $('#send_btn').bind("click",function(){
        if(btnStatus==0){
            btnStatus==1;
        }else{
            return ;
        }
        btnStatus = 1;
        var content = $('#biji_box').val();
        var nbTotaltime = jwplayer().getPosition();
        if(content==null||$.trim(content)==""){
            //$("#commentEmptyWindow").dialog("open");
            $('#biji_box').focus();
            btnStatus = 0;
            alert("请您输入笔记内容！");
        }else if(CharacterVerification(content)>400){
            //$('#commentLengthWindow').dialog("open");
            $('#biji_box').focus();
            btnStatus = 0;
            alert("您输入笔记内容不能超过200字！");
        }else{
            $.ajax({
                type: "POST",
                url: ""+requestpath+"/ajaxmember/o_notebook.do",
                data: {'title':content,'content':content,'coursewareId':coursewareid,'nbTotaltime':nbTotaltime},
                async:false,
                dataType: "json",
                success: function(data){
                    $(".overview-biji").html("");
                    $.each(data,function(index,item){
                        $(".overview-biji").append("<dl class='bijidl'><dt class='clearfix'><span class='bijitime'><code class='icon-round'></code>"+item.nbTotaltimefmt+"</span><a href='javascript:void(0);' class='bijititle'>"+item.realName+"</a></dt><dd class='notebookid'  notebookid="+item.notebookId+">"+item.title+"</dd><dd class='clearfix'><span class='bijidate'>"+item.nbCreattime+"</span><a href='javascript:void(0)' class='bijipraise'><em>（"+item.browseCount+"）</em></a> </dd></dl><div class='biji-line'></div>");
                    })
                }
            })

            $('#biji_box').val("");
            btnStatus = 0;
        }
    });
    //笔记切换（我的笔记、最新笔记、最热笔记）
    $("#mybiji,#uptodatebiji,#hottestmybiji").on("click",function(){
        var sortColumns=$(this).attr("sortColumns");
        $.ajax({
            type: "POST",
            url: ""+requestpath+"/ajaxmember/findnotebook.do",
            data: {'title':sortColumns,'coursewareId':coursewareid},
            async:false,
            dataType: "json",
            success: function(data){
                $(".overview-biji").html("");
                $.each(data,function(index,item){
                    $(".overview-biji").append("<dl class='bijidl'><dt class='clearfix'><span class='bijitime'><code class='icon-round'></code>"+item.nbTotaltimefmt+"</span><a href='javascript:void(0);' class='bijititle'>"+item.realName+"</a></dt><dd class='notebookid'  notebookid="+item.notebookId+">"+item.title+"</dd><dd class='clearfix'><span class='bijidate'>"+item.nbCreattime+"</span><a href='javascript:void(0)' class='bijipraise' id='"+item.notebookId+"' onClick='bijipraise("+item.notebookId+");'><em>（"+item.browseCount+"）</em></a> </dd></dl><div class='biji-line'></div>");
                })
            }
        })
        $(this).addClass("tablihover").siblings().removeClass("tablihover");
        if(sortColumns=="my"){
            $(".overview-biji").attr("biji","0");
        }else{
            $(".overview-biji").attr("biji","1");
        }
        videobox.scrollbiji(videobox.$bijicon);
    });

    //讨论
    $('#btn_faqitaolun').bind("click",function(){
        if(btnStatus==0){
            btnStatus==1;
        }else{
            return ;
        }

        btnStatus = 1;
        var content = $('#des_txt').val();
        var courseGroupId = $('#courseGroupId').val();
        var accountId =$('#accountId').val();
        if(content==null||$.trim(content)==""){
            //$("#commentEmptyWindow").dialog("open");
            $('#des_txt').focus();
            btnStatus = 0;
            alert("请您输入讨论内容！");
        }else if(CharacterVerification(content)>400){
            //$('#commentLengthWindow').dialog("open");
            $('#des_txt').focus();
            btnStatus = 0;
            alert("您输入讨论内容不能超过200字！");
        }else{
            $.post(''+requestpath+'/ajaxmember/o_groupmessage.do',{'content':content,'coursewareName':courseGroupId,'userName':accountId},function(data){
                $(".tl-ul").html("");
                $.each(JSON.parse(data),function(index,item){
                    if(item.account_id == accountId){
                        if(item.icon==""||item.icon==null){
                            $(".tl-ul").append("<li class='clearfix'><div class='tl-portraitimg fR'><img src='"+requestpath+"/videoplay/images/video/photo1.jpg' alt='' width='30' height='30'><code class='icon-triangle02'></code></div><div class='tl-content fR mr10'><div class='clearfix'><span class='tl-time fR'>"+item.createtime+"</span></div><div class='tl-neir tl-neirB'>"+item.content+"</div></div></li>");
                        }else{
                            $(".tl-ul").append("<li class='clearfix'><div class='tl-portraitimg fR'><img src='"+casPath+"/photo/"+item.icon+"' alt='' width='30' height='30'><code class='icon-triangle02'></code></div><div class='tl-content fR mr10'><div class='clearfix'><span class='tl-time fR'>"+item.createtime+"</span></div><div class='tl-neir tl-neirB'>"+item.content+"</div></div></li>");
                        }
                    }else{
                        if(item.icon==""||item.icon==null){
                            $(".tl-ul").append("<li class='clearfix'><div class='tl-portraitimg fL'><img src='"+requestpath+"/videoplay/images/video/photo2.jpg' alt='' width='30' height='30'><code class='icon-triangle01'></code></div><div class='tl-content fL ml10'><div class='clearfix'><span class='tl-title fL'>"+item.name+"</span><span class='tl-time fR'>"+item.createtime+"</span></div><div class='tl-neir'>"+item.content+"</div></div></li>");
                        }else{
                            $(".tl-ul").append("<li class='clearfix'><div class='tl-portraitimg fL'><img src='"+casPath+"/photo/"+item.icon+"' alt='' width='30' height='30'><code class='icon-triangle01'></code></div><div class='tl-content fL ml10'><div class='clearfix'><span class='tl-title fL'>"+item.name+"</span><span class='tl-time fR'>"+item.createtime+"</span></div><div class='tl-neir'>"+item.content+"</div></div></li>");
                        }
                    };
                })
            });
            $('#des_txt').val("");
            btnStatus = 0;
        }
    });
    //师资对老师的头衔,职位分割
    var szpost=$("#szpost").val();
    var szposts=[];
    szposts=szpost.split("，");
    for(var i=0;i<szposts.length;i++){
        $("#szposts").append(szposts[i]+"<br/>");
    };
    //taoLunSetInterval();
    //setInterval("taoLunSetInterval()",180000);
    //手机二维码
//    $(".seat").on("click",function(){
//        $(this).find("span").hide();
//        alert(0);
//        alert($(this).find("span").html());
//    });
    $('.seat').hover(
            function(){
                var tou=$(this).find("div").attr("tou");
                if(tou=="touy"){
                    $(this).find("span").show();
                }
            },function(){
                $(this).find("span").hide();
    });
    $('.phone').unbind().bind({
        'mouseenter': function(){
            $(".phone-erwm").show();
        },
        'mouseleave': function(){
            $(".phone-erwm").hide();
        }
    });
    //考试部分
    if(exam!=null){
        var div="";
        for(s in exam){
            div+="<div class='qs'>"+(parseInt(s)+1)+"、"+exam[s].q+"</div>";
            div+="<div class='huida'><div class='xz'>";
            for(a in exam[s].a){
                div+="<span><input name='qa"+s+"' type='radio' value='"+exam[s].a[a].yn+"' hidval='"+s+"'/>"+exam[s].a[a].xx+"</span>";
            }
            div+="</div><div class='taf"+s+"'></div></div>";
        }
        $("#ex").html(div);
    };
    $("#ex input").on("click",function(){
        if($(this).val()=="true")
            $(".taf"+$(this).attr("hidval")).html("<div class='zhengque'>正确</div>");
        else
            $(".taf"+$(this).attr("hidval")).html("<div class='cuowu'>错误 /请重新选择</div>");

    });
    $(".but").on("click",function(){
        for(var i=0;i<$(".qs").length;i++){
            if($("input[name=qa"+i+"]:checked").val()!="true"){
                alert("请将题目全部填写正确后才能继续听课。");
                return false;
            }
        }
        $(".bb").fadeOut("slow");
        $(".full").fadeOut("slow");
        jwplayer().play();
    });

    $(window).resize(function(){
        $(".full").height($(document).height());
    });
})
//点赞
function bijipraise(id){
    var notebookid=id;
    var keywords=$(".tablihover").attr("sortcolumns");
    var browsecount="";
    $.ajax({
        type: "POST",
        url: ''+requestpath+'/ajaxmember/up_notebook.do',
        data: {'notebookId':notebookid,'keywords':keywords},
        async:false,
        dataType: "json",
        success: function(data){
            if(data.status==-1){
                alert(data.info);
                browsecount=data.browseCount;
            }else if(data.status==1){
                alert(data.info);
                browsecount=data.browseCount;
            }else if(data.status==0){
                alert(data.info);
                browsecount=data.browseCount;
            }
        }
    });
    $("#"+id+"").find("em").html("（"+browsecount+"）");
};
//间隔执行 讨论函数
function taoLunSetInterval(){
    var courseGroupId = $('#courseGroupId').val();
    var accountId =$('#accountId').val();
    var csid=$('#csid').val();
    $.post(''+requestpath+'/ajaxmember/findgroupmessage.do',{'coursewareName':courseGroupId,'title':csid,'shoolclassName':accountId},function(data) {
        $(".tl-ul").html("");
        var data = JSON.parse(data);
        $.each(data.messaes, function (index, item) {
            if (item.account_id == accountId) {
                if (item.icon == ""||item.icon==null) {
                    $(".tl-ul").append("<li class='clearfix'><div class='tl-portraitimg fR'><img src='" + requestpath + "/videoplay/images/video/photo1.jpg' alt='' width='30' height='30'><code class='icon-triangle02'></code></div><div class='tl-content fR mr10'><div class='clearfix'><span class='tl-time fR'>" + item.createtime + "</span></div><div class='tl-neir tl-neirB'>" + item.content + "</div></div></li>");
                } else {
                    $(".tl-ul").append("<li class='clearfix'><div class='tl-portraitimg fR'><img src='"+casPath+"/photo/"+item.icon+"' alt='' width='30' height='30'><code class='icon-triangle02'></code></div><div class='tl-content fR mr10'><div class='clearfix'><span class='tl-time fR'>" + item.createtime + "</span></div><div class='tl-neir tl-neirB'>" + item.content + "</div></div></li>");
                }
            } else {
                if (item.icon == ""||item.icon==null) {
                    $(".tl-ul").append("<li class='clearfix'><div class='tl-portraitimg fL'><img src='" + requestpath + "/videoplay/images/video/photo2.jpg' alt='' width='30' height='30'><code class='icon-triangle01'></code></div><div class='tl-content fL ml10'><div class='clearfix'><span class='tl-title fL'>" + item.name + "</span><span class='tl-time fR'>" + item.createtime + "</span></div><div class='tl-neir'>" + item.content + "</div></div></li>");
                } else {
                    $(".tl-ul").append("<li class='clearfix'><div class='tl-portraitimg fL'><img src='"+casPath+"/photo/"+item.icon+"' alt='' width='30' height='30'><code class='icon-triangle01'></code></div><div class='tl-content fL ml10'><div class='clearfix'><span class='tl-title fL'>" + item.name + "</span><span class='tl-time fR'>" + item.createtime + "</span></div><div class='tl-neir'>" + item.content + "</div></div></li>");
                }
            }
            ;
        });
//        //座位排序
        $(".classroom-participants-c .seat").each(function(index){
            if(index<=6){
                var aa=50;
                if(index==0){
                    $(this).css("left",aa+"px");
                }else{
                    $(this).css("left",50 + index*78+"px");
                }
            }else{
                var bb=12;
                $(this).css("z-index","100");
                $(this).css("bottom","7px");
                $(this).css("left",bb + (index-7)*78+"px");
            }
            if(data.stumem.length > index){
                if(data.stumem[index].sex=="0"){
                   $(this).html("<div class='seat-img' tou='touy'><img src='/videoplay/images/video/gr_1.png' width='66px' height='80px'><span class='seatpopbox'>"+data.stumem[index].realname+"</span><span class='icon-j'></span></div>");
                }else{
                    $(this).html("<div class='seat-img' tou='touy'><img src='/videoplay/images/video/man_1.png' width='66px' height='80px'><span class='seatpopbox'>"+data.stumem[index].realname+"</span><span class='icon-j'></span></div>");
                }
            }else{
                $(this).html("<div class='seat-img' tou='tounull'><img src='/videoplay/images/video/man.png' width='66px' height='80px'><span class='seatpopbox'>此位暂空</span><span class='icon-j'></span></div>");
            }
          })
   });
};

//获取URL参数的方法
var pram = function(pName) {
    var prams = location.search.substr(1, location.search.length);
    prams = StringUtil.Base64Decode(decodeURIComponent(prams)).split("&");
    for (var i = 0; i < prams.length; i++) {
        if (prams[i].split("=")[0] == pName) return prams[i].split("=")[1];
    }
    return "";
};
var GetQueryString = function(name) {
    var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)", "i");
    var r = window.location.search.substr(1).match(reg);
    var context = "";
    if (r != null)
        context = r[2];
    reg = null;
    r = null;
    return context == null || context == "" || context == "undefined" ? "" : context;
};
var prames = function(url,pName) {
    var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)", "i");
    var prams = url;
    prams = StringUtil.Base64Decode(decodeURIComponent(prams)).split("&");
    for (var i = 0; i < prams.length; i++) {
        if (prams[i].split("=")[0] == pName) return prams[i].split("=")[1];
    }
    return "";
};
//视频播放
function PlayVideo(videourl,stucwid){
	var csHour=$("#csHour").val();
    var cwHour=$("#cwHour").val();
    var playurl=prames(videourl,"url");
    var id=prames(videourl,"id");
    var userName=$("#userName").val();
    var key="";
	$.ajax({
		type:"POST",
		url:""+requestpath+"/cwAjax.jsp",
		async:false,
		cache:false,
		success:function(msg){
			key=$.trim(msg);
		}
	});
    jwplayer('playerContent').setup({
        flashplayer: ctx+'/videoplay/images/video/player.swf',
        file:playurl+"?key="+key,
        //file:url,
        image: 'images/pause.jpg',
        backcolor: '25252e',
        frontcolor: 'cfd5db',
        lightcolor: '2163db',
        controlbar: 'bottom',
        width: '100%',
        height: '100%',
        status: prames(videourl,"status"),
        type:"http",
//         events: {
//            onComplete: function() {
//                $.ajax({
//                    type: "GET",
//                    url:""+requestpath+"/cwUpdateTime.do?stucwid=" +  id  +"&userName=" + userName +"&csHour="+csHour +"&cwHour="+cwHour + "&curtime=" + -1,
//                   cache: false,
//                    dataType: "html"
//                });
//            }
//        }
    });
    videobox.$mulucon.find("dl").each(function(){
        $(this).find("dt a").removeClass("mulutitlehover");
        $(this).find("dt a code").removeClass("icon-roundhover");
        $(this).find("dt span").removeClass("mulutimehover");
        if($(this).find("dt a").attr("id")==stucwid){
            $(this).find("dt a").addClass("mulutitlehover");
            $(this).find("dt a code").addClass("icon-roundhover");
            $(this).find("dt span").addClass("mulutimehover");
        }
    })
};
//字符验证
function CharacterVerification(character) {
    //汉字的个数
    var str = (character.replace(/\w/g, "")).length;
    //非汉字的个数
    var abcnum = character.length - str;
    var total = str * 2 + abcnum;
   
}