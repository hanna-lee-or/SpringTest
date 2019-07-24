<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<html>
<head>
<title>게시물 목록</title>
</head>
<body>

	<table border="1">
		<thead>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>작성일</th>
				<th>조회수</th>
				<th>공감수</th>
				<th>댓글수</th>
				<th>첨부파일수</th>
			</tr>
		</thead>
		<tbody>

			<c:forEach items="${list}" var="list">
				<tr>
					<td>${list.boardNum}</td>
					<td><a href="/board/view?bno=${list.boardNum}">${list.title}</a></td>
					<td>${list.writer}</td>
					<td><fmt:formatDate value="${list.regDate}" pattern="yyyy/MM/dd HH:mm" /></td>
					<td>${list.viewCnt}</td>
					<td>${list.likeCnt}</td>
					<td>${list.commentCnt}</td>
					<td>${list.attachCnt}</td>
				</tr>
			</c:forEach>

		</tbody>
	</table>

</body>
</html>