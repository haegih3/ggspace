<%@ Language="VBScript" %>


<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="euc-kr">
    <meta name="viewport" content="width=device-width,initial-scale=1.0,user-scalable=no">
    <title>예제용</title>
    <!--<script type="text/javascript" src="js/dark.js"></script>-->
    <script type="text/javascript">
        window.onload = function(){

            const btn = document.querySelector(".btn-toggle");
            const prefersDarkScheme = window.matchMedia("(prefers-color-scheme: dark)");
            // 로컬스토리지
            const currentTheme = localStorage.getItem("theme");
            // 로컬스토리지 색상 체크
            if (currentTheme == "dark") {
                document.body.classList.toggle("dark-mode");
                document.getElementsByClassName("toggle--checkbox")[0].checked = true;
            } else if (currentTheme == "light") {
                document.body.classList.toggle("light-mode");
                document.getElementsByClassName("toggle--checkbox")[0].checked = false;
            }
            btn.addEventListener("click", function () {
                let theme
                if (prefersDarkScheme.matches) {
                    document.body.classList.toggle("light-mode");
                    theme = document.body.classList.contains("light-mode") ? "light" : "dark";
                    //console.log(theme);
                } else {
                    document.body.classList.toggle("dark-mode");
                    theme = document.body.classList.contains("dark-mode") ? "dark" : "light";
                    //console.log(theme);
                }
                localStorage.setItem("theme", theme);
                //console.log(theme);
            });


        }
    </script>
    <style>
        * {
            box-sizing: border-box;
        }

        .dp_flex {
            display: flex;
        }

        .dp_2n {
            width: 50%;
        }

        .dp_3n {
            width: 33.3333%;
        }

        .dp_4n {
            width: 25%;
        }

        .bd_all {
            border: 1px solid #eee;
            padding: 5px;
        }

        .pd_b20 {
            padding-bottom: 20px;
            border-bottom: 2px solid #808080;
        }

        .pd_10 {
            padding: 10px;
        }

        body.light-mode {
            color: #555;
            background: #fff;
        }
        body.dark-mode {
            color: #eee;
            background: #121212;
        }
        .tgl-check {
            display: none;
        }
        .tgl-check + label {
            display: inline-block;
            outline: 0;
            width: 5em;
            height: 2em;
            position: relative;
            cursor: pointer;
            background: #f0f0f0;
            border-radius: 2em;
            padding: 2px;
            vertical-align: middle;
            transition: all 0.4s ease;
        }
        .tgl-check + label::before, .tgl-check + label::after {
            position: absolute;
            top: 2px;
            display: block;
            width: calc(2em - 4px);
            height: calc(2em - 4px);
            box-sizing: border-box;
        }
        .tgl-check + label::before {
            left: 40%;
            content: "NIGHT";
            padding: 2px 5px;
            text-align: center;
        }
        .tgl-check + label::after {
            content: "";
            left: 2px;
            border-radius: 50%;
            background: #fff;
            transition: all 0.2s ease;
        }
        .tgl-check:checked + label {background: #b3c700;}
        .tgl-check:checked + label::before {content: "DAY";left: 2px;}
        .tgl-check:checked + label::after {left: calc(100% - (2em - 4px) - 2px);}
        h2 {
            display: inline-block;
            padding: 0 10px;
            background: linear-gradient(transparent 40%, #d6fbf0 40% 80%, transparent 80%);
        }
        .dark-mode h2 { background: linear-gradient(transparent 40%, #8b7d2e 40% 80%, transparent 80%); }

        h3 {
            position: relative;
            display: inline-block;
            padding: 2px 5px;
            background: linear-gradient(to right, #0086aa, #008d3b, #b3c700);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
        }
        .dark-mode h3 {
            background: linear-gradient(to left, #008d3b, #b3c700);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
        }

        .form_style {
            border-collapse: collapse;
        }

        .form_style td {
            border: 1px solid #333;
            width: 3em;
            text-align: center;
        }



        @media (max-width: 400px) {
            h2 {font-size: 10px;}
            .dp_flex {display: block;}
            .dp_2n, .dp_3n, .dp_4n {width: 100%;}
        }


        /* html:not(.style-scope)[dark]) */

        /* =====================================================
        Some defaults across all toggle demos
        ===================================================== */

        .toggle {
        display: block;
        margin-top: 40px;
        user-select: none;
        }

        .toggle--checkbox {
        display: none;
        }

        .toggle--btn {
        display: block;
        /* margin: 0 auto; */
        font-size: 1.4em;
        transition: all 350ms ease-in;
        }
        .toggle--btn:hover {
        cursor: pointer;
        }

        .toggle--btn, .toggle--btn:before, .toggle--btn:after,
        .toggle--feature,
        .toggle--feature:before,
        .toggle--feature:after {
        transition: all 250ms ease-in;
        box-sizing: border-box;
        }
        .toggle--btn:before, .toggle--btn:after,
        .toggle--feature:before,
        .toggle--feature:after {
        content: "";
        display: block;
        }

        /* ===================================================
        Day/Night and Gender toggle buttons
        =================================================== */
        .toggle--daynight .toggle--btn,
        .toggle--like .toggle--btn {
            position: relative;
            height: 70px;
            width: 125px;
            border-radius: 70px;
        }
        .toggle--daynight .toggle--btn:before,
        .toggle--like .toggle--btn:before {
            position: absolute;
            top: 2px;
            left: 4px;
            width: 56px;
            height: 56px;
            border-radius: 50%;
        }

        .toggle--daynight .toggle--btn {
            border: 5px solid #1c1c1c;
            background-color: #3c4145;
        }
        .toggle--daynight .toggle--btn:before {
            background-color: #fff;
            border: 5px solid #e3e3c7;
        }
        .toggle--daynight .toggle--btn:after {
            position: absolute;
            top: 62%;
            left: 39px;
            z-index: 10;
            width: 11.2px;
            height: 11.2px;
            opacity: 0;
            background-color: #fff;
            border-radius: 50%;
            box-shadow: #fff 0 0, #fff 3px 0, #fff 6px 0, #fff 9px 0, #fff 11px 0, #fff 14px 0, #fff 16px 0, #fff 21px -1px 0 1px, #fff 16px -7px 0 -2px, #fff 7px -7px 0 1px, #d3d3d3 0 0 0 4px, #d3d3d3 6px 0 0 4px, #d3d3d3 11px 0 0 4px, #d3d3d3 16px 0 0 4px, #d3d3d3 21px -1px 0 5px, #d3d3d3 16px -7px 0 1px, #d3d3d3 7px -7px 0 5px;
            transition: opacity 100ms ease-in;
        }
        @keyframes starry_star {
            50% {
                background-color: rgba(255, 255, 255, 0.1);
                box-shadow: #fff 30px -3px 0 0, #fff 12px 10px 0 -1px, rgba(255, 255, 255, 0.1) 38px 18px 0 1px, #fff 32px 34px 0 0, rgba(255, 255, 255, 0.1) 20px 24px 0 -1.5px, #fff 5px 38px 0 1px;
            }
        }
        @keyframes bounceIn {
            0% {
                opacity: 0;
                transform: scale(0.3);
            }
            50% {
                opacity: 100;
                transform: scale(1.1);
            }
            55% {
                transform: scale(1.1);
            }
            75% {
                transform: scale(0.9);
            }
            100% {
                opacity: 100;
                transform: scale(1);
            }
        }
        .toggle--daynight .toggle--feature {
            display: block;
            position: absolute;
            top: 9px;
            left: 52.5%;
            z-index: 20;
            width: 4px;
            height: 4px;
            border-radius: 50%;
            background-color: #fff;
            box-shadow: rgba(255, 255, 255, 0.1) 30px -3px 0 0, rgba(255, 255, 255, 0.1) 12px 10px 0 -1px, #fff 38px 18px 0 1px, rgba(255, 255, 255, 0.1) 32px 34px 0 0, #fff 20px 24px 0 -1.5px, rgba(255, 255, 255, 0.1) 5px 38px 0 1px;
            animation: starry_star 5s ease-in-out infinite;
        }
        .toggle--daynight .toggle--feature:before {
            position: absolute;
            top: -2px;
            left: -25px;
            width: 18px;
            height: 18px;
            background-color: #fff;
            border-radius: 50%;
            border: 5px solid #e3e3c7;
            box-shadow: #e3e3c7 -28px 0 0 -3px, #e3e3c7 -8px 24px 0 -2px;
            transform-origin: -6px 130%;
        }
        .toggle--daynight .toggle--checkbox:checked + .toggle--btn {
            background-color: #9ee3fb;
            border: 5px solid #86c3d7;
        }
        .toggle--daynight .toggle--checkbox:checked + .toggle--btn:before {
            left: 55px;
            background-color: #ffdf6d;
            border: 5px solid #e1c348;
        }
        .toggle--daynight .toggle--checkbox:checked + .toggle--btn:after {
            opacity: 100;
            animation-name: bounceIn;
            animation-duration: 0.6s;
            animation-delay: 0.1s;
            animation-fill-mode: backwards;
            animation-timing-function: ease-in-out;
        }
        .toggle--daynight .toggle--checkbox:checked + .toggle--btn > .toggle--feature {
            opacity: 0;
            box-shadow: rgba(255, 255, 255, 0.1) 30px -3px 0 -4px, rgba(255, 255, 255, 0.1) 12px 10px 0 -5px, #fff 38px 18px 0 -3px, rgba(255, 255, 255, 0.1) 32px 34px 0 -4px, #fff 20px 24px 0 -5.5px, rgba(255, 255, 255, 0.1) 5px 38px 0 -3px;
            animation: none;
        }
        .toggle--daynight .toggle--checkbox:checked + .toggle--btn > .toggle--feature:before {
            left: 25px;
            transform: rotate(70deg);
        }
    </style>
</head>

<body>
    <!--<div style="padding: 10px 0 20px; border-bottom: 3px double #fff;">
        <span style="vertical-align: middle; font-weight:bold;">다크테마 스위치</span>
        <input type="checkbox" id="cb1" class="tgl-check"><label for="cb1" class="btn-toggle"></label><br>
    </div>-->
    
  
    <div class="toggle toggle--daynight">
        <input type="checkbox" id="toggle--daynight" class="toggle--checkbox">
        <label class="toggle--btn btn-toggle" for="toggle--daynight"><span class="toggle--feature"></span></label>
    </div>

    <div class="pd_b20">
        <h2>변수의 데이터 형식 변환</h2>
        <div class="dp_flex">
            <%
                Dim strAvg, intAvg, dblAvg, blnAvg, bytAvg

                strAvg = "4.56326574213356542134698655"

                intAvg = CInt(strAvg)
                dblAvg = CDbl(strAvg)
                blnAvg = CBool(strAvg)
                bytAvg = CByte(strAvg)
            %>
            <p class="dp_4n bd_all">
                <b>String : </b><% =strAvg %> <br />
                <b>Integer(반올림됨) : </b><% =intAvg %> <br />
                <b>Double : </b><% =dblAvg %> <br />
                <b>Boolean : </b><% =blnAvg %> <br />
                <b>Byte : </b><% =bytAvg %>
            </p>

            <%
                strAvg = "4.32"

                intAvg = CInt(strAvg)
                dblAvg = CDbl(strAvg)
                blnAvg = CBool(strAvg)
                bytAvg = CByte(strAvg)
            %>
            <p class="dp_4n bd_all">
                <b>String : </b><% =strAvg %> <br />
                <b>Integer(반올림됨) : </b><% =intAvg %> <br />
                <b>Double : </b><% =dblAvg %> <br />
                <b>Boolean : </b><% =blnAvg %> <br />
                <b>Byte : </b><% =bytAvg %>
            </p>

            <%
                strAvg = "0"

                intAvg = CInt(strAvg)
                dblAvg = CDbl(strAvg)
                blnAvg = CBool(strAvg)
                bytAvg = CByte(strAvg)
            %>

            <p class="dp_4n bd_all">
                <b>String : </b><% =strAvg %> <br />
                <b>Integer(반올림됨) : </b><% =intAvg %> <br />
                <b>Double : </b><% =dblAvg %> <br />
                <b>Boolean : </b><% =blnAvg %> <br />
                <b>Byte : </b><% =bytAvg %>
            </p>

            <%
                strAvg = "255"

                intAvg = CInt(strAvg)
                dblAvg = CDbl(strAvg)
                blnAvg = CBool(strAvg)
                bytAvg = CByte(strAvg)
            %>
            <p class="dp_4n bd_all">
                <b>String : </b><% =strAvg %> <br />
                <b>Integer(반올림됨) : </b><% =intAvg %> <br />
                <b>Double : </b><% =dblAvg %> <br />
                <b>Boolean : </b><% =blnAvg %> <br />
                <b>Byte(256넘으면 overflow) : </b><% =bytAvg %>
            </p>
        </div>
        <h3>vartype : 어떤형식인지를 정수값으로 보여줌</h3>
        <div>
            <%
                Dim strNum, varName
                strNum = "3.4"
                varName = varType(CInt(strNum))

                Select Case varName
                    Case "0"
                        varName = "Empty"
                    Case "1"
                        varName = "Null"
                    Case "2"
                        varName = "Integer"
                    Case "3"
                        varName = "Long"
                    Case "4"
                        varName = "Single"
                    Case "5"
                        varName = "Double"
                    Case "6"
                        varName = "Currency"
                    Case "7"
                        varName = "Date"
                    Case "8"
                        varName = "String"
                    Case "9"
                        varName = "Object"
                    Case "10"
                        varName = "Error"
                    Case "11"
                        varName = "Boolean"
                    Case "12"
                        varName = "Variant"
                    Case "13"
                        varName = "DataObject"
                    Case "17"
                        varName = "Byte"
                    Case "8192"
                        varName = "Array"
                End Select
            %>
            <p>strNum : <%=strNum %> / varType(CInt(strNum)) : <%=varName %></p>
        </div>
    </div>

    <div class="pd_b20">
        <h2>연산자</h2>
        <div class="dp_flex">
            <div class="dp_3n bd_all">
                <h3>산술연산자</h3>
                <%
                    Dim intNo1, intNo2
                    Dim subRes, mulRes, divRes, powRes, intDivRes, modRes

                    intNo1 = 7
                    intNo2 = 2

                    subRes = intNo1 - intNo2
                    mulRes = intNo1 * intNo2
                    powRes = intNo1 ^ intNo2
                    divRes = intNo1 / intNo2
                    intDivRes = intNo1 \ intNo2
                    modRes = intNo1 mod intNo2
                %>
                <p>
                    <%=intNo1 %> - <%=intNo2 %> = <%=subRes %> <br />
                    <%=intNo1 %> * <%=intNo2 %> = <%=mulRes %> <br />
                    <%=intNo1 %> ^ <%=intNo2 %> = <%=powRes %> <br />
                    <%=intNo1 %> / <%=intNo2 %> = <%=divRes %> <br />
                    <%=intNo1 %> \ <%=intNo2 %> = <%=intDivRes %> <br />
                    <%=intNo1 %> mod <%=intNo2 %> = <%=modRes %> <br />
                </p>
            </div>

            <div class="dp_3n bd_all">
                <h3>비교연산자</h3>
                <%
                    Dim strWord1, strWord2, strWord3, strWord4

                    strWord1 = "Good"
                    strWord2 = "Bad"
                    strWord3 = "bad"
                    strWord4 = Empty
                %>
                <p>
                    <table>
                        <tr>
                            <td><%=intNo1 %> &gt; <%=intNo2 %></td>
                            <td>=&gt; <%=intNo1 > intNo2 %></td>
                        </tr>
                        <tr>
                            <td><%=intNo1 %> &lt; <%=strWord4 %></td>
                            <td>=&gt; <%=intNo1 < strWord4 %></td>
                        </tr>
                        <tr>
                            <td><%=intNo1 %> &gt;= <%=strWord1 %></td>
                            <td>=&gt; <%=intNo1 >= strWord1 %></td>
                        </tr>
                        <tr>
                            <td><%=strWord4 %> &lt;= <%=intNo2 %></td>
                            <td>=&gt; <%=strWord4 <= intNo2%></td>
                        </tr>
                        <tr>
                            <td><%=strWord2 %> &lt;&gt; <%=strWord3 %></td>
                            <td>=&gt; <%=strWord2 <> strWord3%></td>
                        </tr>
                        <tr>
                            <td><%=strWord2 %> &lt; <%=strWord3 %></td>
                            <td>=&gt; <%=strWord2 < strWord3%></td>
                        </tr>
                        <tr>
                            <td><%=strWord2 %> &gt; <%=strWord3 %></td>
                            <td>=&gt; <%=strWord2 > strWord3%></td>
                        </tr>
                        <tr>
                            <td><%=strWord4 %> = <%=strWord3 %></td>
                            <td>=&gt; <%=strWord4 = strWord3 %></td>
                        </tr>
                        <tr>
                            <td><%=strWord4 %> &lt;= <%=strWord3 %></td>
                            <td>=&gt; <%=strWord4 <= strWord3%></td>
                        </tr>
                        <tr>
                            <td><%=strWord1 %> &gt; <%=strWord2 %></td>
                            <td>=&gt; <%=strWord1 > strWord2 %></td>
                        </tr>
                    </table>
                </p>
                <%
                    strWord1 = "FM1"
                    strWord2 = "FMA"
                    strWord3 = "ABC"
                    strWord4 = "a"
                %>
                <p>
                    "FM1" &lt; "FMA" = <%=(strWord1 < strWord2)%><br />
                    "FM1" &gt; "FMA" = <%=(strWord1 > strWord2)%><br />
                    "ABC" &lt; "a" = <%=(strWord3 < strWord4)%><br />
                    "ABC" &gt; "a" = <%=(strWord3 > strWord4)%>
                </p>
            </div>
            <div class="dp_3n bd_all">
                <h3>논리연산자</h3>
                <%
                    Dim blnVal1, blnVal2, intVal1, intVal2

                    blnVal1 = True
                    blnVal2 = False
                    intVal1 = 2
                    intVal2 = 3
                %>
                <p>
                    <table border="0">
                        <tr>
                            <td><%=blnVal1 %> And <%=blnVal1 %></td>
                            <td>=&gt; <%=blnVal1 and blnVal1 %></td>
                        </tr>
                        <tr>
                            <td><%=blnVal1 %> And <%=blnVal2 %></td>
                            <td>=&gt; <%=blnVal1 and blnVal2 %></td>
                        </tr>
                        <tr>
                            <td><%=blnVal1 %> Or <%=blnVal2 %></td>
                            <td>=&gt; <%=blnVal1 Or blnVal2 %></td>
                        </tr>
                        <tr>
                            <td><%=blnVal2 %> Or <%=blnVal2 %></td>
                            <td>=&gt; <%=blnVal2 Or blnVal2 %></td>
                        </tr>
                        <tr>
                            <td>Not <%=blnVal2 %></td>
                            <td>=&gt; <%=Not blnVal2 %></td>
                        </tr>
                        <tr>
                            <td><%=intVal1 %> And <%=intVal2 %></td>
                            <td>=&gt; <%=intVal1 and intVal2 %></td>
                        </tr>
                        <tr>
                            <td><%=intVal1 %> Or <%=intVal2 %></td>
                            <td>=&gt; <%=intVal1 and intVal2 %></td>
                        </tr>
                    </table>
                </p>
                <p>
                    [3>1 And 7
                    <=5 Or 4=2]=True And False Or False=<%=(3 > 1 And 7 <= 5 Or 4 = 2)%><br />
                    [3 * 4 > 4 - 1 And 3 <= 3]=True And True=<%=( 3 * 4 > 4 - 1 And 3 <= 3) %> </p> </div> </div> </div>
                        <div class="pd_b20">
                        <h2>배열</h2>
                        <h3>if문(for문)과 select case문(for문) 활용</h3>
                        <div class="dp_flex">
                            <%
                Dim ArrTable(2,3)

                ArrTable(0,0) = 1
                ArrTable(0,1) = 2
                ArrTable(0,2) = 3
                ArrTable(0,3) = 4
                ArrTable(1,0) = 5
                ArrTable(1,1) = 6
                ArrTable(1,2) = 7
                ArrTable(1,3) = 8
                ArrTable(2,0) = 9
                ArrTable(2,1) = 10
                ArrTable(2,2) = 11
                ArrTable(2,3) = 12
            %>
                            <div class="dp_4n">
                                <table class="form_style">
                                    <tr>
                                        <td><%=ArrTable(0,0) %></td>
                                        <td><%=ArrTable(0,1) %></td>
                                        <td><%=ArrTable(0,2) %></td>
                                        <td><%=ArrTable(0,3) %></td>
                                    </tr>
                                    <tr>
                                        <td><%=ArrTable(1,0) %></td>
                                        <td><%=ArrTable(1,1) %></td>
                                        <td><%=ArrTable(1,2) %></td>
                                        <td><%=ArrTable(1,3) %></td>
                                    </tr>
                                    <tr>
                                        <td><%=ArrTable(2,0) %></td>
                                        <td><%=ArrTable(2,1) %></td>
                                        <td><%=ArrTable(2,2) %></td>
                                        <td><%=ArrTable(2,3) %></td>
                                    </tr>
                                </table>
                            </div>
                            <%
                Dim intSum1, intSum2, intSum3, i, j

                FOR j = 0 TO 2 STEP 1
                    IF j = 0 THEN
                        FOR i = 1 TO 4 STEP 1
                            intSum1 = intSum1 + ArrTable(j, (i - 1))
                        NEXT
                    ELSEIF j = 1 THEN
                        FOR i = 1 TO 4 STEP 1
                            intSum2 = intSum2 + ArrTable(j, (i - 1))
                        NEXT
                    ELSE
                        FOR i = 1 TO 4 STEP 1
                            intSum3 = intSum3 + ArrTable(j, (i - 1))
                        NEXT
                    END IF
                NEXT
            %>
                            <div class="dp_4n">
                                <table>
                                    <tr>
                                        <td>-> <%=intSum1 %></td>
                                    </tr>
                                    <tr>
                                        <td>-> <%=intSum2 %></td>
                                    </tr>
                                    <tr>
                                        <td>-> <%=intSum3 %></td>
                                    </tr>
                                </table>
                            </div>

                            <div class="dp_4n">
                                <table class="form_style">
                                    <tr>
                                        <td><%=ArrTable(0,0) %></td>
                                        <td><%=ArrTable(0,1) %></td>
                                        <td><%=ArrTable(0,2) %></td>
                                        <td><%=ArrTable(0,3) %></td>
                                    </tr>
                                    <tr>
                                        <td><%=ArrTable(1,0) %></td>
                                        <td><%=ArrTable(1,1) %></td>
                                        <td><%=ArrTable(1,2) %></td>
                                        <td><%=ArrTable(1,3) %></td>
                                    </tr>
                                    <tr>
                                        <td><%=ArrTable(2,0) %></td>
                                        <td><%=ArrTable(2,1) %></td>
                                        <td><%=ArrTable(2,2) %></td>
                                        <td><%=ArrTable(2,3) %></td>
                                    </tr>
                                </table>
                            </div>
                            <%
                intSum1 = empty
                intSum2 = empty
                intSum3 = empty

                FOR j = 0 TO 2 STEP 1
                    SELECT CASE j
                        CASE 0
                            FOR i = 1 TO 4 STEP 1
                                intSum1 = intSum1 + ArrTable(j, (i - 1))
                            NEXT
                        CASE 1
                            FOR i = 1 TO 4 STEP 1
                                intSum2 = intSum2 + ArrTable(j, (i - 1))
                            NEXT
                        CASE 2
                            FOR i = 1 TO 4 STEP 1
                                intSum3 = intSum3 + ArrTable(j, (i - 1))
                            NEXT
                    END SELECT
                NEXT
            %>
                            <div class="dp_4n">
                                <table>
                                    <tr>
                                        <td>-> <%=intSum1 %></td>
                                    </tr>
                                    <tr>
                                        <td>-> <%=intSum2 %></td>
                                    </tr>
                                    <tr>
                                        <td>-> <%=intSum3 %></td>
                                    </tr>
                                </table>
                            </div>
                        </div>
            </div>
            <!-- 반복문 -->
            <div class="pd_b20">
                <h2>반복문</h2>
                <div class="dp_flex">
                    <div class="dp_4n bd_all">
                        <h3>While ... Wend</h3>
                        <div>
                            <%
                        Dim intCnt, intSum

                        intCnt = 1
                        intSum = 0

                        While intCnt <= 10
                            intSum = intSum + intCnt

                            IF intCnt = 1 THEN
                                Response.write intCnt
                            ELSE
                                Response.write " +" & intCnt
                            END IF

                            intCnt = intCnt + 1
                        Wend

                        Response.write " = " & intSum
                    %>
                        </div>
                    </div>

                    <div class="dp_4n bd_all">
                        <h3>Do While ... Loop</h3>
                        <div>
                            <%
                        intCnt = 1
                        intSum = 0

                        Do While intCnt <= 10
                            intSum = intSum + intCnt
                            
                            If intCnt = 1 Then
                                Response.write intCnt
                            Else
                                Response.write " +" & intCnt
                            End If
                            intCnt = intCnt + 1
                        Loop

                        Response.write " = " & intSum
                    %>
                        </div>
                    </div>

                    <div class="dp_4n bd_all">
                        <h3>For ... Next</h3>
                        <div>
                            <%
                        intCnt = 1
                        intSum = 0

                        For intCnt = 1 To 10 Step 2
                            intSum = intSum + intCnt
                            If intCnt = 1 Then
                                Response.write intCnt
                            Else
                                Response.write " +" & intCnt
                            End If
                        Next

                        Response.write " = " & intSum
                    %>
                        </div>
                    </div>

                    <div class="dp_4n bd_all">
                        <h3>For Each ... Next</h3>
                        <div>
                            <%
                        Dim arrData(9), intVal

                        intCnt = 1
                        intSum = 0

                        'arrData(0) = 1
                        'arrData(1) = 2
                        'arrData(2) = 3
                        'arrData(3) = 4
                        'arrData(4) = 5
                        'arrData(5) = 6
                        'arrData(6) = 7
                        'arrData(7) = 8
                        'arrData(8) = 9
                        'arrData(9) = 10

                        For intCnt = 1 to 10 step 1
                            arrData(intCnt-1) = intCnt
                        Next

                        For Each intVal in arrData
                            intSum = intSum + intVal
                            If intVal = 1 Then
                                Response.write intVal
                            Else
                                Response.write " +" & intVal
                            End If
                        Next

                        Response.write " = " & intSum
                    %>
                        </div>
                    </div>
                </div>
                <h3>예제</h3>
                <div class="dp_flex">
                    <div class="dp_4n bd_all">
                        <h4>[1] While문 1~10 짝수합</h4>
                        <div>
                            <%
                        intCnt = 2
                        intSum = 0

                        While intCnt <= 10
                            intSum = intSum + intCnt

                            If intCnt = 2 Then
                                Response.write intCnt
                            Else
                                Response.write " +" & intCnt
                            End If

                            intCnt = intCnt + 2
                        Wend

                        Response.write " = " & intSum
                    %>
                        </div>
                    </div>

                    <div class="dp_4n bd_all">
                        <h4>[2] Do문 1~10 홀수합(5의배수 제외)</h4>
                        <div>
                            <%
                        intCnt = 1
                        intSum = 0

                        Do While intCnt <= 10
                            If intCnt mod 5 = 0 Then
                                intSum = intSum
                            Else
                                intSum = intSum + intCnt

                                If intCnt = 1 Then
                                    Response.write intCnt
                                Else
                                    Response.write " +" & intCnt
                                End If
                            End If

                            intCnt = intCnt + 2
                        Loop

                        Response.write " = " & intSum
                    %>
                        </div>
                        <h4>[2] Do문 1~20 짝수합(합 80넘으면 종료)</h4>
                        <div>
                            <%
                        intCnt = 2
                        intSum = 0

                        Do
                            intSum = intSum + intCnt
                                If intCnt = 2 Then
                                    Response.write intSum
                                Else
                                    Response.write " +" & intCnt
                                End if
                            intCnt = intCnt + 2
                        Loop Until intSum > 80

                        Response.write " = " & intSum
                    %>
                        </div>
                    </div>

                    <div class="dp_4n bd_all">
                        <h4>[3] For문 1~20 3의 배수 합</h4>
                        <div>
                            <%
                        intCnt = 3
                        intSum = 0

                        For intCnt = 3 To 20 Step 3
                            intSum = intSum + intCnt
                            If intCnt = 3 Then
                                Response.write intCnt
                            Else
                                Response.write " +" & intCnt
                            End If
                        Next

                        Response.write " = " & intSum
                    %>
                        </div>

                        <h4>[3] For문 1~9 i*i의 합</h4>
                        <div>
                            <%
                        intCnt = 1
                        intSum = 0

                        For intCnt = 1 To 9 Step 1
                            intSum = intSum + (intCnt * intCnt)
                            If intCnt = 1 Then
                                Response.write "(" & intCnt & "x" & intCnt & ")"
                            Else
                                Response.write " +(" & intCnt & "x" & intCnt & ")"
                            End If
                        Next

                        Response.write " = " & intSum
                    %>
                        </div>
                    </div>

                    <div class="dp_4n bd_all">
                        <h4>[4] For Each ... Next</h4>
                        <div>
                            배열이나 객체 컬렉션의 경우 미리 몇번 루프를 반복해야 할지 알기 어려운 경우 사용
                        </div>
                    </div>
                </div>
            </div>

            <div class="pd_b20">
                <h2>쿠키</h2>
                <div>
                    <%
                Response.Cookies("loginid") = "cookie_id"
                Response.Cookies("loginname") = "cookie_name"
            %>
                    <p>
                        <%
                    Dim load_cookie_id, load_cookie_name

                    load_cookie_id = Request.Cookies("loginid")
                    load_cookie_name = Request.Cookies("loginname")

                    Response.write load_cookie_id & "<br>"
                    Response.write load_cookie_name
                %>
                    </p>
                    <p>
                        쿠키값 바로 삭제 : Response.Cookies("loginid").Expires = date() - 1<br />
                        쿠키 1분 위 삭제 : Response.Cookies("loginid").Expires = dateAdd("n", 1, now())
                    </p>
                </div>
            </div>

            <div class="pd_b20">
                <h2>Dictionary 객체</h2>
                <div>
                    <%
                Dim dicCart, arrKey, arrItem, idx

                'Dictionary 개체 생성
                Set dicCart = Server.CreateObject("Scripting.Dictionary")

                'item(항목) 추가
                dicCart.add "메모리카드", "Jtek"
                dicCart.add "디지털카메라", "Canon"

                '구매 내역 출력
            %>

                    <h3>예제</h3>
                    <p>구매상품 수 : 총 <%=dicCart.count %>개</p>
                    <h4>구매내역</h4>

                    <%
                '구매 상품 변경
                dicCart.Item("디지털카메라") = "Nikon"

                '배열에 항목값과 키값 저장
                arrKey = dicCart.Keys
                arrItem = dicCart.Items
            %>

                    <ul>
                        <%For idx = 0 to dicCart.count-1 %>
                        <li><%=arrkey(idx) %> : <%=arrItem(idx) %></li>
                        <% Next %>
                    </ul>

                    <%
                
            %>
                    <p>
                    </p>
                    <p>
                    </p>
                </div>
            </div>

            <form id="form1" runat="server">
                <div>
                    그래그래
                </div>
            </form>
</body>

</html>