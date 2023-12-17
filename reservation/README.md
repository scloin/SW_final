# 영화 예매 과정

reservation.jsp를 main에 include

1. 영화 선택(시간 선택)
 - 메인 페이지에서 예매하기 버튼을 눌러서 들어온 것으로 간주
 - 전체 UI 확인 가능 하도록
 - 좌석 배치도 미리 확인 가능(예매된 좌석인 경우 checkbox checked=true)
 - 영화 이름 주어짐 (movie_name)
 - 영화 시간 선택(select 태그 이용, 시간 옵션 3개 정도)

2. 인원 수, 유형(성인/청소년) 선택
 - adult(14,000), teenager(11,000)

3. 인원 수에 맞는 좌석 선택(예매 완료된 좌석일 경우 선택 X)
 - checkbox에 좌석 번호 부여
 - 예매된 좌석인 경우 checked
 - 선택된 인원 수에 따라 사용자가 check한 checkbox 수 count, 넘으면 alert, checkbox 해제

4. 결제 금액 확인 및 결제 페이지
 - 인원 수에 따른 가격 확인, 결제 페이지 구현 (기능 X)
 - DB에 넣기

5. 예매 내역 확인
 - 예매 완료 및 예매 정보 alert
 - 마이페이지로 연결