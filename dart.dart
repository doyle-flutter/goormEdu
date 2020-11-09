void main(){
  
  // 1. 변수
  // 키워드 타입 변수명 = 값;
  String value;
  value = "문자열";
  String value2 = "문자열2";
  
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
  
  // 5. 클래스 : main 함수 {} 중괄호 밖에서 만들 수 있음
  
  // *Future
}

class MyType{} // 타입 예시를 위한 임의 Class 

// 5. 클래스
// - 작성방법 : class 클래스이름{...} 
class MyClass{
  
}
