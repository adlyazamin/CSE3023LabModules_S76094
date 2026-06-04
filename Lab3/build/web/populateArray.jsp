<%-- 
    Document   : populateArray
    Created on : 14 Apr 2026, 2:53:58 pm
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Populate Array</title>
    <style>
        table {
            border-collapse: collapse;
            width: 50%;
            text-align: center;
        }
        th, td {
            border: 1px solid black;
            padding: 8px;
        }
        th {
            background-color: #d4a017;
        }
    </style>
</head>
<body>

<h2>Read Java array and populate it into HTML table.</h2>

<table id="salesTable">
    <thead>
        <tr>
            <th>Salesman</th>
            <th>Jan</th>
            <th>Feb</th>
            <th>Mar</th>
        </tr>
    </thead>
    <tbody>
    </tbody>
</table>

<script>
    const sales = [
        ["Salesman 1", 2500, 2100, 2200],
        ["Salesman 2", 2000, 1900, 2400],
        ["Salesman 3", 1800, 2200, 2450]
    ];

    const tableBody = document.querySelector("#salesTable tbody");

    sales.forEach(row => {
        let tr = document.createElement("tr");

        row.forEach(cell => {
            let td = document.createElement("td");
            td.textContent = cell;
            tr.appendChild(td);
        });

        tableBody.appendChild(tr);
    });
</script>

</body>
</html>