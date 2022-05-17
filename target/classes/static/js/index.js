$(document).ready(function() {
    $("#steps-menu a").click(function(event) {
        // Replaces main content
        event.preventDefault();
        $(this).parent().addClass("is-active");
        $(this).parent().siblings().removeClass("is-active");
        var step = $(this).attr("href");
        $(".step-content").not(step).css("display", "none");
        $(step).fadeToggle();
        
        // Rotates the wheel
        $("#steps-menu").removeClass();
        var stepClass = step.charAt(6);
        $("#steps-menu").addClass("step-" + stepClass);
        switch((stepClass-0)){
            case 1:
            $("#title").text("全网监测");
            $("#content1").text("通过对8000+主流网络媒体进行检测，其中包括各大新闻门户网站、论坛、贴吧、博客、视频、新浪微博以及微信平台文章等，对其进行信息采集及汇总整理，获取一切您想要的信息。");
            $("#content2").text("abc");
            break;
        case 2:
            $("#title").text("情感判断");
            $("#content1").text("通过探宝中文语义分析技术，对公众面对特定品牌、网络事件、宣传活动、名人等的正面、负面及中性的情绪进行分析，让您通过口碑趋势洞察消费者、网民的情感态度，进一步作出营销决策。");
            $("#content2").text("sdf");
            break; 
        case 3:
            $("#title").text("热点分析");
            $("#content1").text("采用文章权重分析法，通过自动对给定的海量文本、资讯进行话题聚类，将语义上相似的内容归为一类，获取最新的热门话题，让热点一目了然。");
            $("#content2").text("rtygddgf");
            break;
        case 4:
            $("#title").text("监测报告");
            $("#content1").text("用户自定义报告周期及模板，通过可视化图表将监测数据进行汇报，选择不同的格式进行导出，为工作汇报提供极大的便利。");
            $("#content2").text("rfter");
            break; 
        case 5:
            $("#title").text("危机预警");
            $("#content1").text("从全网快速真确地发现负面舆论信息，及时反馈给用户，针对危机，第一时间内启动危机公关预案。");
            $("#content2").text("sdfxdsfsdfdsf");
            break;  
        default:
            $("#title").text("放假通知");
            $("#content1").text("2016年2月5日－14日春节假期期间，客服全面暂停服务，您有神马问题都不要着急，请耐心过好您的假期，待到放假结束后第一时间联系客服...");
            $("#content2").text("祝您新春愉快，大吉大利");
            break; 
          }
        currentNum=step.substr(6,1)-0+1;
        
    });


    //slideshow style interval
    var autoSwap = setInterval( swap,5000);
    var currentNum = 2;
    //pause slideshow and reinstantiate on mouseout
    $('#read-more a, #steps-menu a').hover(
      function () {
        clearInterval(autoSwap);
    }, 
      function () {
       autoSwap = setInterval( swap,5000);
    });

    //swap images function
    function swap(action) {
      $("#bbp").fadeOut(100);

        console.log(currentNum);
        $("#steps-menu li a:eq("+ (currentNum-1) +")").parent().addClass("is-active");
        $("#steps-menu li a:eq("+ (currentNum-1) +")").parent().siblings().removeClass("is-active");
        var step = $("#steps-menu li a:eq("+ (currentNum-1) +")").attr("href");
        $(".step-content").not(step).css("display", "none");
        $(step).fadeToggle();
        
        // Rotates the wheel
        $("#steps-menu").removeClass();
        var stepClass = step.charAt(6);
        $("#steps-menu").addClass("step-" + stepClass);

        switch(currentNum){
            case 1:
            $("#title").text("全网监测");
            $("#content1").text("通过对8000+主流网络媒体进行检测，其中包括各大新闻门户网站、论坛、贴吧、博客、视频、新浪微博以及微信平台文章等，对其进行信息采集及汇总整理，获取一切您想要的信息。");
            $("#content2").text("abc");
            break;
        case 2:
            $("#title").text("情感判断");
            $("#content1").text("通过探宝中文语义分析技术，对公众面对特定品牌、网络事件、宣传活动、名人等的正面、负面及中性的情绪进行分析，让您通过口碑趋势洞察消费者、网民的情感态度，进一步作出营销决策。");
            $("#content2").text("sdf");
            break; 
        case 3:
            $("#title").text("热点分析");
            $("#content1").text("采用文章权重分析法，通过自动对给定的海量文本、资讯进行话题聚类，将语义上相似的内容归为一类，获取最新的热门话题，让热点一目了然。");
            $("#content2").text("rtygddgf");
            break;
        case 4:
            $("#title").text("监测报告");
            $("#content1").text("用户自定义报告周期及模板，通过可视化图表将监测数据进行汇报，选择不同的格式进行导出，为工作汇报提供极大的便利。");
            $("#content2").text("rfter");
            break; 
        case 5:
            $("#title").text("危机预警");
            $("#content1").text("从全网快速真确地发现负面舆论信息，及时反馈给用户，针对危机，第一时间内启动危机公关预案。");
            $("#content2").text("sdfxdsfsdfdsf");
            break;  
        default:
            $("#title").text("放假通知");
            $("#content1").text("2016年2月5日－14日春节假期期间，客服全面暂停服务，您有神马问题都不要着急，请耐心过好您的假期，待到放假结束后第一时间联系客服...");
            $("#content2").text("祝您新春愉快，大吉大利");
            break; 
        }


        $("#bbp").fadeIn(800);

      
        currentNum+=1;
        if(currentNum==7) {
            currentNum=1;
        }

       
    }

});