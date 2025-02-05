<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Default.aspx.vb" Inherits="CRUD._Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link href="styles/StyleSheet.css" rel="stylesheet" type="text/css" />
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9aTtKyykxyJlTjHoBfdHZXtAq5q5F6XnLdoT0zTP3+j6JkWm6Ekg2qlZ7OJoJ1I2" crossorigin="anonymous" />
</head>
<body>
<form id="form1" runat="server">
        <div class="container">
            <div class="form-container">
                <h2>Registration Form</h2>
                <div>
                    <asp:TextBox ID="txtUserId" runat="server" Width="282px" RequiredFieldValidator1="true" hidden=""></asp:TextBox>
                </div>

                <div>
                    <label for="txtUsername">Username :</label>
                    <asp:TextBox ID="txtUsername" runat="server" Width="200px" RequiredFieldValidator1="true"></asp:TextBox>
                </div>

                <div>
                    <label for="txtPassword">Password :</label>
                    <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" Width="200px" RequiredFieldValidator2="true"></asp:TextBox>
                </div>

                <div>
                    <label for="txtDisplayName">Display Name :</label>
                    <asp:TextBox ID="txtDisplayName" runat="server" Width="200px" RequiredFieldValidator3="true"></asp:TextBox>
                </div>

                <div>
                    <label for="ddlUserType">User Type :</label>
                    <asp:DropDownList ID="ddlUserType" runat="server" Width="200px">
                        <asp:ListItem Text="Student" Value="1"></asp:ListItem>
                        <asp:ListItem Text="Admin" Value="2"></asp:ListItem>
                    </asp:DropDownList>
                </div>

                <div>
                    <asp:Button ID="btnSubmit" runat="server" Text="Register" />
                </div>
            </div>

            <div class="table-container">
                <asp:Table ID="Table1" runat="server" width="100%">

                </asp:Table>
                <asp:Button ID="btnUpdate" runat="server" Text="Update" CssClass="btn btn-primary" />
                <asp:Button ID="btnDelete" runat="server" Text="Delete" CssClass="btn btn-danger" />
            </div>
        </div>
    </form>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zyKZ03u7Ztb1hvprWz5y46vk7EO7vE23Fjf44RE1" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js" integrity="sha384-pzjw8f+ua7Kw1TIq0+X6+jIF8Q5hPOvAl2w2/Jr59I3e6v2IO5B2oA7s5kmnbQQ4" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-pzjw8f+ua7Kw1TIq0+X6/jIF8Q5hPOvAl2w2/Jr59I3e6v2IO5B2oA7s5kmnbQQ4" crossorigin="anonymous"></script>  
    
    <script type="text/javascript">

        function UnHighlight(rows) {
            for (var row of rows) {
                row.classList.remove("active");

            }

        }

        function Highlight(rows, row) {
            UnHighlight(rows);

            row.classList.add("active");

        }

        function ListenTable() {
            var table = document.getElementById("Table1");
            var rows = table.querySelectorAll("tr");

            for (const row of rows) {
                row.addEventListener("click", function () {
                    Highlight(rows, row);

                    Display(row);
                });

            }

        }

        function Display(row) {
            const uidTxt = document.getElementById("txtUserId");
            const uTxt = document.getElementById("txtUsername");
            const pTxt = document.getElementById("txtPassword");
            const dnTxt = document.getElementById("txtDisplayName");
            const utTxt = document.getElementById("ddlUserType");
            const cols = row.querySelectorAll("td");

            uidTxt.value = row.getAttribute("data-user-id");
            uTxt.value = cols[0].innerText;
            pTxt.value = cols[1].innerText;
            dnTxt.value = cols[2].innerText;
            utTxt.value = cols[3].innerText;
        }

        function ListenToButtons() {

            const updateBtn = document.getElementById("btnUpdate");
            const deleteBtn = document.getElementById("btnDelete");
            const uidTxt = document.getElementById("txtUserId");

            updateBtn.addEventListener("click", function (e) {
                if (uidTxt.value.length == 0) {
                    alert("Please Select User!");
                    e.preventDefault();
                }
            });

            deleteBtn.addEventListener("click", function (e) {

                if (confirm("Do you really want to delete this?")) {

                } else {
                    e.preventDefault();

                    return false;
                }

            });

        }

        ListenTable();
        ListenToButtons();

    </script>

</body>
</html>