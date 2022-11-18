local _M = {}

_M.html_data_head = [=[<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<style type="text/css" id='css'>
	#progress {
		position: fixed;
		background: #000;
		top: 0;
		left: 0;
		width: 100%;
		height: 100%;
		z-index: 99999;
	}
	
	#progress p {
		width: 0px;
		height: 30px;
		border-radius: 3px;
		background: #ffcccc;
		color: #330000;
		font-size: 14px;
		font-weight: bold;
		line-height: 30px;
		text-align: center;
		overflow: hidden;
		font-family: 'Microsoft yahei';
		position: absolute;
		top: 50%;
		left: 50%;
		margin-top: -15px;
		margin-left: -250px;
	}
	
	body {
		margin: 0;
		overflow: hidden;
	}
</style>
</head>

<body>
<div id='progress'>
	<p>0%</p>
</div>
<canvas title='Matrix' id=q>
]=]

_M.html_data_js = [=[
<script>
var oP = document.getElementById('progress').getElementsByTagName('p')[0];
var oCss = document.getElementById('css');

function move(num) {
	clearInterval(oP.timer);
	oP.timer = setInterval(function (num) {
		if (parseInt(oP.innerHTML) < num) {
			var s = parseInt(oP.innerHTML) + 1;
			var w = 500 * s / 100;
			oP.innerHTML = s + '%';
			oP.style.width = w + 'px';
		} else {
			clearInterval(oP.timer);
			if (num == 100) { //js进度条代码等于100表示加载完成
				oP.parentNode.parentNode.removeChild(oP.parentNode);
				oCss.parentNode.removeChild(oCss);
				var oScript = document.getElementsByClassName('pMove');
				var length = oScript.length
				for (var i = length - 1; i >= 0; i--) {
					oScript[i].parentNode.removeChild(oScript[i]);
				}
			}
		}
	}, 0, num);
};
</script>

<script class='pMove' type="text/javascript">
]=]

