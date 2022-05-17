window.onload = function() {
    // 创建最外层包裹盒子
    var videoBox = document.createElement('div');
    videoBox.className = 'videoBox';
    document.body.appendChild(videoBox);
    // 创建video盒子
    var videof = document.createElement('div');
    videof.className = 'videof';
    videoBox.appendChild(videof);
    // 盒子转动
    // videof.style = 'animation: rotate 5s linear infinite;';
    // 创建video
    videof.innerHTML = `<audio id="mp3" src="${musicList[0]}"  ></audio>`;
    // 获取video
    var video = document.querySelector('#mp3');
    // video.play()
    // 创建暂停播放标志
    var musicButton = document.createElement('div');
    musicButton.className = 'music-button';
    videoBox.appendChild(musicButton);

    // 下方控制台
    var g_btmbar = document.createElement('div');
    g_btmbar.className = 'g-btmbar';
    document.body.appendChild(g_btmbar);
    // 内部盒子
    g_btmbar.innerHTML =
        `
        <div class="m-playbar m-playbar-lock m-playbar-unlock" style="top: -53px; visibility: visible;" id="auto-id-iFtNdU0MHEn00ChH">
        <div class="updn">
            <div class="left f-fl">
                <a id="lock" href="javascript:;" class="btn" hidefocus="true" data-action="lock"></a>
            </div>
            <div class="right f-fl"></div>
        </div>
        <div class="bg"></div>
        <div id="barhand" class="hand" title="展开播放条"></div>
        <div class="wrap" id="g_player" style="margin-left: -498.5px;">
            <div class="btns">
                <a href="javascript:;" hidefocus="true" data-action="prev" class="prv" title="上一首(ctrl+←)">上一首</a>
                <a href="javascript:;" hidefocus="true" data-action="play" class="ply j-flag" title="播放/暂停(p)">播放/暂停</a>
                <a href="javascript:;" hidefocus="true" data-action="next" class="nxt" title="下一首(ctrl+→)">下一首</a>
            </div>
            <div class="head j-flag"><img id="musicImg" src="./images/bg1.jpg">
                <a href="javascript:;" hidefocus="true" class="mask"></a>
            </div>
            <div class="play">
                <div class="j-flag words">
                    <a id="musicName" hidefocus="true" href="javascript:;" class="f-thide name fc1 f-fl" title="Justin Bieber-As Long As You Love Me（HEST remix）">Justin Bieber-As Long As You Love Me（HEST remix）</a>
                </div>
                <div class="m-pbar" data-action="noop">
                    <div class="barbg j-flag" id="auto-id-FMI4WdprNUwUHTUz">
                        <div class="rdy" style="width: 0%;"></div>
                        <div class="cur" style="width:0%;"><span class="btn f-tdn f-alpha" id="auto-id-vyfkHi306n02dohr"><i></i></span></div>
                    </div>
                    <span id="musicTime" class="j-flag time"><em>00:00</em> / 00:00</span>
                </div>
            </div>
            <div class="ctrl f-fl f-pr j-flag">
                <div class="m-vol" style="visibility:hidden;" id="auto-id-RXTm1mf0REcUKUyC">
                    <div class="barbg"></div>
                    <div class="vbg j-t" id="auto-id-6PNSIg0ZORWvXyrf">
                        <div class="curr j-t" style="height: 11.4815px;"></div>
                        <span id="volLodging" class="btn f-alpha j-t" style="top: 71px;"></span></div>
                </div>
                <a id="musicVol" href="javascript:;" hidefocus="true" data-action="volume" class="icn icn-vol"></a>
                <a id="loop" href="javascript:;" hidefocus="true" data-action="mode" class="icn icn-loop" title="循环"></a>
                <div class="tip tip-1" style="display: none;">循环</div>
            </div>
        </div>
    </div>
    `;


    //    获取一些元素
    var prv = document.querySelector('.prv');
    var ply = document.querySelector('.ply');
    var nxt = document.querySelector('.nxt');
    var loading = document.querySelector('#auto-id-vyfkHi306n02dohr i');
    var loadingSpan = document.querySelector('#auto-id-vyfkHi306n02dohr');

    var musicName = document.querySelector('#musicName');
    var musicImg = document.querySelector('#musicImg');
    var bar = document.querySelector('#auto-id-FMI4WdprNUwUHTUz');
    var rdy = document.querySelector('.rdy');
    var cur = document.querySelector('.cur');
    var musicTime = document.querySelector('#musicTime');
    var isLoop = document.querySelector('#loop');
    var loopmes = document.querySelector('.tip.tip-1');
    var musicvol = document.querySelector('#musicVol');
    var musicvoldiv = document.querySelector('#auto-id-RXTm1mf0REcUKUyC');
    var musicvolBox = document.querySelector('#auto-id-6PNSIg0ZORWvXyrf');
    var volLodging = document.querySelector('#volLodging');
    var curr = document.querySelector('.curr');
    var lock = document.querySelector('#lock');
    var playBar = document.querySelector('#auto-id-iFtNdU0MHEn00ChH');
    var barhand = document.querySelector('#barhand');
    // 开始暂停图标点击事件
    musicButton.addEventListener('click', function() {

        // 有stop类则执行if
        if (videoBox.classList.toggle('stop')) {
            // 当前应该启动
            ply.classList.toggle('pas');
            video.play();
            videof.style.animation = 'rotate 5s linear infinite';




        } else {
            // 当前应该暂停播放
            ply.classList.toggle('pas');

            video.pause();
            videof.style.animation = '';


        }

    })

    // 点击下方控制台开始暂停
    ply.addEventListener('click', function() {
        musicButton.click();
    })


    // 音乐载入事件
    video.addEventListener('canplay', function() {
        var nameF = musicList[nowMusic].split('/');
        var name = nameF[nameF.length - 1];
        name = name.split('.')[0];
        musicName.innerHTML = name;
        var imgF = window.getComputedStyle(videof).backgroundImage.split('"');
        var img = imgF[1];
        musicImg.src = img;
        musicTime.innerHTML = "<em>00:00</em> / " + sToM(video.duration) + "</span>";
        curr.style.height = 100 + '%';
        volLodging.style.top = -7 + 'px';
        loading.style.visibility = 'hidden';

    })
    // 音乐缓冲暂停事件
    video.addEventListener('waiting', function() {
        loading.style.visibility = 'visible';
    })

    // 音乐正在播放事件
    video.addEventListener('timeupdate', musicPlay)

    function musicPlay() {
        musicTime.innerHTML = "<em>" + sToM(video.currentTime) + "</em> / " + sToM(video.duration) + "</span>";
        cur.style.width = Percentage(video.currentTime, video.duration) + '%';
        try {
            rdy.style.width = Percentage(video.buffered.end(video.buffered.length - 1), video.duration) + '%';

        } catch (err) {
            console.log(err);
        }


    }
    // 音乐播放事件
    video.addEventListener('playing', function() {
        loading.style.visibility = 'hidden';
    })

    // 下一首
    nxt.addEventListener('click', function() {
        nowMusic = (nowMusic + 1) % musicList.length;
        replaceCover(musicImgList[nowMusic]);
        replaceMusic(musicList[nowMusic]);
    })
    // 上一首
    prv.addEventListener('click', function() {
        nowMusic = (nowMusic - 1 < 0 ? musicList.length - 1 : nowMusic - 1) % musicList.length;
        replaceCover(musicImgList[nowMusic]);
        replaceMusic(musicList[nowMusic]);
    })
    // 循环播放
    isLoop.addEventListener('click', function() {
        isLoop.classList.toggle('icn-one');
        if (isLoop.classList.toggle('icn-loop')) {
            // 单曲循环
            video.loop = false;

        } else {
            video.loop = true;



        }
        loopmes.style.display = 'block';
        video.loop ? loopmes.innerHTML = '单曲循环' : loopmes.innerHTML = '循环';

        setTimeout(function() {
            loopmes.style.display = 'none';

        }, 1500)
    })
    video.addEventListener('ended', function() {
        nxt.click();
    })
    video.addEventListener('emptied', () => {
        loading.style.visibility = 'visible';

    })
    video.addEventListener('error', () => {
        loading.style.visibility = 'visible';

    })
    // 进度条事件
    // 点击进度条
    bar.addEventListener('mousedown', function(e) {
        var time = Percentage(e.pageX - bar.getBoundingClientRect().x, bar.getBoundingClientRect().width);
        cur.style.width = time + '%';
        try {
            video.currentTime = outPercentage(time, video.duration);
        } catch (err) {
            console.error(err);

        }

        if (video.networkState == 3) {
            cur.style.width = 0 + '%';

        }
    })

    loadingSpan.onmousedown = function(e) {
        var time;
        document.onmousemove = function(e) {
            video.removeEventListener('timeupdate', musicPlay);
            if (e.pageX != 0) {
                time = Percentage(e.pageX - bar.getBoundingClientRect().x, bar.getBoundingClientRect().width);
                if (time <= 100) {
                    musicTime.innerHTML = "<em>" + sToM(outPercentage(time, video.duration)) + "</em> / " + sToM(video.duration) + "</span>";

                    cur.style.width = time + '%';
                } else {
                    musicTime.innerHTML = "<em>" + sToM(outPercentage(100, video.duration)) + "</em> / " + sToM(video.duration) + "</span>";

                    cur.style.width = 100 + '%';
                }
                // video.currentTime = outPercentage(time, video.duration);

            }

        }

        document.onmouseup = function(e) {
            video.addEventListener('timeupdate', musicPlay);

            try {
                video.currentTime = outPercentage(time, video.duration);
            } catch (err) {
                console.error(err);


            }
            document.onmousemove = null;
            document.onmouseup = null;
            if (video.networkState == 3)
                cur.style.width = 0 + '%';
        }

    }





    // 阻止禁止标志出现
    var mPbar = document.querySelector('.m-pbar');
    mPbar.addEventListener('dragenter', function(e) {
        e.preventDefault();
        document.onmousemove = null;
        document.onmouseup = null;
    })
    mPbar.addEventListener('dragover', function(e) {
        e.preventDefault();
        console.log(e.dataTransfer);
        document.onmousemove = null;
        document.onmouseup = null;
        e.dataTransfer.dropEffect = "none";

        console.log(e.dataTransfer);

    })

    // 声音
    musicvol.addEventListener('click', function(e) {
        e.stopPropagation();

        if (musicvol.classList.toggle('hid')) {
            musicvoldiv.style.visibility = 'initial';

        } else {
            musicvoldiv.style.visibility = 'hidden';

        }

    })
    musicvolBox.addEventListener('mousedown', function(e) {

        var vol = Percentage(musicvolBox.getBoundingClientRect().height + musicvolBox.getBoundingClientRect().y - e.pageY, musicvolBox.getBoundingClientRect().height);

        if (vol <= 0) {
            curr.style.height = 0 + '%';
            volLodging.style.top = musicvolBox.getBoundingClientRect().height - 7 + 'px';
            video.volume = 0;
            musicvol.classList.add('icn-volno');



        } else if (vol <= 100) {
            curr.style.height = vol + '%';
            volLodging.style.top = e.pageY - musicvolBox.getBoundingClientRect().y - 7 + 'px';
            video.volume = vol / 100;
            musicvol.classList.remove('icn-volno');

        } else {
            curr.style.height = 100 + '%';
            volLodging.style.top = -7 + 'px';
            video.volume = 1;

        }

    })
    document.addEventListener('click', function(e) {
        musicvol.classList.remove('hid');
        musicvoldiv.style.visibility = 'hidden';
        if (playBar.classList.length == 3) {

            down = setTimeout(function() {

                playBar.style.top = -7 + 'px';

            }, 1000)
        }
    })
    musicvoldiv.addEventListener('click', function(e) {
        e.stopPropagation();

    })
    volLodging.onmousedown = function(e) {
        document.onmousemove = function(e) {
            video.removeEventListener('timeupdate', musicPlay);


            var vol = Percentage(musicvolBox.getBoundingClientRect().height + musicvolBox.getBoundingClientRect().y - e.pageY, musicvolBox.getBoundingClientRect().height);

            if (vol <= 0) {
                curr.style.height = 0 + '%';
                volLodging.style.top = musicvolBox.getBoundingClientRect().height - 7 + 'px';
                video.volume = 0;
                musicvol.classList.add('icn-volno');



            } else if (vol <= 100) {
                curr.style.height = vol + '%';
                volLodging.style.top = e.pageY - musicvolBox.getBoundingClientRect().y - 7 + 'px';
                video.volume = vol / 100;
                musicvol.classList.remove('icn-volno');

            } else {
                curr.style.height = 100 + '%';
                volLodging.style.top = -7 + 'px';
                video.volume = 1;

            }
            // video.currentTime = outPercentage(time, video.duration);



        }

        document.onmouseup = function(e) {
            document.onmousemove = null;
            document.onmouseup = null;
        }

    }
    // 定时器下降


    var down = setTimeout(function() {

        playBar.style.top = -7 + 'px';

    }, 1000)

    var lockdown;



    // 锁标志切换
    lock.addEventListener('click', function(e) {

        if (playBar.classList.toggle('m-playbar-unlock')) {
            down = setTimeout(function() {

                playBar.style.top = -7 + 'px';

            }, 1000)
        } else {
            clearTimeout(down);
            clearTimeout(lockdown);

            playBar.style.top = -53 + 'px';


        }
    })
    playBar.addEventListener('mouseover', function() {
        clearTimeout(down);


    })
    barhand.addEventListener('mouseover', function() {
        clearTimeout(down);

        playBar.style.top = -53 + 'px';
    })
    barhand.addEventListener('mouseout', function() {



        if (playBar.classList.length == 3) {


            down = setTimeout(function() {

                playBar.style.top = -7 + 'px';

            }, 1000)
        }
    })

    lock.addEventListener('mouseout', function(e) {
        e.stopPropagation();

        if (playBar.classList.length == 3) {

            lockdown = setTimeout(function() {


                playBar.style.top = -7 + 'px';

            }, 1000)
        }
    }, true)



}
var musicList = ['./Localmusic/大鱼.mp3', './Localmusic/兮曰Crandy,叶栖夏 - 【词策】魔道祖师同人曲云梦纯歌版（翻自 高杉さと美）.mp3', './Localmusic/兮曰Crandy - 东风志.mp3'];
var musicImgList = ['./images/bg1.jpg', './images/bg2.jpg', './images/bg3.jpg'];
var nowMusic = 0;
//添加多个歌曲
function pushMusicList(objArr) {
    if (objArr.length != 0) {
        for (const index in objArr) {

            musicList.push(objArr[index].musicName);
            musicImgList.push(objArr[index].musicCover || './images/bg1.jpg');

        }
    }
}
//添加单个歌曲
function pushMusic(obj) {
    if (obj) {


        musicList.push(obj["musicName"]);
        musicImgList.push(obj["musicCover"] || './images/bg1.jpg');


    }
}
//删除原有所有歌曲
function clearMusicList() {
    musicList = [];
    musicImgList = [];
}


