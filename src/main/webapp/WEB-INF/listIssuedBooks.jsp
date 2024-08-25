<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>List of Issued Books</title>
</head>
<body>
    <h1>List of Issued Books</h1>
    <table border="1">
        <tr>
            <th>ID</th>
            <th>Book ID</th>
            <th>Student ID</th>
            <th>Issue Date</th>
            <th>Return Date</th>
            <th>Return Status</th>
            <th>Fine</th>
        </tr>
        <c:forEach var="issuedBook" items="${issuedBooks}">
            <tr>
                <td>${issuedBook.id}</td>
                <td>${issuedBook.bookId}</td>
                <td>${issuedBook.studentId}</td>
                <td>${issuedBook.issuesDate}</td>
                <td>${issuedBook.returnDate}</td>
                <td>${issuedBook.returnStatus}</td>
                <td>${issuedBook.fine}</td>
            </tr>
        </c:forEach>
    </table>
</body>
</html>
    