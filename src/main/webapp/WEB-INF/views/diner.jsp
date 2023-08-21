<%@ page contentType="text/html;charset=utf-8" %>
    <%@ taglib prefix="c" uri="jakarta.tags.core" %>

        <!DOCTYPE html>
        <html lang="ko">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>맛집의 정보는?</title>
            <style>
                @font-face {
                    font-family: 'Godo';
                    font-style: normal;
                    font-weight: 400;
                    src: url('//cdn.jsdelivr.net/korean-webfonts/1/corps/godo/Godo/GodoM.woff2') format('woff2'), url('//cdn.jsdelivr.net/korean-webfonts/1/corps/godo/Godo/GodoM.woff') format('woff');
                }

                table {
                    width: 100%;
                    border-collapse: collapse;
                }

                td {
                    padding: 8px;
                    border: 1px solid #f9e5e1;
                    font-family: 'Godo';
                }

                .col1 {
                    width: 20%;
                    background-color: rgba(249, 169, 173, 0.492);
                    text-align: center;
                }

                .col2 {
                    width: 80%;
                }
            </style>
        </head>

        <body>
            <table>
                <h3>'${diner.name}'의 정보에요</h3>
                <tr>
                    <td class="col1">이름</td>
                    <td class="col2">${diner.name}</td>
                </tr>
                <tr>
                    <td class="col1">카테고리</td>
                    <td class="col2">${diner.category}</td>
                </tr>
                <tr>
                    <td class="col1">위치</td>
                    <td class="col2">${diner.location}</td>
                </tr>

            </table>
        </body>

        </html>