// 更换歌曲封面
function replaceCover(path) {
    var videof = document.querySelector('.videof');
    path = path == undefined ? './images/bg1.jpg' : path;
    videof.style.backgroundImage = 'url(' + path + ')';
}

// 更换歌曲
function replaceMusic(path) {
    var video = document.querySelector('#mp3');
    var videoBox = document.querySelector('.videoBox');
    video.src = path;
    // video.play();

    if (videoBox.className.indexOf('stop') != -1) {
        video.play();
    } else {
        video.pause();
    }

}

function sToM(s) {

    //计算分钟
    //算法：将秒数除以60，然后下舍入，既得到分钟数
    var h;
    h = Math.floor(s / 60);


    //计算秒
    //算法：取得秒%60的余数，既得到秒数
    s = Math.floor(s % 60);

    //将变量转换为字符串
    h += '';
    s += '';
    //如果只有一位数，前面增加一个0
    h = (h.length == 1) ? '0' + h : h;
    s = (s.length == 1) ? '0' + s : s;
    if (isNaN(h)) {
        h = "00";
        s = "00";
    }
    return h + ':' + s;
}

function Percentage(num, total) {
    if (num == 0 || total == 0) {
        return 0;
    }
    return (Math.round(num / total * 10000) / 100.00); // 小数点后两位百分比
}

function outPercentage(num, total) {
    if (num == 0 || total == 0) {
        return 0;
    }
    return (Math.round(total * num / 100)); // 小数点后两位百分比
}
console.log("%cGitHub地址：https://github.com/queuecat/Music-Playing", "color:#0aa");
