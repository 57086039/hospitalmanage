﻿<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib  prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:forEach var="item" items="${details}">
	<tr>
		<td>${item.drugcode}</td>
		<td>${item.drugname}</td>
		<td>${item.eachdosage}</td>
		<td>${item.medicineformname}</td>
		<td>${item.medicinefrequencyname}</td>
		<td>${item.dosagequantity}</td>
		<td>${item.medicineamount}</td>
		<td>${item.note}</td>
	</tr>
</c:forEach>
