# EmployeeManagementWeb

**Description:**

EmployeeManagementWeb is a web application built using Java EE technologies, leveraging the functionalities provided by the EmployeeManagementEJBModule. It provides a user interface for interacting with employee data, allowing users to view, add, edit, and remove employee records seamlessly through a web browser.

**Features:**
- User-friendly interface for managing employee records
- Integration with EmployeeManagementEJBModule for business logic
- View, add, edit, and delete employee records
- Display employee statistics such as average age , youngest employee and gender distribution

**Technologies Used:**
- Java EE
- JSP (JavaServer Pages)
- Servlets
- EJB (Enterprise JavaBeans)
- JPA (Java Persistence API)
- HTML, JavaScript

**Installation:**

1. Clone the repository: `git clone <[repository-url](https://github.com/09Jeanette/EmployeeManagementWeb/tree/main)>`
2. Import the project into your IDE (e.g., NetBeans, Eclipse)
3. Ensure the EmployeeManagementEJBModule is  running on your application server.

## Setting Up the Database in NetBeans

### Create the Database

1. Open **NetBeans**.
2. Go to the **Services** tab.
3. Expand the **Databases** node.
4. Right-click on **Java DB** and select **Create Database**.
5. Fill in the necessary details:
   - **Database Name**: `EmployeeDB`
   - **User Name**: `app`
   - **Password**: `app`
6. Click **OK** to create the database.

### Get the Database URL

1. Right-click on the newly created database under the **Databases** node.
2. Select **Properties**.
3. Copy the **Database URL** (e.g., `jdbc:derby://localhost:1527/EmployeeDB`).

## Start GlassFish Server

### Start GlassFish

1. Ensure your GlassFish server is added to NetBeans.
2. Right-click on the GlassFish server in the **Servers** node under the **Services** tab and select **Start**.

### Open GlassFish Admin Console via NetBeans

1. Once the server is started, right-click on the GlassFish server again.
2. Select **View Admin Console**. This will open a web browser and navigate to the GlassFish Admin Console (usually at [http://localhost:4848](http://localhost:4848)).


## Configure JDBC Connection Pool in GlassFish

### Create JDBC Connection Pool

1. In the GlassFish Admin Console, navigate to **Resources** > **JDBC** > **JDBC Connection Pools**.
2. Click **New** to create a new pool:
   - **Pool Name**: `EmployeeDBPool`
   - **Resource Type**: `javax.sql.DataSource`
   - **Database Vendor**: `Derby`
3. Click **Next**.
4. Under **Additional Properties**, add the following:
   - `DatabaseName`: `EmployeeDB`
   - `User`: `app`
   - `Password`: `app`
   - `ServerName`: `localhost`
   - `PortNumber`: `1527`
   - **New Property**: `url` (Paste the copied database URL, e.g., `jdbc:derby://localhost:1527/EmployeeDB`)
5. Click **Finish**.

### Ping the Connection Pool

1. After configuring the connection pool, go to the **General** tab.
2. Click on **Ping** to test the connection.
3. Ensure the ping is successful.

## Add the EJB JAR File to the Web Application

### Include EJB JAR in Web Application

1. In NetBeans, right-click on the `EmployeeManagementWeb` project.
2. Select **Properties**.
3. Go to **Libraries**.
4. Click on **Add JAR/Folder**.
5. Navigate to and select the `EmployeeManagementEJBModule` JAR file (usually located in the `dist` or `target` folder of the EJB module project).
6. Click **Open** to add the JAR file to the web application's classpath.

7. Deploy the EmployeeManagementWeb project to your Java EE application server (e.g., GlassFish)

**Usage:**

1. Open your web browser and navigate to the URL where the application is deployed (e.g., `http://localhost:8080/EmployeeWebApplication`).
2. Use the provided interface to manage employee records.

**Contributing:**

Contributions are welcome! If you find any issues or have suggestions for improvements, please open an issue or submit a pull request.

**License:**

This project is licensed under the [MIT License](LICENSE).