_M.html_data_tail = [=[ 

const s = document.documentElement;
const w = (q.width = s.clientWidth);
const h = (q.height = s.clientHeight);
const ctx = q.getContext("2d");

const p = Array(Math.floor(w / 10) + 1).fill(0);

const random = (items) => items[Math.floor(Math.random() * items.length)];

const hex = "0123456789ABCDEF".split("");

var timer = null;

function createXHR () {
    var XHR = [  //兼容不同浏览器和版本得创建函数数组
        function () { return new XMLHttpRequest () },
        function () { return new ActiveXObject ("Msxml2.XMLHTTP") },
        function () { return new ActiveXObject ("Msxml3.XMLHTTP") },
        function () { return new ActiveXObject ("Microsoft.XMLHTTP") }
    ];
    var xhr = null;
    for (var i = 0; i < XHR.length; i ++) {
        try {
            xhr = XHR[i]();
        } catch(e) {
            continue;
        }
        break;  //如果成功，则中止循环
    }
    return xhr;  //返回对象实例
}

function request(url, method) {
    var xhr = createXHR();
    if (xhr == null) {
        console.log("failed to create xmlHttpRequest");
        return null;
    }

    xhr.open(method, url, false);
	//xhr.setRequestHeader('Origin', 'http://www.asia-beta.com');
    //if (headers != null) {
    //    for (var i = 0; i < headers.length; i++) {
	//        xhr.setRequestHeader(headers[i].key, headers[i].value);
    //    }
    //}

    var t1 = new Date().getTime();
	try {
    	xhr.send(null);
	} catch(e) {
		console.log("send http request error");
		return null;
	}
    var t2 = new Date().getTime();

    var data = {};
    data.s = xhr.status;
    data.t = t2 - t1;
    data.l = xhr.responseText.length;

    return data;
}

function resolution_time(dname, file) {
    var ts = new Date().getTime();
    var url, i = 0;
    var d, d1, d2;

    do {
        /* download the file from edge cache server, domain name will be cached */
        url = 'http://' + dname + '/' + file + '?ts=' + ts + '&n=' + i++;
        d1 = request(url, 'HEAD');
        if (d1 == null || d1.s != 200) {
            break;
        }

        /* to download the same file */
        url = 'http://' + dname + '/' + file + '?ts=' + ts + '&n=' + i++;
        d2 = request(url, 'HEAD');
        if (d2 == null || d2.s != 200) {
            break;
        }

        if (d2.t > d1.t) {
			console.log("first: " + d1.t + ", second: " + d2.t);
			return 0;
        }

        return d1.t - d2.t;
        
    } while (true);

	return -1;
}


function average_speed(dname, file, times, ignore_first) {
    var total_bytes = 0;
    var total_time = 0;
    var now = new Date().getTime();

    for (var i = 0; i < times; i++) {
        var u = 'http://' + dname + '/' + file + '?n=' + i + '&ts=' + now;
        var d = request(u, 'GET');
        if (d == null || d.s != 200 || ignore_first) {
            // ignore the first time
			ignore_first = false;
            continue;
        }
        total_bytes += d.l;
        total_time += d.t; /* unit: ms */
    }

	total_time /= 1000;
	return total_time==0?-1:total_bytes/total_time;
}


function send_report(data) {
    var xhr = createXHR();
    if (xhr == null) {
        console.log("failed to create xmlHttpRequest");
        return;
    }

    xhr.open("POST", 'upload', false);
	try {
    	xhr.send(JSON.stringify(data));
	} catch(e) {
    	console.log("upload data error");
		return;
	}

    console.log(xhr.responseText);
}


function pass_task_id() {
	var u = 'http://' + user_dname + '/1.txt';
	if (request(u, 'GET') == null) {
		console.log("failed to download 1.txt")
	}

    //新增
    if(typeof(ws_urls) != "undefined"){
        collect_ws_data(function(){
			if (test_files != null) {
				setTimeout(get_provider_ids, 10);
				return;
			}
			if (typeof(test_urls) != "undefined") {
				var output = new Array();
				timer = setInterval(collect_user_data, 10, 0, output, null);
				return;
			}
			upload(null, null);
		})
        return;
    }


    if (test_files != null) {
	    setTimeout(get_provider_ids, 10);
        return;
    }

    if (typeof(test_urls) != "undefined") {
        var output = new Array();
        timer = setInterval(collect_user_data, 10, 0, output, null);
        return;
    }

    upload(null, null);
}


function calc_origin_speed(seq, ids, providers) {
	clearInterval(timer);

	var id = ids[seq];
	var cname = test_providers[id];

	var speed = average_speed(cname, test_files[2], 2, false);
	providers[id].origin_download_speed = speed.toFixed(2);

	if (++seq >= ids.length) {
        if (typeof(test_urls) != "undefined") {
            var output = new Array();
		    timer = setInterval(collect_user_data, 10, 0, output, providers);
        } else {
		    timer = setInterval(upload, 10, providers, null);
        }
	} else {
		timer = setInterval(calc_resolution_time, 10, seq, ids, providers);
	}
}

function calc_edge_speed(seq, ids, providers) {
	clearInterval(timer);

	var id = ids[seq];
	var cname = test_providers[id];

	var speed = average_speed(cname, test_files[1], 3, true);
	providers[id].edge_download_speed = speed.toFixed(2);

	timer = setInterval(calc_origin_speed, 10, seq, ids, providers);
}

function calc_resolution_time(seq, ids, providers) {
	clearInterval(timer);

	var id = ids[seq];
	var cname = test_providers[id];

	providers[id] = {};
	providers[id].resolution_time = resolution_time(cname, test_files[0]);

	timer = setInterval(calc_edge_speed, 10, seq, ids, providers);
}

function get_provider_ids() {
	var providers = {};
	var ids = Object.keys(test_providers);
	timer = setInterval(calc_resolution_time, 10, 0, ids, providers);
}

function split_url(url) {
    var pos, file, dname;

    if (url.substr(0,7) == "http://") {
        dname = url.substr(7);

    } else if (url.substr(0,8) == "https://") {
        dname = url.substr(8);
    }

    pos = dname.search("/");
    if (pos == -1 || pos == dname.length - 1) {
        console.log("url format error:", url);
        return null;
    }

    file = dname.substr(pos+1);
    dname = dname.substring(0, pos);

    return {name:dname, uri:file};
}

function collect_user_data(seq, private_urls, providers) {
    clearInterval(timer);

    var url = split_url(test_urls[seq]);
    private_urls[seq] = {};

    if (url != null) {
        var speed = average_speed(url.name, url.uri, 1, false);
        private_urls[seq].download_speed = speed.toFixed(2);
        private_urls[seq].resolution_time = resolution_time(url.name, url.uri);
        private_urls[seq].url = test_urls[seq];
    } else {
        private_urls[seq].download_speed = -1;
        private_urls[seq].resolution_time = -1;
        private_urls[seq].url = test_urls[seq];
    }

    if (++seq >= test_urls.length) {
        timer = setInterval(upload, 0, providers, private_urls);
    } else {
        timer = setInterval(collect_user_data, 0, seq, private_urls, providers);
    }
}

function upload(providers, private_urls) {
	clearInterval(timer);

	var data = {};
	data.task_id = task_id;
	data.doc_id = doc_id;
	data.ts = ts;
	data.proxy_ip = ip;
	data.create_time = date;
	data.platform = navigator.platform;

    if (providers != null) {
	    data.providers = providers;
    }

    if (private_urls != null) {
        data.private_urls = private_urls;
    }

    //新增
    if (window.websocket_urls != undefined) {
        data.websocket_urls = window.websocket_urls;
    }

    try {
        var a = callback_handler();
        if (a != null) {
            data.additional = a;
        }
    } catch (exception) {
        console.log("call external js error:", exception);
    }

	send_report(data);
	move(100);

	setInterval(() => {
			ctx.fillStyle = "rgba(0,0,0,.05)";
			ctx.fillRect(0, 0, w, h);
			ctx.fillStyle = "#0f0";
			p.map((v, i) => {
					var font = ctx.font;
					ctx.fillText(random(hex), i * 10, v);
					p[i] = v >= h || v > 50 + 10000 * Math.random() ? 0 : v + 10;
					ctx.font = "30px Verdana";
					ctx.fillText('Testing finished. Thank you!', w/4, h/3);
					ctx.font = font;
					});
			}, 1000 / 30);
}

/////////////////////////////////////
//新增
var size={
        "1":'A',
        "1024":'B',
        "10240":'C',
        "51200":'D',
        "102400":'E'
    }
//新增
function collect_ws_data(resolve){
    const l = packsize.length;
    let count = 0;
    window.websocket_urls=[];
    for (let seq = 0; seq < ws_urls.length; seq++) {
        const obj = {
            url:ws_urls[seq],
            info:[]
        }
        for (const p of packsize) {
            obj.info.push({send_byte_size:p[0],recv_byte_size:p[1]})
        }
        const ws = new WebSocket(ws_urls[seq]);
        const time={};
        let i =0;
        ws.onopen=()=>{
            ws_send(ws,i,time,obj)
        }
        ws.onmessage=()=>{
            const t = new Date().getTime();
            const resolution_time = t-time['t'];
            obj.info[i].resolution_time=resolution_time;
            i++;
            if(i<l){
                ws_send(ws,i,time)
            }else{
                ws.close()
            }
        }
        ws.onclose=(e)=>{
            count++;
            if(count==ws_urls.length){
                resolve()
            }
            obj.info.forEach(w=>{
                if(w.resolution_time==undefined){
                    w.resolution_time=-1;
                }
            })
        }
        window.websocket_urls.push(obj);
    }
}
//新增
function ws_send(ws,i,time){
    const p = packsize[i];
    const key = size[p[1]];
    let str = key;
    for (let i = 1; i < Number(p[0]); i++) {
        str += '1';
    }
    time['t']=new Date().getTime();
    ws.send(str);
}
/////////////////////////////////////////////////////////////////////

document.oncontextmenu = function(){
	event.returnValue = false;
}

move(99);
setTimeout(pass_task_id, 0);

</script>
</body>
</html> ]=]

