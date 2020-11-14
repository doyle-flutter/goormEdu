// 작성 중

//// 변수 : 변수 선언시 타입을 지정하지 않고 사용 가능하며, var 키워드 사용시 호이스팅에 유의해야합니다
var value = 1;
value = "2";
value = false;

// 호이스팅 
v = 5;
var v;

// 처음엔 var를 통해 연습 후 let, const로 연습하시는 것을 추천드립니다
let value2 = 2; 
const value3 = 3; // 상수
value3 = 4; // 불가능

//// 타입 : Dart 와 거의 동일하지만 명칭과 내부 구조에서 일부 차이가 있음
// * 동적언어에서는 선언시 타입을 지정하지 않습니다

// 배열 : 명칭과 동작 방식은 같다고 보지만 시스템 구조상 차이점은 있음
var li = [];
// 객체 Object
var ob = { "key" : "value" };
// bool 동일
// int / double 동일

//// function 함수
// 기본 함수 문법
function func(){
	return;
}
// 화살표 함수 ES6
var func = () => {};

// 익명함수
let nonNameFunc = () => {};

// 익명 및 선언 후 실행
((){})();

// 실행
func();

// 재귀함수 : 함수가 자기 자신을 특정 조건에 실행/멈춤하는 함수
var a = 1;
var loopFunc = () => {
	a++;
	if(a < 10){
    console.log("loop"); 
    return loopFunc();
	}
	return console.log('끝');
};
loopFunc();

//// function 함수 - 인자(Dart 와 차이를 확인해주세요)
function func(a){}

function func2([a]){} // arg : arr
// -> func2( [ 1,2,3 ] ); // 이 때 2,3은 사용할 수 없음
function func22([...a]){ console.log(a); } // arg : arr 가변
// -> func22( [ 1, 2, 3 ] ); // ... 키워드를 통해 가변 배열을 사용할 수 있음
function func23(a, b, c) {  console.log(arguments); } // arguments : arr

function func3({a}){}
// -> func3({a:123}); // 중괄호 및 Key 사용에 유의
// -> var value = {a:123}; func3(value);
// -> Class 활용
// class My{ constructor(a){ this.a = a; } }
// var my = new My(123);
// func3(my);

//// class
// 기본 생성자
class MyClassJs1{
	constructor(a, b){
		this.a = a;
		this.b = b;
	}
}
var myClassJs1 = new MyClassJs1(1,2);

// 생성자 : 네이밍
class MyClassJs2{
	constructor({a, b}){
		this.a = a;
		this.b = b;
	}
}
var myClassJs2 = new MyClassJs2({a: 3, b:4});
// Dart 생성자 네이밍 사용시 MyClassDart(a:3, b:4);라면 JS는 중괄호로 묶어야합니다

// 메서드
class Ms{
    constructor(a){ this.a = a; }
    outPutA = () => {return this.a;}
}
new Ms(123).outPutA(); // 123
var ms2 = new Ms(321);
ms2.outPutA(); // 321


//// DOM & BOM
/////////////////////// D.O.M
// 문서 Document 관련 API
// 생성되어있는 Tag 사용

// - HTML
// <div id='i1' class='c1 c2 c3'></div>
// <div id='i2' class='c1 c2 c3'></div>

// - JS(DOM)
// --- 중복될 수 없는 ID 값을 갖고 찾기
// let i1 = document.getElementById('i1');
// let i2 = document.getElementById('i2');
// --- 중복 가능한 Class 값을 갖고 찾기
// let c1 = document.getElementsByClassName('c1')[0];
// let c2 = document.getElementsByClassName('c1')[1];

// DOM 주요 3가지
// 1. TAG를 생성하여 원하는 위치에 주입 가능
// 2. TAG의 특정 값, 속성, 스타일 등 제어 가능
// 3. TAG의 이벤트를 제어
// ... 등

/////////////////////// B.O.M
// 브라우져 Browser 관련 API
// BOM 주요 5가지
// 1. 브라우져 창 제어
// 2. 스크롤 제어
// 3. 팝업
// 4. 클라이언트 환경
// 5. URL 제어
// ... 등


//// Promise (1)

async function afunc() {
    setTimeout(function(){
        return 2222222;
    },3000);
}

async function logic(){
    console.log("11111");
    let value2 = await new Promise((res,rej) => {
        try {
            setTimeout(() => res('@2@2@2@2'), 4000);
        } catch (e) {
            return rej("@@@@@");
        }
    })
        .then((_) => {
            console.log('2@2@2@2@2@ - Then (1)');
            return _;
        })
        .then((_) => {
            console.log('2@2@2@2@2@ - Then (2)');
            return _;
        })
        .then((_) => _)
        .catch((e) => console.log('ERR!!!'));
    console.log(value2)
    console.log("33333");
    setTimeout(() => console.log(44444), 3000);
    return;
}

logic();

//// Promise (2)

var futureLogic1 = () => new Promise((res,rej) => {
    try {
        res('logic1');
    } catch (e) {
        rej("logic1Err");
    }
});

var futureLogic2 = () => new Promise((res,rej) => {
    try {
        res('logic2');
    } catch (e) {
        rej("logic2Err");
    }
});

let futureContext = async () => {
    let value1 = await futureLogic1();
    console.log(value1);
    let value2 = await futureLogic2();
    console.log(value2);
    return;
};

futureContext();
