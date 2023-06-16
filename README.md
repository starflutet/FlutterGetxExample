# Flutter Web GetX 사용예시 프로젝트입니다.
NextJs를 참고하여 구조를 만들었습니다. ( 화면기준으로 구조를 만듬 )

## 프로젝트 구조

	lib
      => feature
        => controllers
        => models
        => screens
        => widgets          
        
      => settings
        => injection
        => routes
        => constant
        
      => utils

## feature

공용, 세팅을 제외한 프론트 개발과 관련된 소스들을 분류합니다.

## feature => controllers

GetX를 활용한, Http 로직을 작성합니다.

## feature => models

Http 활용시, 매핑할 클래스를 작성합니다.

## feature => screens

라우터와 직접적으로 연결될 화면과 관련된 소스를 작성합니다.

## feature => widgets

screens 과 연결되는 세부 위젯을 작성합니다.
    
## settings

설정과 관련된 소스들을 분류합니다.

## settings => injection

사전에 주입할 소스를 작성합니다. ( 의존성 주입 등 )

## settings => routes 

라우터 세팅할 소스를 작성합니다.

## settings => constant 

API키와 같은 세팅관련 상수들을 작성합니다. ( 이그노어해서 보이지않아요. )

## utils

공용으로 사용할 소스를 작성합니다.

## 끝 

개발에 정답은 없으므로 입맛데로 주물주물 하세요 ㅎ
