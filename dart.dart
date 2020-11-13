void main(){
  
  // 1. 변수
  // 키워드 타입 변수명 = 값;
  String value;
  value = "문자열";
  String value2 = "문자열2";
  
  {
    print(value);
    String value3 = "문자열3";
    print(value3);
  }
  print(value);
  // print(value3); // Error
  
  // 2. 상수
  const cValue = "상수 문자열";
  final cValue2 = "상수 문자열2";
  
  
  // 3. 타입
  String s;
  int i;
  double d;
  num n;
  bool b;
  List li;
  Map<String, dynamic> ma;
  MyType my;
  
  // 4. 함수
  // - 작성 방법 : 타입 함수명([...]){...}
  // - 선언
  String func1(){
    return "함수에서 반환하는 문자열1";
  }
  String func2 () => "함수문자열 2";
  void func3() => "함수문자열 3";
  // - 만든 함수 사용
  print( func1() );
  print( func2() );
  // print( func3() ); // Error '=>' 화살표 함수의 경우 타입에따라 사용되므로'
  func3();
  
  // 5. 클래스 : main 함수 {} 중괄호 밖에서 만들 수 있음
  new MyClass();
  new MyClass2(123);
  MyClass3(value:123);
  
  MyClass m1 = new MyClass();
  m1.intro();
  m1.value = 123;
  m1.intro();
  
  MyClass2 m2 = new MyClass2(321);
  m2.intro();
  
  MyClass3 m3 = MyClass3(value:123123);
  m3.intro();
  
  // * Future 
  // : Future 함수는 Future로 실행한다
  // : Future 함수는 async await을 사용해야한다
  
  Future myAsync() async{
    print("비동기 함수");
    // return 반환이 될 때까지 동작, return 반환이 없다면 종료되지 않음
  }
  
  myAsync(); 
  // 함수의 결과가 void 이며, 
  // await 이 사용되지 않는 경우에는 일반함수와 같이 사용할 수 있음
  
  Future<int> myAsync2() async => Future.delayed(
    Duration(seconds:3), 
    () async => 123
  );
  
  // Future 함수를 실행하는 방법
  Future(()async{
    int myAsync2Value = await myAsync2();
    print(myAsync2Value);
    await myAsync();
    int myAsync2Value2 = await myAsync2();
    print(myAsync2Value2);
    await myAsync();
    return;
  });
  
  Future.microtask(()async{
    // 모든 Future 실행들보다 먼저 실행 됨
    print("Future Microtask!");
    int myAsync2Value = await myAsync2();
    print(myAsync2Value);
    await myAsync();
    int myAsync2Value2 = await myAsync2();
    print(myAsync2Value2);
    await myAsync();
    return;
  });
  
}

class MyType{} // 타입 예시를 위한 임의 Class 

// 5. 클래스
// - 작성방법 : class 클래스이름{...} 
class MyClass{
  int value;
  // 생성자 함수
  MyClass(){
    print(value ?? "안녕하세요 MyClass");
  }
  void intro() => print(this.value ?? "안녕하세요");
}
class MyClass2{
  int value;
  // 생성자 함수
  MyClass2(int value): assert(null){
    this.value = value;
  }
  void intro() => print(this.value ?? "안녕하세요");
}

class MyClass3{
  int value;
  MyClass3({this.value});
  void intro() => print(this.value ?? "안녕하세요");
}
