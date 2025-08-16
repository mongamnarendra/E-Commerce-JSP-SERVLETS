<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>E-Commerce Web Application (JSP & Servlets)</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            line-height: 1.6;
            margin: 20px;
            background-color: #f9f9f9;
            color: #333;
        }
        h1, h2, h3 {
            color: #2c3e50;
        }
        code {
            background-color: #ecf0f1;
            padding: 2px 4px;
            border-radius: 4px;
            display: block;
            margin: 10px 0;
            white-space: pre-wrap;
        }
        ul {
            margin-left: 20px;
        }
        .section {
            margin-bottom: 30px;
        }
        .project-structure {
            font-family: monospace;
            background-color: #ecf0f1;
            padding: 10px;
            border-radius: 6px;
        }
    </style>
</head>
<body>

    <h1>E-Commerce Web Application (JSP & Servlets)</h1>

    <div class="section">
        <h2>Overview</h2>
        <p>
            This project is a <strong>full-stack e-commerce web application</strong> developed using 
            Java Servlets, JSP (JavaServer Pages), and JDBC (Java Database Connectivity). It provides a 
            platform for users to browse products, manage their cart, place orders, and more.
        </p>
    </div>

    <div class="section">
        <h2>Technologies Used</h2>
        <ul>
            <li><strong>Backend:</strong> Java, Servlets, JDBC</li>
            <li><strong>Frontend:</strong> HTML, CSS, JavaScript</li>
            <li><strong>Database:</strong> MySQL</li>
            <li><strong>Server:</strong> Apache Tomcat</li>
            <li><strong>IDE:</strong> Eclipse</li>
        </ul>
    </div>

    <div class="section">
        <h2>Key Features</h2>
        <ul>
            <li><strong>User Authentication:</strong> Secure login/logout functionality with encrypted passwords.</li>
            <li><strong>Product Management:</strong> Browse products by categories and search functionality.</li>
            <li><strong>Cart Management:</strong> Add products to the cart, update quantities, and remove items.</li>
            <li><strong>Order Management:</strong> Place orders with multiple products. Track order status (pending, shipped, delivered).</li>
            <li><strong>User Profile:</strong> Update personal information. View order history and track previous purchases.</li>
        </ul>
    </div>

    <div class="section">
        <h2>Setup Instructions</h2>
        <ol>
            <li><strong>Clone the repository:</strong>
                <code>git clone https://github.com/mongamnarendra/E-Commerce-JSP-SERVLETS.git</code>
            </li>
            <li><strong>Set up MySQL:</strong>
                <ul>
                    <li>Create a new database named <code>ecommerce_db</code>.</li>
                    <li>Execute SQL scripts in the <code>database-scripts</code> folder to create tables and insert data.</li>
                </ul>
            </li>
            <li><strong>Configure database connection:</strong> Update the database connection settings in the project to match your local MySQL configuration.</li>
            <li><strong>Build and run the application:</strong> Use an IDE like Eclipse or IntelliJ and deploy the application to Apache Tomcat.</li>
        </ol>
    </div>

    <div class="section">
        <h2>Project Structure</h2>
        <pre class="project-structure">
E-Commerce-JSP-SERVLETS/
├── src/
│   ├── com/
│   │   ├── controller/
│   │   ├── dao/
│   │   ├── model/
│   │   └── util/
├── web/
│   ├── WEB-INF/
│   ├── css/
│   ├── js/
│   └── images/
└── database-scripts/
    ├── create_tables.sql
    └── insert_data.sql
        </pre>
    </div>

    <div class="section">
        <h2>Database & JDBC Integration</h2>
        <p>
            This project uses <strong>JDBC (Java Database Connectivity)</strong> to interact with a MySQL 
            database for all backend operations. The application performs <strong>CRUD operations</strong> 
            (Create, Read, Update, Delete) through JDBC, demonstrating hands-on SQL experience.
        </p>

        <h3>Key JDBC functionalities implemented:</h3>
        <ul>
            <li><strong>Database Connection:</strong> Used DriverManager to establish connections to MySQL. Connection pooling handled for efficient resource management.</li>
            <li><strong>CRUD Operations:</strong>
                <ul>
                    <li>Create: Insert new users, products, and orders into the database.</li>
                    <li>Read: Fetch product details, user profiles, and order history using SQL SELECT queries.</li>
                    <li>Update: Update user information, cart quantities, and order status.</li>
                    <li>Delete: Remove items from cart or delete user requests.</li>
                </ul>
            </li>
            <li><strong>Prepared Statements:</strong> Used PreparedStatement for secure query execution to prevent SQL injection attacks.</li>
            <li><strong>Transaction Management:</strong> Ensured atomic operations during order placement (multiple inserts/updates) to maintain database integrity.</li>
        </ul>

        <h3>Example: JDBC usage for fetching products</h3>
        <code>
Connection conn = DBConnection.getConnection();<br>
String sql = "SELECT * FROM products";<br>
PreparedStatement pst = conn.prepareStatement(sql);<br>
ResultSet rs = pst.executeQuery();<br>
while(rs.next()) {<br>
    Product p = new Product();<br>
    p.setId(rs.getInt("id"));<br>
    p.setName(rs.getString("name"));<br>
    p.setPrice(rs.getDouble("price"));<br>
    productList.add(p);<br>
}
        </code>
    </div>

</body>
</html>
