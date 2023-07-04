<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>KC - Jewellery Store</title>
    <jsp:include page="assets/head/head.jsp"></jsp:include>
    <link rel="stylesheet" href="assets/css/main.css">

</head>
<body>
<!-- ===== Header ===== -->
<jsp:include page="assets/header/header.jsp"></jsp:include>
<!-- ===== End Header ===== -->

<!-- ===== Main Body ===== -->
<main>
    <h1><%= "Hello World!" %></h1>
    <br/>
    <a href="hello-servlet">Hello Servlet</a>
</main>
<!-- ===== End Main Body ===== -->

<!-- ===== Footer ===== -->
<jsp:include page="assets/footer/footer.jsp"></jsp:include>
<!-- ===== End Footer ===== -->

<!-- ===== Scripts ===== -->
<script type="text/javascript" src="assets/js/main.js"></script>
<!-- ===== End Scripts ===== -->

</body>
</html>