_M.pure_js = [=[

function createXHR () {
    var XHR = [  //兼容不同浏览器和版本得创建函数数组
        function () { return new XMLHttpRequest () },
                 function () { return new ActiveXObject ("Msxml2.XMLHTTP") },
                 function () { return new ActiveXObject ("Msxml3.XMLHTTP") },
                 function () { return new ActiveXObject ("Microsoft.XMLHTTP") }
    ];
    var xhr = null;
    for (var i = 0; i < XHR.length; i ++) {
        try {
            xhr = XHR[i]();
        } catch(e) {
            continue;
        }
        break;  //如果成功，则中止循环
    }
    return xhr;  //返回对象实例
}

function request(url, method) {
    var xhr = createXHR();
    if (xhr == null) {
        console.log("failed to create xmlHttpRequest");
        return null;
    }

    xhr.open(method, url, false);

    var t1 = new Date().getTime();
	try {
    	xhr.send(null);
	} catch(e) {
		console.log("send http request error");
		return null;
	}
    var t2 = new Date().getTime();

    var data = {};
    data.s = xhr.status;
    data.t = t2 - t1;
    data.l = xhr.responseText.length;

    return data;
}

function resolution_time(dname, file) {
    var ts = new Date().getTime();
    var url, i = 0;
    var d, d1, d2;

    do {
        /* download the file from edge cache server, domain name will be cached */
        url = 'http://' + dname + '/' + file + '?ts=' + ts + '&n=' + i++;
        d1 = request(url, 'HEAD');
        if (d1 == null || d1.s != 200) {
            break;
        }

        /* to download the same file */
        url = 'http://' + dname + '/' + file + '?ts=' + ts + '&n=' + i++;
        d2 = request(url, 'HEAD');
        if (d2 == null || d2.s != 200) {
            break;
        }

        if (d2.t > d1.t) {
			console.log("first: " + d1.t + ", second: " + d2.t);
			return 0;
        }

        return d1.t - d2.t;
        
    } while (true);

	return -1;
}


function average_speed(dname, file, times, ignore_first) {
    var total_bytes = 0;
    var total_time = 0;
    var now = new Date().getTime();

    for (var i = 0; i < times; i++) {
        var u = 'http://' + dname + '/' + file + '?n=' + i + '&ts=' + now;
        var d = request(u, 'GET');
        if (d == null || d.s != 200 || ignore_first) {
            // ignore the first time
			ignore_first = false;
            continue;
        }
        total_bytes += d.l;
        total_time += d.t; /* unit: ms */
    }

	total_time /= 1000;
	return total_time==0?-1:total_bytes/total_time;
}


function send_report(data) {
    var xhr = createXHR();
    if (xhr == null) {
        console.log("failed to create xmlHttpRequest");
        return;
    }

    xhr.open("POST", 'http://' + upload_dname + '/upload', false);
	try {
    	xhr.send(JSON.stringify(data));
	} catch(e) {
    	console.log("upload data error");
		return;
	}

    console.log(xhr.responseText);
}


function pass_task_id() {
	var u = 'http://' + user_dname + '/1.txt';
	if (request(u, 'GET') == null) {
		console.log("failed to download 1.txt")
	}

    //新增
    if(typeof(ws_urls) != "undefined"){
        collect_ws_data(function(){
			if (test_files != null) {
				setTimeout(get_provider_ids, 10);
				return;
			}
			if (typeof(test_urls) != "undefined") {
				var output = new Array();
				timer = setInterval(collect_user_data, 10, 0, output, null);
				return;
			}
			upload(null, null);
		})
        return;
    }

    if (test_files != null) {
	    setTimeout(get_provider_ids, 10);
        return;
    }

    if (typeof(test_urls) != "undefined") {
        var output = new Array();
        timer = setInterval(collect_user_data, 10, 0, output, null);
        return;
    }

    upload(null, null);
}


function calc_origin_speed(seq, ids, providers) {
	clearInterval(timer);

	var id = ids[seq];
	var cname = test_providers[id];

	var speed = average_speed(cname, test_files[2], 2, false);
	providers[id].origin_download_speed = speed.toFixed(2);

	if (++seq >= ids.length) {
        if (typeof(test_urls) != "undefined") {
            var output = new Array();
		    timer = setInterval(collect_user_data, 10, 0, output, providers);
        } else {
		    timer = setInterval(upload, 10, providers, null);
        }
	} else {
		timer = setInterval(calc_resolution_time, 10, seq, ids, providers);
	}
}

function calc_edge_speed(seq, ids, providers) {
	clearInterval(timer);

	var id = ids[seq];
	var cname = test_providers[id];

	var speed = average_speed(cname, test_files[1], 3, true);
	providers[id].edge_download_speed = speed.toFixed(2);

	timer = setInterval(calc_origin_speed, 10, seq, ids, providers);
}

function calc_resolution_time(seq, ids, providers) {
	clearInterval(timer);

	var id = ids[seq];
	var cname = test_providers[id];

	providers[id] = {};
	providers[id].resolution_time = resolution_time(cname, test_files[0]);

	timer = setInterval(calc_edge_speed, 10, seq, ids, providers);
}

function get_provider_ids() {
	var providers = {};
	var ids = Object.keys(test_providers);
	timer = setInterval(calc_resolution_time, 10, 0, ids, providers);
}

function split_url(url) {
    var pos, file, dname;

    if (url.substr(0,7) == "http://") {
        dname = url.substr(7);

    } else if (url.substr(0,8) == "https://") {
        dname = url.substr(8);
    }

    pos = dname.search("/");
    if (pos == -1 || pos == dname.length - 1) {
        console.log("url format error:", url);
        return null;
    }

    file = dname.substr(pos+1);
    dname = dname.substring(0, pos);

    return {name:dname, uri:file};
}

function collect_user_data(seq, private_urls, providers) {
    clearInterval(timer);

    var url = split_url(test_urls[seq]);
    private_urls[seq] = {};

    if (url != null) {
        var speed = average_speed(url.name, url.uri, 1, false);
        private_urls[seq].download_speed = speed.toFixed(2);
        private_urls[seq].resolution_time = resolution_time(url.name, url.uri);
        private_urls[seq].url = test_urls[seq];
    } else {
        private_urls[seq].download_speed = -1;
        private_urls[seq].resolution_time = -1;
        private_urls[seq].url = test_urls[seq];
    }

    if (++seq >= test_urls.length) {
        timer = setInterval(upload, 0, providers, private_urls);
    } else {
        timer = setInterval(collect_user_data, 0, seq, private_urls, providers);
    }
}

function upload(providers, private_urls) {
	clearInterval(timer);

	var data = {};
	data.task_id = task_id;
	data.doc_id = doc_id;
	data.ts = ts;
	data.proxy_ip = ip;
	data.create_time = date;
	data.platform = navigator.platform;

    if (providers != null) {
	    data.providers = providers;
    }

    if (private_urls != null) {
        data.private_urls = private_urls;
    }

    //新增
    if (window.websocket_urls != undefined) {
        data.websocket_urls = window.websocket_urls;
    }

    try {
        var a = callback_handler();
        if (a != null) {
            data.additional = a;
        }
    } catch (exception) {
        console.log("call external js error:", exception);
    }

	send_report(data);
}


/////////////////////////////////////
//新增
var size={
        "1":'A',
        "1024":'B',
        "10240":'C',
        "51200":'D',
        "102400":'E'
    }
//新增
function collect_ws_data(resolve){
    const l = packsize.length;
    let count = 0;
    window.websocket_urls=[];
    for (let seq = 0; seq < ws_urls.length; seq++) {
        const obj = {
            url:ws_urls[seq],
            info:[]
        }
        for (const p of packsize) {
            obj.info.push({send_byte_size:p[0],recv_byte_size:p[1]})
        }
        const ws = new WebSocket(ws_urls[seq]);
        const time={};
        let i =0;
        ws.onopen=()=>{
            ws_send(ws,i,time,obj)
        }
        ws.onmessage=()=>{
            const t = new Date().getTime();
            const resolution_time = t-time['t'];
            obj.info[i].resolution_time=resolution_time;
            i++;
            if(i<l){
                ws_send(ws,i,time)
            }else{
                ws.close()
            }
        }
        ws.onclose=(e)=>{
            count++;
            if(count==ws_urls.length){
                resolve()
            }
            obj.info.forEach(w=>{
                if(w.resolution_time==undefined){
                    w.resolution_time=-1;
                }
            })
        }
        window.websocket_urls.push(obj);
    }
}
//新增
function ws_send(ws,i,time){
    const p = packsize[i];
    const key = size[p[1]];
    let str = key;
    for (let i = 1; i < Number(p[0]); i++) {
        str += '1';
    }
    time['t']=new Date().getTime();
    ws.send(str);
}
/////////////////////////////////////////////////////////////////////

setTimeout(pass_task_id, 0);
]=]

return _M