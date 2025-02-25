# EVO
### 오픈 마켓형 쇼핑몰 웹 사이트

## 목차
- [간단 소개](#간단-소개)
- [기술 스택](#기술-스택)

## 간단 소개
개발기간 : 2023.12.6 ~ 2024.1.7  
개발인원 : 3명(김재원, 이용재, 지유림)  
주제 선정 이유: 로그인 시스템 구현, DB CRUD 등 웹 페이지 제작의 기초가 되는 기술들을 적용할 수 있는 프로젝트

**본인(김재원)이 맡은 역할**  
구매자 화면 관련 내용, 구매 DB 구현  
회원 로그인 화면,기능 제작  
구매자 상품 정보 조회 화면, 기능 제작  
전체 상품 리스트 조회 화면, 기능 제작  
홈의 상품 네비게이션 바 기능 제작  
결제 화면 기능 제작  
주문정보 DB 구현  


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
  <img src="https://github.com/kimjw94/clone_evo_repo/assets/152935868/9857baf9-10f9-4b59-9dd5-469b5ffc4490" width="300" height="400"> &nbsp;
  <img src="https://github.com/kimjw94/clone_evo_repo/assets/152935868/7cd59443-be4b-48ec-b5b1-58f2a3bc6744" width="5" height="400"> &nbsp;
  <img src="https://github.com/kimjw94/clone_evo_repo/assets/152935868/431f79a5-acb8-4857-9a2f-02c6bc3a502f" width="300" height="400">
</p>


- 프로젝트 실행 시 가장 먼저 볼 수 있는 **초기화면**
- 좌측 상단 아이콘 클릭시 등록된 상품을 카테고리별로 확인할 수 있는 **네비게이션 바**가 생성됨
- 프로젝트 어떤 페이지이든 메인로고 evo를 클릭 시 **초기 화면으로 이동**
---
2. **회원가입 화면**
<p align="center">
<img src="https://github.com/kimjw94/clone_evo_repo/assets/152935868/5ff26c23-83fb-4c2e-9ff7-7dec3d96d777" width="400" height="400">
</p>


- 회원 가입 시도시 사용하는 **회원가입 화면**  
- JavaScript를 통해 **유효성 검사**  (ID,닉네임 중복여부, input 형식 일치 여부 등)
- **Daum 주소 API**를 통해 주소 검색창 팝업 및 입력
- 입력 성공시 Member DB 에 입력내용 **삽입**
---
3. **로그인 화면**
<p align="center">
<img src="https://github.com/kimjw94/clone_evo_repo/assets/152935868/aeab62a7-1d18-4b5a-bc95-0a0dc267877e" width="300" height=400><img src="https://github.com/kimjw94/clone_evo_repo/assets/152935868/7cd59443-be4b-48ec-b5b1-58f2a3bc6744" width="5" height="400"> &nbsp;<img src="https://github.com/kimjw94/clone_evo_repo/assets/152935868/6aced928-5268-4d9b-9d40-36fbf13d4fa6" width="300" height=400>
</p>

- 로그인 시도시 사용하는 **로그인 화면**
- DB에서 Member테이블에  아이디 및 비번이 일치할 경우 **로그인 성공**
- 실패시 아래 **잘못된 내용 알림**
---
4. **로그인 성공 메인 화면**
   <p align="center">
   <img src="https://github.com/kimjw94/clone_evo_repo/assets/152935868/b092eaf8-0bb7-4c2d-a52c-43cdc9b5cf68" width="300" height="300">
   <img src="https://github.com/kimjw94/clone_evo_repo/assets/152935868/31e74544-26c7-4458-8c63-4fadfcacf5ce" width="250" height="250">
   </p>
   
- 우측 상단에 로그인 성공시 **"닉네임님 환영합니다." 표시**
- 해당 표시에 **마우스 오버시 마이페이지 및 로그아웃페이지로 이동할 수 있는 서브메뉴창 발생**
---
5. **마이 페이지 화면**
   <p align="center">
   <img src="https://github.com/kimjw94/clone_evo_repo/assets/152935868/9d9908fb-4985-4a00-ba67-86d6aa8016af" width="400" height="400">
   </p>
- **장바구니, 위시리스트, 구매 내역을 확인**할 수 있는 화면
- 정보 수정을 클릭시 **정보수정 화면으로 이동**

---
6. **정보 수정 페이지 화면**
   <p align="center">
   <img src="https://github.com/kimjw94/clone_evo_repo/assets/152935868/9a2643bf-3170-4751-a0f1-fd69dee7779a" width="300" height="400">
     </p>
- **개인 정보 변경, 판매자 신청, 회원 탈퇴** 를 할 수 있는 창
- 판매자 신청 클릭시 **DB에 판매자여부 값이 0에서 1로 변경**되며 판매자로 상품등록이 가능하게 변경 됨
- 회원탈퇴 클릭시 비밀번호를 입력하는 창으로 이동 후 비밀번호 입력 성공시 회원 탈퇴하겠습니까 alert 발생
---
7. **판매자 등록 페이지**
    <p align="center">
    <img src="https://github.com/kimjw94/clone_evo_repo/assets/152935868/f90f770a-aa26-4e6e-9cae-3a31a07b2393" width="400" height"400">
    </p>
- 판매자 등록이 되어있는 아이디로 로그인 후 환영합니다 부분에 마우스 오버시 **상품정보 항목이 추가됨**
- 상품 추가를 클릭하면 위에 사진과 같은 페이지로 이동
- 상품 등록 완료시 해당 카테고리에서 **상품 조회가 가능해짐**
---
8. **상품 조회 페이지**
   <p align="center">
     <img src="https://github.com/kimjw94/clone_evo_repo/assets/152935868/ed6cb647-5640-40dd-b501-4f163281e212" width="300" >
     <img src="https://github.com/kimjw94/clone_evo_repo/assets/152935868/572e6edd-a34d-4e39-bb22-1822471e307b" width="300" >
   </p>

   <p align="center">
   <img src="https://github.com/kimjw94/clone_evo_repo/assets/152935868/48b86f88-8760-4bf5-b2a3-976fe7d0c952" width="300">
   <img src="https://github.com/kimjw94/clone_evo_repo/assets/152935868/9c3e3771-2b50-4b63-8e83-845a8ad577e9" width="300">
   </p>
   <p align="center">
   <img src="https://github.com/kimjw94/clone_evo_repo/assets/152935868/33b5ed0e-536a-416d-9211-2781d0589c03)" width="300">
   </p>
 - 옵션 선택시 **동적 테이블 생성**
 - **+/- 버튼에 따른 수량 증가**와 수량 증가에 따른 **전체가격 계산**
 - 옵션 미선택 후 상품 주문하기 시도시 **옵션 선택 유도 alert**
 - 동일 옵션 선택 시 테이블 내에 **수량 조절 버튼 클릭 유도 alert**
---
**개인 소감**
- 웹 어플리케이션의 기초를 이해 할 수 있었던 프로젝트
- javascript로 동적 테이블을 생성하면서 기능 하나를 만들면, 기존에 만들었던 기능이 작동하지 않는 등의 문제가 있어서 JavaScript에 대한 공부가 조금 더 필요하다고 생각하게 되었음
- 팀프로젝트를 통해 모르는 부분을 공유하고, 어떻게 설계해야할지 서로 논의하는 과정이 협업에 중요성을 알게 해주었음
