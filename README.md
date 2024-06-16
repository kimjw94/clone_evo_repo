# EVO
### 오픈 마켓형 쇼핑몰 웹 사이트

## 목차
- [간단 소개](#간단-소개)
- [기술 스택](#기술-스택)

## 간단 소개
개발기간 : 2023.12.6 ~ 2024.1.7  
개발인원 : 3명(김재원, 이용재, 지유림)  
주제 선정 이유: 로그인 시스템 구현, DB CRUD 등 웹 페이지 제작의 기초가 되는 기술들을 적용할 수 있는 프로젝트

## 기술 스택
### ✔️ Front-end
<img src="https://img.shields.io/badge/html5-E34F26?style=for-the-badge&logo=html5&logoColor=white"> <img src="https://img.shields.io/badge/css-1572B6?style=for-the-badge&logo=css3&logoColor=white"> <img src="https://img.shields.io/badge/javascript-F7DF1E?style=for-the-badge&logo=javascript&logoColor=black"> <img src="https://img.shields.io/badge/jquery-0769AD?style=for-the-badge&logo=jquery&logoColor=white">

### ✔️ Back-end
<img src="https://img.shields.io/badge/java-007396?style=for-the-badge&logo=java&logoColor=white">: Java 1.8 (JDK1.8)

### ✔️ DB
<img src="https://img.shields.io/badge/oracle-F80000?style=for-the-badge&logo=oracle&logoColor=white">: Oracle DB 11g

### ✔️ Server
<img src="https://img.shields.io/badge/apache tomcat-F8DC75?style=for-the-badge&logo=apachetomcat&logoColor=white">:Apach Tomcat 8.5v
## 기능
- 회원가입 /로그인 /회원정보수정 /회원탈퇴  
- 판매자 등록
- 상품 등록 /조회 /수정 / 삭제
- 상품 주문 및 결제
- 고객센터 문의 게시판

## 화면구성
1. **메인화면**

<p align="center">
  <img src="https://github.com/kimjw94/clone_evo_repo/assets/152935868/9857baf9-10f9-4b59-9dd5-469b5ffc4490" width="300" height="300"> &nbsp;
  <img src="https://github.com/kimjw94/clone_evo_repo/assets/152935868/7cd59443-be4b-48ec-b5b1-58f2a3bc6744" width="5" height="300"> &nbsp;
  <img src="https://github.com/kimjw94/clone_evo_repo/assets/152935868/431f79a5-acb8-4857-9a2f-02c6bc3a502f" width="300" height="300">
</p>


- 프로젝트 실행 시 가장 먼저 볼 수 있는 **초기화면**
- 좌측 상단 아이콘 클릭시 등록된 상품을 카테고리별로 확인할 수 있는 **네비게이션 바**가 생성됨
- 프로젝트 어떤 페이지이든 메인로고 evo를 클릭 시 **초기 화면으로 이동**
---
2. **회원가입 화면**
<p align="center">
<img src="https://github.com/kimjw94/clone_evo_repo/assets/152935868/5ff26c23-83fb-4c2e-9ff7-7dec3d96d777" width="400" heigh="400">
</p>


- 회원 가입 시도시 사용하는 **회원가입화면**  
- JavaScript를 통해 **유효성 검사**  (ID,닉네임 중복여부, input 형식 일치 여부 등)
---

