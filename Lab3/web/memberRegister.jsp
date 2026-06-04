<%-- 
    Document   : memberRegister
    Created on : 14 Apr 2026, 2:18:47 pm
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lab 3 - Task 1</title>
    </head>
    <body>
        <h1>Passing data from main JSP page to other JSP page</h1>
        <form id="memberFrm" action="memberProcessing.jsp" method="post"
              onsubmit="return checkICNo()">
            <fieldset>
                <legend>Member Registration</legend>
                <label for="icno">IC. No</label>
                <input type="text" id="icno" name="my_icno" size="15"
                       placeholder="E.g. 930123034567"><br/>
                <label for="icno">Name</label>
                <input type="text" id="name" name="my_name" size="45"
                       placeholder="Key-in your name"><br/>
                <p>
                    <input type="submit" id="btnSubmit" value="Submit">
                    <input type="reset" id="btnCancel" value="Cancel">
                </p>
            </fieldset>
        </form>
        &copy;2026-Adly Azamin
    </body>
</html>
