// function cc() {
//
//     do {
//
//         console.log("123")
//         //break;           //跳出循环
//         //return "ok";     //函数返回
//
//     } while (true)
// }
// cc();




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

    console.log("cc")

    return {name:dname, uri:file};
}

var s = setTimeout(split_url,1000,"http://pocketapi.48.cn/banner.jpg")

console.log("kkk")

//var splitUrl = split_url("http://pocketapi.48.cn/banner.jpg");
//console.log(splitUrl)
//console.log(JSON.stringify(splitUrl))


var test_providers = {T2:"t2.test.cy-isp.com",S3:"s3.test.cy-isp.com",G1:"g1.test.cy-isp.com",C3:"c3.test.cy-isp.com",};
var ids = Object.keys(test_providers);
console.log(ids)
console.log(ids[0])
console.log(test_providers[ids[0]])

var arr = [[1,2,4,6],[2,4,7,8],[8,9,10,11],[9,12,13,15],]
console.log(arr[0][0])