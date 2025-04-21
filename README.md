<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600&display=swap" rel="stylesheet">
    <title>Project Name</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            line-height: 1.6;
            margin: 0;
            padding: 20px;
            background-color: #f9f9f9;
        }
        h1, h2 {
            color: #333;
        }
        h3 {
            color: #555;
        }
        .container {
            max-width: 800px;
            margin: 0 auto;
            background-color: white;
            padding: 20px;
            padding-left: 30px;
            border-radius: 8px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            font-family: 'Poppins', sans-serif;
        }
        pre {
            background-color:#f8f8f8;
            padding: 10px;
            border-radius: 5px;
            overflow-x: auto;
        }
        .section {
            margin-bottom: 30px;
        }
        .list {
            padding-left: 20px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>BookFlix - Online Book Shop</h1>
        <div class="section">
            <h3>Description</h3>
            <p>This project is built using Springboot Thymeleaf, and MYSQL. I've also used Bootstrap and Jquery.</p>
        </div>
        <div class="section" id="setup">
            <h3>Setup</h3>
            <ul class="list">
                <li>Setup Java</li>
                <li>Setup STS (preferred IDE).</li>
            </ul>
            <h3>Steps</h3>
            <ol>
                <li>
                    <strong>Download the Zip : </strong>Extract the Project folder.
                </li>
                <li>
                    <strong>Import the project into your IDE :</strong>
                    This will download the maven dependencies. 
                </li>
                <li>
                    <strong>Now, create a database using the provided sql file : </strong> 
                    This will ensure that you have some pre defined users, categories and products. (or else let hibernate do it for you...)
                </li>
                <li>
                    <strong>Change the credentials : </strong> 
                    Provide MySQL username & password, also change the Mail id & password in the (.yml) file - with you credentials.
                </li>
            </ol>
        </div>
        <div class="section" id="run">
            <h3>Running the Project</h3>
            <ol>
                <li>
                    <strong>Now run the project as Springboot Application.</strong>
                </li>
                <li>
                    <strong>After successful run, goto <a href="http://localhost:8080/" target="_blank">localhost:8080</a>.</strong>
                </li>
                <li>
                    <strong>Login credentials : </strong> 
                    <ul>
                        <li>ADMIN : super@admin.com = admin</li>
                        <li>USER : bookflix31@gmail.com = 1122</li>
                    </ul>
                </li>
            </ol>
        </div>
        <div class="section" id="screenshots">
            <h3>Screenshots : </h3>
            <pre>You can find them in the images/screenshots folder.</pre>
        </div>
    </div>
</body>
</html>
