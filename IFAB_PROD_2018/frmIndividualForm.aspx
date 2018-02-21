<%@ Page Language="VB" MasterPageFile="~/Home.master" AutoEventWireup="false" CodeFile="frmIndividualForm.aspx.vb"
    Inherits="frmIndividualForm" Title="Employee Master" %>

<%@ Register Namespace="BunnyBear" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <script language="JavaScript" type="text/javascript">
        function Valid() {
            var msg, a;
            msg = NameField100Mul(document.getElementById("<%=txtEmpName.ClientID %>"));
            if (msg != "") {
                document.getElementById("<%=txtEmpName.ClientID %>").focus();
                a = document.getElementById("<%=lblEmpName.ClientID %>").innerHTML;
                msg = Spliter(a) + " " + ErrorMessage(msg);
                return msg;
            }
            msg = NameField100Mul(document.getElementById("<%=txtEmpcode.ClientID %>"));
            if (msg != "") {
                document.getElementById("<%=txtEmpcode.ClientID %>").focus();
                a = document.getElementById("<%=lblEmpCode.ClientID %>").innerHTML;
                msg = Spliter(a) + " " + ErrorMessage(msg);
                return msg;
            }

            //            msg = DropDownForZeroMul(document.getElementById("<%=ddlEmpType.ClientID %>"));
            //            if (msg != "") {
            //                document.getElementById("<%=ddlEmpType.ClientID %>").focus();
            //                a = document.getElementById("<%=lblEmpType.ClientID %>").innerHTML;
            //                msg = Spliter(a) + " " + ErrorMessage(msg);
            //                return msg;
            //            }

            //            msg = DropDownForZeroMul(document.getElementById("<%=ddlempcategory.ClientID %>"));
            //            if (msg != "") {
            //                document.getElementById("<%=ddlempcategory.ClientID %>").focus();
            //                a = document.getElementById("<%=lblempcategory.ClientID %>").innerHTML;
            //                msg = Spliter(a) + " " + ErrorMessage(msg);
            //                return msg;
            //            }
            //            msg = ValidateDateN(document.getElementById("<%=txtDOB.ClientID %>"), 'Date of Birth');
            //            if (msg != "") {
            //                document.getElementById("<%=txtDOB.ClientID %>").focus();
            //                return msg;
            //            }
            msg = ValidateDateMulN(document.getElementById("<%=txtDOB.ClientID %>"));
            if (msg != "") {
                document.getElementById("<%=txtDOB.ClientID %>").focus();
                a = document.getElementById("<%=lblDOB.ClientID %>").innerHTML;
                msg = Spliter(a) + " " + ErrorMessage(msg);
                return msg;
            }
            msg = ValidateDateMulN(document.getElementById("<%=txtDOJ.ClientID %>"));
            if (msg != "") {
                document.getElementById("<%=txtDOJ.ClientID %>").focus();
                a = document.getElementById("<%=lblDOJ.ClientID %>").innerHTML;
                msg = Spliter(a) + " " + ErrorMessage(msg);
                return msg;
            }

            //            msg = DropDownMul(document.getElementById("<%=DDLDeptType.ClientID %>"));
            //            if (msg != "") {
            //                document.getElementById("<%=DDLDeptType.ClientID %>").focus();
            //                a = document.getElementById("<%=lblDeptType.ClientID %>").innerHTML;
            //                msg = Spliter(a) + " " + ErrorMessage(msg);
            //                return msg;
            //            }
            //            msg = DropDownMul(document.getElementById("<%=Ddldpt.ClientID %>"));
            //            if (msg != "") {
            //                document.getElementById("<%=Ddldpt.ClientID %>").focus();
            //                a = document.getElementById("<%=lblDeptName.ClientID %>").innerHTML;
            //                msg = Spliter(a) + " " + ErrorMessage(msg);
            //                return msg;
            //            }

            //            msg = DropDownMul(document.getElementById("<%=ddldesignation.ClientID %>"));
            //            if (msg != "") {
            //                document.getElementById("<%=ddldesignation.ClientID %>").focus();
            //                a = document.getElementById("<%=lblDesignation.ClientID %>").innerHTML;
            //                msg = Spliter(a) + " " + ErrorMessage(msg);
            //                return msg;
            //            }
            msg = DropDownMul(document.getElementById("<%=ddlSex.ClientID %>"));
            if (msg != "") {
                document.getElementById("<%=ddlSex.ClientID %>").focus();
                a = document.getElementById("<%=lblGender.ClientID %>").innerHTML;
                msg = Spliter(a) + " " + ErrorMessage(msg);
                return msg;
            }

            msg = NameField250Mul(document.getElementById("<%=txtAddress.ClientID %>"));
            if (msg != "") {
                document.getElementById("<%=txtAddress.ClientID %>").focus();
                a = document.getElementById("<%=lblAddress.ClientID %>").innerHTML;
                msg = Spliter(a) + " " + ErrorMessage(msg);
                return msg;
            }
            msg = Field50NMul(document.getElementById("<%=txtEmail.ClientID %>"));
            if (msg != "") {
                document.getElementById("<%=txtEmail.ClientID %>").focus();
                a = document.getElementById("<%=lblEmail.ClientID %>").innerHTML;
                msg = Spliter(a) + " " + ErrorMessage(msg);
                return msg;
            }
            msg = NameField100NMul(document.getElementById("<%=txtCountry.ClientID %>"));
            if (msg != "") {
                document.getElementById("<%=txtCountry.ClientID %>").focus();
                a = document.getElementById("<%=lblCountry.ClientID %>").innerHTML;
                msg = Spliter(a) + " " + ErrorMessage(msg);
                return msg;
            }
            msg = NameField100NMul(document.getElementById("<%=txtAccountNo.ClientID %>"));
            if (msg != "") {
                document.getElementById("<%=txtAccountNo.ClientID %>").focus();
                a = document.getElementById("<%=lblAccountNo.ClientID %>").innerHTML;
                msg = Spliter(a) + " " + ErrorMessage(msg);
                return msg;
            }
            msg = FeesFieldNMul(document.getElementById("<%=txtSalary.ClientID %>"));
            if (msg != "") {
                document.getElementById("<%=txtSalary.ClientID %>").focus();
                a = document.getElementById("<%=lblSalary.ClientID %>").innerHTML;
                msg = Spliter(a) + " " + ErrorMessage(msg);
                return msg;
            }
            msg = ValidateDateMulN(document.getElementById("<%=txtDOL.ClientID %>"));
            if (msg != "") {
                document.getElementById("<%=txtDOL.ClientID %>").focus();
                a = document.getElementById("<%=lblDOL.ClientID %>").innerHTML;
                msg = Spliter(a) + " " + ErrorMessage(msg);
                return msg;
            }
            msg = NameField100NMul(document.getElementById("<%=txtDelegated.ClientID %>"));
            if (msg != "") {
                document.getElementById("<%=txtDelegated.ClientID %>").focus();
                a = document.getElementById("<%=lblDelegated.ClientID %>").innerHTML;
                msg = Spliter(a) + " " + ErrorMessage(msg);
                return msg;
            }






            //            msg = AutoCompleteExtenderForThree(document.getElementById("<%=txtAcctBranch.ClientID %>"), 'Acct Branch');
            //            if (msg != "") return msg;

            //            msg = Field30(document.getElementById("<%=txtServicePeriod.ClientID %>"), 'Service Period');
            //            if (msg != "") return msg;
            return true;
        }
        function Validate() {
            var msg = Valid();
            if (msg != true) {
                if (navigator.appName == "Microsoft Internet Explorer") {
                    document.getElementById("<%=lblmsg.ClientID %>").innerText = msg;
                    document.getElementById("<%=lblgreen.ClientID %>").innerText = "";
                    return false;
                }
                else if (navigator.appName == "Netscape") {
                    document.getElementById("<%=lblmsg.ClientID %>").textContent = msg;
                    document.getElementById("<%=lblgreen.ClientID %>").textContent = "";
                    return false;
                }
            }
            return true;
        }
        function ErrorMessage(msg) {
            var SesVar = '<%= Session("Validation") %>';
            var ValidationArray = new Array();
            ValidationArray = SesVar.split(":");
            for (var i = 0; i < ValidationArray.length - 1; i++) {
                if (ValidationArray[i] == msg) {
                    return ValidationArray[i + 1];
                }
            }
        }


        function Spliter(a) {
            var str = a;
            var n = str.indexOf("*");
            if (n != 0 && n != -1) {
                a = a.split("*");
                return a[0];
            }
            var n = str.indexOf("^");
            if (n != 0 && n != -1) {
                a = a.split("^");
                return a[0];
            }
            var n = str.indexOf(":");
            if (n != 0 && n != -1) {
                a = a.split(":");
                return a[0];
            }
        }
        //5        
        function ShowImage5() {
            GlbShowSImage(document.getElementById("<%=txtHRAEmp.ClientID%>"));
        }
        function HideImage5() {
            GlbHideSImage(document.getElementById("<%=txtHRAEmp.ClientID%>"));
        }
        function SplitName5() {
            var text = document.getElementById("<%=txtHRAEmp.ClientID%>").value;
            var split = text.split(':');
            if (split.length > 0) {
                document.getElementById("<%=txtHRAEmp.ClientID%>").innerText = split[0];
                document.getElementById("<%=txtHRAEmp.ClientID%>").innerText = split[1];
                document.getElementById("<%=HidHRAEmp.ClientID%>").innerText = split[2];
            }
        }
        //4    
        function ShowImage4() {
            GlbShowSImage(document.getElementById("<%=txtFMEmpCode.ClientID%>"));
        }
        function HideImage4() {
            GlbHideSImage(document.getElementById("<%=txtFMEmpCode.ClientID%>"));
        }
        function SplitName4() {
            var text = document.getElementById("<%=txtFMEmpCode.ClientID%>").value;
            var split = text.split(':');
            if (split.length > 0) {
                document.getElementById("<%=txtFMEmpCode.ClientID%>").innerText = split[0];
                document.getElementById("<%=txtFMEmpCode.ClientID%>").innerText = split[1];
                document.getElementById("<%=HidFMEmpCode.ClientID%>").innerText = split[2];
            }
        }
        //3    
        function ShowImage3() {
            GlbShowSImage(document.getElementById("<%=txtRMEmpCode.ClientID%>"));
        }
        function HideImage3() {
            GlbHideSImage(document.getElementById("<%=txtRMEmpCode.ClientID%>"));
        }
        function SplitName3() {
            var text = document.getElementById("<%=txtRMEmpCode.ClientID%>").value;
            var split = text.split(':');
            if (split.length > 0) {
                document.getElementById("<%=txtRMEmpCode.ClientID%>").innerText = split[0];
                document.getElementById("<%=txtRMEmpCode.ClientID%>").innerText = split[1];
                document.getElementById("<%=HidRMEmpCode.ClientID%>").innerText = split[2];
            }
        }
        //2
        function ShowImage2() {
            GlbShowSImage(document.getElementById("<%=txtDelegated.ClientID%>"));
        }
        function HideImage2() {
            GlbHideSImage(document.getElementById("<%=txtDelegated.ClientID%>"));
        }
        function SplitName2() {
            var text = document.getElementById("<%=txtDelegated.ClientID%>").value;
            var split = text.split(':');
            if (split.length > 0) {
                document.getElementById("<%=txtDelegated.ClientID%>").innerText = split[0];
                document.getElementById("<%=txtDelegated.ClientID%>").innerText = split[1];
                document.getElementById("<%=HidEmpCode.ClientID%>").innerText = split[2];
            }
        }
        //1
        function ShowImage1() {
            GlbShowSImage(document.getElementById("<%=txtAcctBranch.ClientID%>"));
        }
        function HideImage1() {
            GlbHideSImage(document.getElementById("<%=txtAcctBranch.ClientID%>"));
        }
        function SplitBank() {
            var text = document.getElementById("<%=txtAcctBranch.ClientID%>").value;
            var split = text.split(':');
            if (split.length > 0) {
                document.getElementById("<%=txtAcctBranch.ClientID%>").innerText = split[1];
                document.getElementById("<%=HidBankId.ClientID%>").value = split[0];
            }
        }
        
        
    </script>

    <script language="JavaScript" type="text/javascript">

        function ValidateQ() {
            var msg = ValidQ();
            if (msg != true) {
                if (navigator.appName == "Microsoft Internet Explorer") {
                    document.getElementById("<%=lblQRed.ClientID %>").innerText = msg;
                    document.getElementById("<%=lblQgreen.ClientID %>").innerText = "";
                    return false;
                }
                else if (navigator.appName == "Netscape") {
                    document.getElementById("<%=lblQRed.ClientID %>").textContent = msg;
                    document.getElementById("<%=lblQgreen.ClientID %>").textContent = "";
                    return false;
                }
            }
            return true;
        }

        //Function for Multilingual Validations
        //Created By Sidharth


        function ValidQ() {

            var msg, a;

            msg = DropDownForZeroMul(document.getElementById("<%=DDLEmployeeName.ClientID %>"));
            if (msg != "") {
                document.getElementById("<%=DDLEmployeeName.ClientID %>").focus();
                a = document.getElementById("<%=lblEmployeeName.ClientID %>").innerHTML;
                msg = Spliter(a) + " " + ErrorMessage(msg);
                return msg;
            }


            msg = DropDownForZeroMul(document.getElementById("<%=DDLQualificationType.ClientID %>"));
            if (msg != "") {
                document.getElementById("<%=DDLQualificationType.ClientID %>").focus();
                a = document.getElementById("<%=lblQType.ClientID %>").innerHTML;
                msg = Spliter(a) + " " + ErrorMessage(msg);
                return msg;
            }


            msg = Field250Mul(document.getElementById("<%=txtQualificationf.ClientID %>"));
            if (msg != "") {
                document.getElementById("<%=txtQualificationf.ClientID %>").focus();
                a = document.getElementById("<%=lblQ.ClientID %>").innerHTML;
                msg = Spliter(a) + " " + ErrorMessage(msg);
                return msg;
            }
            return true;
        }
        function ValidQV() {
            var msg, a;
            msg = DropDownForZeroMul(document.getElementById("<%=DDLEmployeeName.ClientID %>"));
            if (msg != "") {
                document.getElementById("<%=DDLEmployeeName.ClientID %>").focus();
                a = document.getElementById("<%=lblEmployeeName.ClientID %>").innerHTML;
                msg = Spliter(a) + " " + ErrorMessage(msg);
                return msg;
            }
            return true;
        }
        function ValidateQV() {
            var msg = ValidQV();
            if (msg != true) {
                if (navigator.appName == "Microsoft Internet Explorer") {
                    document.getElementById("<%=lblQRed.ClientID %>").innerText = msg;
                    document.getElementById("<%=lblQgreen.ClientID %>").innerText = "";
                    return false;
                }
                else if (navigator.appName == "Netscape") {
                    document.getElementById("<%=lblQRed.ClientID %>").textContent = msg;
                    document.getElementById("<%=lblQgreen.ClientID %>").textContent = "";
                    return false;
                }
            }
            return true;
        }

        function ErrorMessage(msg) {
            var SesVar = '<%= Session("Validation") %>';
            var ValidationArray = new Array();
            ValidationArray = SesVar.split(":");
            for (var i = 0; i < ValidationArray.length - 1; i++) {
                if (ValidationArray[i] == msg) {
                    return ValidationArray[i + 1];
                }
            }
        }


        function Spliter(a) {
            var str = a;
            var n = str.indexOf("*");
            if (n != 0 && n != -1) {
                a = a.split("*");
                return a[0];
            }
            var n = str.indexOf("^");
            if (n != 0 && n != -1) {
                a = a.split("^");
                return a[0];
            }
            var n = str.indexOf(":");
            if (n != 0 && n != -1) {
                a = a.split(":");
                return a[0];
            }
        }
    </script>

    <%--
    <script language="JavaScript" type="text/javascript">
        function ValidQ() {
            var msg;
            msg = DropDownForZero(document.getElementById("<%=DDLEmployeeName.ClientID %>"), 'Employee Name');
            if (msg != "") {
                document.getElementById("<%=DDLEmployeeName.ClientID %>").focus();
                return msg;
            }
            msg = DropDownForZero(document.getElementById("<%=DDLQualificationType.ClientID %>"), 'Qualification Type');
            if (msg != "") {
                document.getElementById("<%=DDLQualificationType.ClientID %>").focus();
                return msg;
            }
            msg = NameField250E(document.getElementById("<%=txtQualificationf.ClientID %>"), 'Qualification');
            if (msg != "") {
                document.getElementById("<%=txtQualificationf.ClientID %>").focus();
                return msg;
            }

            return true;
        }
        function ValidateQ() {
            var msg = ValidQ();
            if (msg != true) {
                if (navigator.appName == "Microsoft Internet Explorer") {
                    document.getElementById("<%=lblQRed.ClientID %>").innerText = msg;
                    document.getElementById("<%=lblQgreen.ClientID %>").innerText = "";
                    return false;
                }
                else if (navigator.appName == "Netscape") {
                    document.getElementById("<%=lblQRed.ClientID %>").textContent = msg;
                    document.getElementById("<%=lblQgreen.ClientID %>").textContent = "";
                    return false;
                }
            }
            return true;
        }
        function ValidQV() {
            var msg;
            msg = DropDownForZero(document.getElementById("<%=DDLEmployeeName.ClientID %>"), 'Employee Name');
            if (msg != "") {
                document.getElementById("<%=DDLEmployeeName.ClientID %>").focus();
                return msg;
            }

            return true;
        }
        function ValidateQV() {
            var msg = ValidQV();
            if (msg != true) {
                if (navigator.appName == "Microsoft Internet Explorer") {
                    document.getElementById("<%=lblQRed.ClientID %>").innerText = msg;
                    document.getElementById("<%=lblQgreen.ClientID %>").innerText = "";
                    return false;
                }
                else if (navigator.appName == "Netscape") {
                    document.getElementById("<%=lblQRed.ClientID %>").textContent = msg;
                    document.getElementById("<%=lblQgreen.ClientID %>").textContent = "";
                    return false;
                }
            }
            return true;
        }
    </script>
--%>

    <script language="JavaScript" type="text/javascript">

        function ValidateE() {
            var msg = ValidE();
            if (msg != true) {
                if (navigator.appName == "Microsoft Internet Explorer") {
                    document.getElementById("<%=lblERed.ClientID %>").innerText = msg;
                    document.getElementById("<%=lblEgreen.ClientID %>").innerText = "";
                    return false;
                }
                else if (navigator.appName == "Netscape") {
                    document.getElementById("<%=lblERed.ClientID %>").textContent = msg;
                    document.getElementById("<%=lblEgreen.ClientID %>").textContent = "";
                    return false;
                }
            }
            return true;
        }
        //Function for Multilingual Validations
        //Created By Sidharth


        function ValidE() {

            var msg, a;

            msg = DropDownForZeroMul(document.getElementById("<%=DDLEmployeeName.ClientID %>"));
            if (msg != "") {
                document.getElementById("<%=DDLEmployeeName.ClientID %>").focus();
                a = document.getElementById("<%=lblEmployeeName.ClientID %>").innerHTML;
                msg = Spliter(a) + " " + ErrorMessage(msg);
                return msg;
            }


            msg = DropDownForZeroMul(document.getElementById("<%=DDLExperienceType.ClientID %>"));
            if (msg != "") {
                document.getElementById("<%=DDLExperienceType.ClientID %>").focus();
                a = document.getElementById("<%=lblExpT.ClientID %>").innerHTML;
                msg = Spliter(a) + " " + ErrorMessage(msg);
                return msg;
            }


            msg = NameField250E(document.getElementById("<%=txtExperience.ClientID %>"));
            if (msg != "") {
                document.getElementById("<%=txtExperience.ClientID %>").focus();
                a = document.getElementById("<%=lblExp.ClientID %>").innerHTML;
                msg = Spliter(a) + " " + ErrorMessage(msg);
                return msg;
            }
            return true;
        }
        function ValidEV() {
            var msg, a;
            msg = DropDownForZeroMul(document.getElementById("<%=DDLEmployeeName.ClientID %>"));
            if (msg != "") {
                document.getElementById("<%=DDLEmployeeName.ClientID %>").focus();
                a = document.getElementById("<%=lblEmployeeName.ClientID %>").innerHTML;
                msg = Spliter(a) + " " + ErrorMessage(msg);
                return msg;
            }
            return true;
        }
        function ValidateEV() {
            var msg = ValidEV();
            if (msg != true) {
                if (navigator.appName == "Microsoft Internet Explorer") {
                    document.getElementById("<%=lblERed.ClientID %>").innerText = msg;
                    document.getElementById("<%=lblEgreen.ClientID %>").innerText = "";
                    return false;
                }
                else if (navigator.appName == "Netscape") {
                    document.getElementById("<%=lblERed.ClientID %>").textContent = msg;
                    document.getElementById("<%=lblEgreen.ClientID %>").textContent = "";
                    return false;
                }
            }
            return true;
        }

        function ErrorMessage(msg) {
            var SesVar = '<%= Session("Validation") %>';
            var ValidationArray = new Array();
            ValidationArray = SesVar.split(":");
            for (var i = 0; i < ValidationArray.length - 1; i++) {
                if (ValidationArray[i] == msg) {
                    return ValidationArray[i + 1];
                }
            }
        }


        function Spliter(a) {
            var str = a;
            var n = str.indexOf("*");
            if (n != 0 && n != -1) {
                a = a.split("*");
                return a[0];
            }
            var n = str.indexOf("^");
            if (n != 0 && n != -1) {
                a = a.split("^");
                return a[0];
            }
            var n = str.indexOf(":");
            if (n != 0 && n != -1) {
                a = a.split(":");
                return a[0];
            }
        }
    </script>

    <%-- <script language="JavaScript" type="text/javascript">
        function ValidE() {
            var msg;
            msg = DropDownForZero(document.getElementById("<%=DDLEmployeeName.ClientID %>"), 'Employee Name');
            if (msg != "") {
                document.getElementById("<%=DDLEmployeeName.ClientID %>").focus();
                return msg;
            }
            msg = DropDownForZero(document.getElementById("<%=DDLExperienceType.ClientID %>"), 'Experience Type');
            if (msg != "") {
                document.getElementById("<%=DDLExperienceType.ClientID %>").focus();
                return msg;
            }
            msg = NameField250E(document.getElementById("<%=txtExperience.ClientID %>"), 'Experience');
            if (msg != "") {
                document.getElementById("<%=txtExperience.ClientID %>").focus();
                return msg;
            }
            return true;
        }
        function ValidateE() {
            var msg = ValidE();
            if (msg != true) {
                if (navigator.appName == "Microsoft Internet Explorer") {
                    document.getElementById("<%=lblERed.ClientID %>").innerText = msg;
                    document.getElementById("<%=lblEgreen.ClientID %>").innerText = "";
                    return false;
                }
                else if (navigator.appName == "Netscape") {
                    document.getElementById("<%=lblERed.ClientID %>").textContent = msg;
                    document.getElementById("<%=lblEgreen.ClientID %>").textContent = "";
                    return false;
                }
            }
            return true;
        }
        function ValidEV() {
            var msg;
            msg = DropDownForZero(document.getElementById("<%=DDLEmployeeName.ClientID %>"), 'Employee Name');
            if (msg != "") {
                document.getElementById("<%=DDLEmployeeName.ClientID %>").focus();
                return msg;
            }

            return true;
        }
        function ValidateEV() {
            var msg = ValidEV();
            if (msg != true) {
                if (navigator.appName == "Microsoft Internet Explorer") {
                    document.getElementById("<%=lblERed.ClientID %>").innerText = msg;
                    document.getElementById("<%=lblEgreen.ClientID %>").innerText = "";
                    return false;
                }
                else if (navigator.appName == "Netscape") {
                    document.getElementById("<%=lblERed.ClientID %>").textContent = msg;
                    document.getElementById("<%=lblEgreen.ClientID %>").textContent = "";
                    return false;
                }
            }
            return true;
        }
    </script>--%>

    <script type="text/javascript" language="javascript">
        function ValidateP() {
            var msg = ValidP();
            if (msg != true) {
                if (navigator.appName == "Microsoft Internet Explorer") {
                    document.getElementById("<%=lblPRed.ClientID %>").innerText = msg;
                    document.getElementById("<%=lblPgreen.ClientID %>").innerText = "";
                    return false;
                }
                else if (navigator.appName == "Netscape") {
                    document.getElementById("<%=lblPRed.ClientID %>").textContent = msg;
                    document.getElementById("<%=lblPgreen.ClientID %>").textContent = "";
                    return false;
                }
            }
            return true;
        }
        //Function for Multilingual Validations
        //Created By Sidharth

        function ValidP() {

            var msg, a;

            msg = DropDownForZeroMul(document.getElementById("<%=DDLEmployeeName.ClientID %>"));
            if (msg != "") {
                document.getElementById("<%=DDLEmployeeName.ClientID %>").focus();
                a = document.getElementById("<%=lblEmployeeName.ClientID %>").innerHTML;
                msg = Spliter(a) + " " + ErrorMessage(msg);
                return msg;
            }


            msg = NameField250E(document.getElementById("<%=txtTitle.ClientID %>"));
            if (msg != "") {
                document.getElementById("<%=txtTitle.ClientID %>").focus();
                a = document.getElementById("<%=lblTitle.ClientID %>").innerHTML;
                msg = Spliter(a) + " " + ErrorMessage(msg);
                return msg;
            }
            msg = NameField250E(document.getElementById("<%=txtName.ClientID %>"));
            if (msg != "") {
                document.getElementById("<%=txtName.ClientID %>").focus();
                a = document.getElementById("<%=lblName.ClientID %>").innerHTML;
                msg = Spliter(a) + " " + ErrorMessage(msg);
                return msg;
            }

            return true;
        }
        function ValidPV() {
            var msg, a;
            msg = DropDownForZeroMul(document.getElementById("<%=DDLEmployeeName.ClientID %>"));
            if (msg != "") {
                document.getElementById("<%=DDLEmployeeName.ClientID %>").focus();
                a = document.getElementById("<%=lblEmployeeName.ClientID %>").innerHTML;
                msg = Spliter(a) + " " + ErrorMessage(msg);
                return msg;
            }
            function ValidatePV() {
                var msg = ValidPV();
                if (msg != true) {
                    if (navigator.appName == "Microsoft Internet Explorer") {
                        document.getElementById("<%=lblPRed.ClientID %>").innerText = msg;
                        document.getElementById("<%=lblPgreen.ClientID %>").innerText = "";
                        return false;
                    }
                    else if (navigator.appName == "Netscape") {
                        document.getElementById("<%=lblPRed.ClientID %>").textContent = msg;
                        document.getElementById("<%=lblPgreen.ClientID %>").textContent = "";
                        return false;
                    }
                }
                return true;
            }

            function ErrorMessage(msg) {
                var SesVar = '<%= Session("Validation") %>';
                var ValidationArray = new Array();
                ValidationArray = SesVar.split(":");
                for (var i = 0; i < ValidationArray.length - 1; i++) {
                    if (ValidationArray[i] == msg) {
                        return ValidationArray[i + 1];
                    }
                }
            }


            function Spliter(a) {
                var str = a;
                var n = str.indexOf("*");
                if (n != 0 && n != -1) {
                    a = a.split("*");
                    return a[0];
                }
                var n = str.indexOf("^");
                if (n != 0 && n != -1) {
                    a = a.split("^");
                    return a[0];
                }
                var n = str.indexOf(":");
                if (n != 0 && n != -1) {
                    a = a.split(":");
                    return a[0];
                }
            }
        }
    </script>

    <%--  <script language="JavaScript" type="text/javascript">
        function ValidP() {
            var msg;
            msg = DropDownForZero(document.getElementById("<%=DDLEmployeeName.ClientID %>"), 'Employee Name');
            if (msg != "") {
                document.getElementById("<%=DDLEmployeeName.ClientID %>").focus();
                return msg;
            }
            msg = NameField250E(document.getElementById("<%=txtTitle.ClientID %>"), 'Research Paper/Publication Title');
            if (msg != "") {
                document.getElementById("<%=txtTitle.ClientID %>").focus();
                return msg;
            }
            msg = NameField250E(document.getElementById("<%=txtName.ClientID %>"), 'Name of Publisher');
            if (msg != "") {
                document.getElementById("<%=txtName.ClientID %>").focus();
                return msg;
            }
            return true;
        }
        function ValidateP() {
            var msg = ValidP();
            if (msg != true) {
                if (navigator.appName == "Microsoft Internet Explorer") {
                    document.getElementById("<%=lblPRed.ClientID %>").innerText = msg;
                    document.getElementById("<%=lblPgreen.ClientID %>").innerText = "";
                    return false;
                }
                else if (navigator.appName == "Netscape") {
                    document.getElementById("<%=lblPRed.ClientID %>").textContent = msg;
                    document.getElementById("<%=lblPgreen.ClientID %>").textContent = "";
                    return false;
                }
            }
            return true;
        }
        function ValidPV() {
            var msg;
            msg = DropDownForZero(document.getElementById("<%=DDLEmployeeName.ClientID %>"), 'Employee Name');
            if (msg != "") {
                document.getElementById("<%=DDLEmployeeName.ClientID %>").focus();
                return msg;
            }

            return true;
        }
        function ValidatePV() {
            var msg = ValidPV();
            if (msg != true) {
                if (navigator.appName == "Microsoft Internet Explorer") {
                    document.getElementById("<%=lblPRed.ClientID %>").innerText = msg;
                    document.getElementById("<%=lblPgreen.ClientID %>").innerText = "";
                    return false;
                }
                else if (navigator.appName == "Netscape") {
                    document.getElementById("<%=lblPRed.ClientID %>").textContent = msg;
                    document.getElementById("<%=lblPgreen.ClientID %>").textContent = "";
                    return false;
                }
            }
            return true;
        }
    </script>
    --%>

    <script type="text/javascript" language="javascript">
        function ValidateMed() {
            var msg = ValidMed();

            if (msg != true) {
                document.getElementById("<%=lblRd.ClientID%>").innerText = msg;
                document.getElementById("<%=lblGrn.ClientID%>").innerText = "";
                return false;
            }
            else if (navigator.appName == "Netscape") {
                document.getElementById("<%=lblRd.ClientID%>").textContent = msg;
                document.getElementById("<%=lblGrn.ClientID%>").textContent = "";
                return false;
            }
            return true;
        }

        //Function for Multilingual Validations
        //Created By Sidharth


        function ValidMed() {

            var msg, a;

            msg = DropDownMul(document.getElementById("<%=DDLEmployeeName1.ClientID %>"));
            if (msg != "") {
                document.getElementById("<%=DDLEmployeeName1.ClientID %>").focus();
                a = document.getElementById("<%=lblStdid.ClientID %>").innerHTML;
                msg = Spliter(a) + " " + ErrorMessage(msg);
                return msg;
            }


            msg = Field50Mul(document.getElementById("<%=txtHeight.ClientID %>"));
            if (msg != "") {
                document.getElementById("<%=txtHeight.ClientID %>").focus();
                a = document.getElementById("<%=lblHeight.ClientID %>").innerHTML;
                msg = Spliter(a) + " " + ErrorMessage(msg);
                return msg;
            }
            msg = Field50Mul(document.getElementById("<%=txtWeight.ClientID %>"));
            if (msg != "") {
                document.getElementById("<%=txtWeight.ClientID %>").focus();
                a = document.getElementById("<%=lblWeight.ClientID %>").innerHTML;
                msg = Spliter(a) + " " + ErrorMessage(msg);
                return msg;
            }
            msg = Field50Mul(document.getElementById("<%=txtBloodGroup.ClientID %>"));
            if (msg != "") {
                document.getElementById("<%=txtBloodGroup.ClientID %>").focus();
                a = document.getElementById("<%=lblBloodGroup.ClientID %>").innerHTML;
                msg = Spliter(a) + " " + ErrorMessage(msg);
                return msg;
            }
            return true;
        }


        function ErrorMessage(msg) {
            var SesVar = '<%= Session("Validation") %>';
            var ValidationArray = new Array();
            ValidationArray = SesVar.split(":");
            for (var i = 0; i < ValidationArray.length - 1; i++) {
                if (ValidationArray[i] == msg) {
                    return ValidationArray[i + 1];
                }
            }
        }


        function Spliter(a) {
            var str = a;
            var n = str.indexOf("*");
            if (n != 0 && n != -1) {
                a = a.split("*");
                return a[0];
            }
            var n = str.indexOf("^");
            if (n != 0 && n != -1) {
                a = a.split("^");
                return a[0];
            }
            var n = str.indexOf(":");
            if (n != 0 && n != -1) {
                a = a.split(":");
                return a[0];
            }
        }
    </script>

    <script type="text/javascript" language="javascript">
        function ValidMed() {
            var msg;
            msg = DropDownForZero(document.getElementById("<%=DDLEmployeeName1.ClientID%>"), 'Employee Name');

            if (msg != "") {
                document.getElementById("<%=DDLEmployeeName1.ClientID%>").focus();
                return msg;
            }

            msg = Field50(document.getElementById("<%=txtHeight.ClientID %>"), 'Height');
            if (msg != "") {
                document.getElementById("<%=txtHeight.ClientID %>").focus();
                return msg;
            }

            msg = Field50(document.getElementById("<%=txtWeight.ClientID %>"), 'Weight');
            if (msg != "") {
                document.getElementById("<%=txtWeight.ClientID %>").focus();
                return msg;
            }

            msg = Field50(document.getElementById("<%=txtBloodGroup.ClientID %>"), 'Blood Group');
            if (msg != "") {
                document.getElementById("<%=txtBloodGroup.ClientID %>").focus();
                return msg;
            }

            return true;
        }
        function ValidateMed() {
            var msg = ValidMed();

            if (msg != true) {
                if (navigator.appName == "Microsoft Internet Explorer") {
                    document.getElementById("<%=lblRd.ClientID%>").innerText = msg;
                    document.getElementById("<%=lblGrn.ClientID%>").innerText = "";
                    return false;
                }
                else if (navigator.appName == "Netscape") {
                    document.getElementById("<%=lblRd.ClientID%>").textContent = msg;
                    document.getElementById("<%=lblGrn.ClientID%>").textContent = "";
                    return false;
                }
                return true;
            }
        }
    </script>

    <%--
    <script language="JavaScript" type="text/javascript">
        function ValidQ() {
            var msg;
//            msg = DropDownForZero(document.getElementById("<%=DDLEmployeeName.ClientID %>"), 'Employee Name');
//            if (msg != "") {
//                document.getElementById("<%=DDLEmployeeName.ClientID %>").focus();
//                return msg;
//            }
            msg = DropDownForZero(document.getElementById("<%=DDLQualificationType.ClientID %>"), 'Qualification Type');
            if (msg != "") {
                document.getElementById("<%=DDLQualificationType.ClientID %>").focus();
                return msg;
            }
            msg = NameField250E(document.getElementById("<%=txtQualificationf.ClientID %>"), 'Qualification');
            if (msg != "") {
                document.getElementById("<%=txtQualificationf.ClientID %>").focus();
                return msg;
            }

            return true;
        }
        function ValidateQ() {
            var msg = ValidQ();
            if (msg != true) {
                if (navigator.appName == "Microsoft Internet Explorer") {
                    document.getElementById("<%=lblQRed.ClientID %>").innerText = msg;
                    document.getElementById("<%=lblQgreen.ClientID %>").innerText = "";
                    return false;
                }
                else if (navigator.appName == "Netscape") {
                    document.getElementById("<%=lblQRed.ClientID %>").textContent = msg;
                    document.getElementById("<%=lblQgreen.ClientID %>").textContent = "";
                    return false;
                }
            }
            return true;
        }
        function ValidQV() {
            var msg;
            msg = DropDownForZero(document.getElementById("<%=DDLEmployeeName.ClientID %>"), 'Employee Name');
            if (msg != "") {
                document.getElementById("<%=DDLEmployeeName.ClientID %>").focus();
                return msg;
            }

            return true;
        }
        function ValidateQV() {
            var msg = ValidQV();
            if (msg != true) {
                if (navigator.appName == "Microsoft Internet Explorer") {
                    document.getElementById("<%=lblQRed.ClientID %>").innerText = msg;
                    document.getElementById("<%=lblQgreen.ClientID %>").innerText = "";
                    return false;
                }
                else if (navigator.appName == "Netscape") {
                    document.getElementById("<%=lblQRed.ClientID %>").textContent = msg;
                    document.getElementById("<%=lblQgreen.ClientID %>").textContent = "";
                    return false;
                }
            }
            return true;
        }
    </script>--%>

    <script language="JavaScript" type="text/javascript">

        function ValidateE() {
            var msg = ValidE();
            if (msg != true) {
                if (navigator.appName == "Microsoft Internet Explorer") {
                    document.getElementById("<%=lblERed.ClientID %>").innerText = msg;
                    document.getElementById("<%=lblEgreen.ClientID %>").innerText = "";
                    return false;
                }
                else if (navigator.appName == "Netscape") {
                    document.getElementById("<%=lblERed.ClientID %>").textContent = msg;
                    document.getElementById("<%=lblEgreen.ClientID %>").textContent = "";
                    return false;
                }
            }
            return true;
        }
        //Function for Multilingual Validations
        //Created By Sidharth


        function ValidE() {

            var msg, a;

            msg = DropDownForZeroMul(document.getElementById("<%=DDLEmployeeName.ClientID %>"));
            if (msg != "") {
                document.getElementById("<%=DDLEmployeeName.ClientID %>").focus();
                a = document.getElementById("<%=lblEmployeeName.ClientID %>").innerHTML;
                msg = Spliter(a) + " " + ErrorMessage(msg);
                return msg;
            }


            msg = DropDownForZeroMul(document.getElementById("<%=DDLExperienceType.ClientID %>"));
            if (msg != "") {
                document.getElementById("<%=DDLExperienceType.ClientID %>").focus();
                a = document.getElementById("<%=lblExpT.ClientID %>").innerHTML;
                msg = Spliter(a) + " " + ErrorMessage(msg);
                return msg;
            }


            msg = NameField250E(document.getElementById("<%=txtExperience.ClientID %>"));
            if (msg != "") {
                document.getElementById("<%=txtExperience.ClientID %>").focus();
                a = document.getElementById("<%=lblExp.ClientID %>").innerHTML;
                msg = Spliter(a) + " " + ErrorMessage(msg);
                return msg;
            }
            return true;
        }
        function ValidEV() {
            var msg, a;
            msg = DropDownForZeroMul(document.getElementById("<%=DDLEmployeeName.ClientID %>"));
            if (msg != "") {
                document.getElementById("<%=DDLEmployeeName.ClientID %>").focus();
                a = document.getElementById("<%=lblEmployeeName.ClientID %>").innerHTML;
                msg = Spliter(a) + " " + ErrorMessage(msg);
                return msg;
            }
            return true;
        }
        function ValidateEV() {
            var msg = ValidEV();
            if (msg != true) {
                if (navigator.appName == "Microsoft Internet Explorer") {
                    document.getElementById("<%=lblERed.ClientID %>").innerText = msg;
                    document.getElementById("<%=lblEgreen.ClientID %>").innerText = "";
                    return false;
                }
                else if (navigator.appName == "Netscape") {
                    document.getElementById("<%=lblERed.ClientID %>").textContent = msg;
                    document.getElementById("<%=lblEgreen.ClientID %>").textContent = "";
                    return false;
                }
            }
            return true;
        }

        function ErrorMessage(msg) {
            var SesVar = '<%= Session("Validation") %>';
            var ValidationArray = new Array();
            ValidationArray = SesVar.split(":");
            for (var i = 0; i < ValidationArray.length - 1; i++) {
                if (ValidationArray[i] == msg) {
                    return ValidationArray[i + 1];
                }
            }
        }


        function Spliter(a) {
            var str = a;
            var n = str.indexOf("*");
            if (n != 0 && n != -1) {
                a = a.split("*");
                return a[0];
            }
            var n = str.indexOf("^");
            if (n != 0 && n != -1) {
                a = a.split("^");
                return a[0];
            }
            var n = str.indexOf(":");
            if (n != 0 && n != -1) {
                a = a.split(":");
                return a[0];
            }
        }
    </script>

    <%-- <script language="JavaScript" type="text/javascript">
//        function ValidE() {
//            var msg;
//            msg = DropDownForZero(document.getElementById("<%=DDLEmployeeName.ClientID %>"), 'Employee Name');
//            if (msg != "") {
//                document.getElementById("<%=DDLEmployeeName.ClientID %>").focus();
//                return msg;
//            }
//            msg = DropDownForZero(document.getElementById("<%=DDLExperienceType.ClientID %>"), 'Experience Type');
//            if (msg != "") {
//                document.getElementById("<%=DDLExperienceType.ClientID %>").focus();
//                return msg;
//            }
//            msg = NameField250E(document.getElementById("<%=txtExperience.ClientID %>"), 'Experience');
//            if (msg != "") {
//                document.getElementById("<%=txtExperience.ClientID %>").focus();
//                return msg;
//            }
//            return true;
//        }
//        function ValidateE() {
//            var msg = ValidE();
//            if (msg != true) {
//                if (navigator.appName == "Microsoft Internet Explorer") {
//                    document.getElementById("<%=lblERed.ClientID %>").innerText = msg;
//                    document.getElementById("<%=lblEgreen.ClientID %>").innerText = "";
//                    return false;
//                }
//                else if (navigator.appName == "Netscape") {
//                    document.getElementById("<%=lblERed.ClientID %>").textContent = msg;
//                    document.getElementById("<%=lblEgreen.ClientID %>").textContent = "";
//                    return false;
//                }
//            }
//            return true;
//        }
//        function ValidEV() {
//            var msg;
//            msg = DropDownForZero(document.getElementById("<%=DDLEmployeeName.ClientID %>"), 'Employee Name');
//            if (msg != "") {
//                document.getElementById("<%=DDLEmployeeName.ClientID %>").focus();
//                return msg;
//            }

//            return true;
//        }
//        function ValidateEV() {
//            var msg = ValidEV();
//            if (msg != true) {
//                if (navigator.appName == "Microsoft Internet Explorer") {
//                    document.getElementById("<%=lblERed.ClientID %>").innerText = msg;
//                    document.getElementById("<%=lblEgreen.ClientID %>").innerText = "";
//                    return false;
//                }
//                else if (navigator.appName == "Netscape") {
//                    document.getElementById("<%=lblERed.ClientID %>").textContent = msg;
//                    document.getElementById("<%=lblEgreen.ClientID %>").textContent = "";
//                    return false;
//                }
//            }
//            return true;
//        }
//    </script>
//    --%>

    <script type="text/javascript" language="javascript">
        function ValidateP() {
            var msg = ValidP();
            if (msg != true) {
                if (navigator.appName == "Microsoft Internet Explorer") {
                    document.getElementById("<%=lblPRed.ClientID %>").innerText = msg;
                    document.getElementById("<%=lblPgreen.ClientID %>").innerText = "";
                    return false;
                }
                else if (navigator.appName == "Netscape") {
                    document.getElementById("<%=lblPRed.ClientID %>").textContent = msg;
                    document.getElementById("<%=lblPgreen.ClientID %>").textContent = "";
                    return false;
                }
            }
            return true;
        }
        //Function for Multilingual Validations
        //Created By Sidharth

        function ValidP() {

            var msg, a;

            msg = DropDownForZeroMul(document.getElementById("<%=DDLEmployeeName.ClientID %>"));
            if (msg != "") {
                document.getElementById("<%=DDLEmployeeName.ClientID %>").focus();
                a = document.getElementById("<%=lblEmployeeName.ClientID %>").innerHTML;
                msg = Spliter(a) + " " + ErrorMessage(msg);
                return msg;
            }


            msg = NameField250E(document.getElementById("<%=txtTitle.ClientID %>"));
            if (msg != "") {
                document.getElementById("<%=txtTitle.ClientID %>").focus();
                a = document.getElementById("<%=lblTitle.ClientID %>").innerHTML;
                msg = Spliter(a) + " " + ErrorMessage(msg);
                return msg;
            }
            msg = NameField250E(document.getElementById("<%=txtName.ClientID %>"));
            if (msg != "") {
                document.getElementById("<%=txtName.ClientID %>").focus();
                a = document.getElementById("<%=lblName.ClientID %>").innerHTML;
                msg = Spliter(a) + " " + ErrorMessage(msg);
                return msg;
            }

            return true;
        }
        function ValidPV() {
            var msg, a;
            msg = DropDownForZeroMul(document.getElementById("<%=DDLEmployeeName.ClientID %>"));
            if (msg != "") {
                document.getElementById("<%=DDLEmployeeName.ClientID %>").focus();
                a = document.getElementById("<%=lblEmployeeName.ClientID %>").innerHTML;
                msg = Spliter(a) + " " + ErrorMessage(msg);
                return msg;
            }
            function ValidatePV() {
                var msg = ValidPV();
                if (msg != true) {
                    if (navigator.appName == "Microsoft Internet Explorer") {
                        document.getElementById("<%=lblPRed.ClientID %>").innerText = msg;
                        document.getElementById("<%=lblPgreen.ClientID %>").innerText = "";
                        return false;
                    }
                    else if (navigator.appName == "Netscape") {
                        document.getElementById("<%=lblPRed.ClientID %>").textContent = msg;
                        document.getElementById("<%=lblPgreen.ClientID %>").textContent = "";
                        return false;
                    }
                }
                return true;
            }

            function ErrorMessage(msg) {
                var SesVar = '<%= Session("Validation") %>';
                var ValidationArray = new Array();
                ValidationArray = SesVar.split(":");
                for (var i = 0; i < ValidationArray.length - 1; i++) {
                    if (ValidationArray[i] == msg) {
                        return ValidationArray[i + 1];
                    }
                }
            }


            function Spliter(a) {
                var str = a;
                var n = str.indexOf("*");
                if (n != 0 && n != -1) {
                    a = a.split("*");
                    return a[0];
                }
                var n = str.indexOf("^");
                if (n != 0 && n != -1) {
                    a = a.split("^");
                    return a[0];
                }
                var n = str.indexOf(":");
                if (n != 0 && n != -1) {
                    a = a.split(":");
                    return a[0];
                }
            }
        }
    </script>

    <%--<script language="JavaScript" type="text/javascript">
        function ValidP() {
            var msg;
            msg = DropDownForZero(document.getElementById("<%=DDLEmployeeName.ClientID %>"), 'Employee Name');
            if (msg != "") {
                document.getElementById("<%=DDLEmployeeName.ClientID %>").focus();
                return msg;
            }
            msg = NameField250E(document.getElementById("<%=txtTitle.ClientID %>"), 'Research Paper/Publication Title');
            if (msg != "") {
                document.getElementById("<%=txtTitle.ClientID %>").focus();
                return msg;
            }
            msg = NameField250E(document.getElementById("<%=txtName.ClientID %>"), 'Name of Publisher');
            if (msg != "") {
                document.getElementById("<%=txtName.ClientID %>").focus();
                return msg;
            }
            return true;
        }
        function ValidateP() {
            var msg = ValidP();
            if (msg != true) {
                if (navigator.appName == "Microsoft Internet Explorer") {
                    document.getElementById("<%=lblPRed.ClientID %>").innerText = msg;
                    document.getElementById("<%=lblPgreen.ClientID %>").innerText = "";
                    return false;
                }
                else if (navigator.appName == "Netscape") {
                    document.getElementById("<%=lblPRed.ClientID %>").textContent = msg;
                    document.getElementById("<%=lblPgreen.ClientID %>").textContent = "";
                    return false;
                }
            }
            return true;
        }
        function ValidPV() {
            var msg;
            msg = DropDownForZero(document.getElementById("<%=DDLEmployeeName.ClientID %>"), 'Employee Name');
            if (msg != "") {
                document.getElementById("<%=DDLEmployeeName.ClientID %>").focus();
                return msg;
            }

            return true;
        }
        function ValidatePV() {
            var msg = ValidPV();
            if (msg != true) {
                if (navigator.appName == "Microsoft Internet Explorer") {
                    document.getElementById("<%=lblPRed.ClientID %>").innerText = msg;
                    document.getElementById("<%=lblPgreen.ClientID %>").innerText = "";
                    return false;
                }
                else if (navigator.appName == "Netscape") {
                    document.getElementById("<%=lblPRed.ClientID %>").textContent = msg;
                    document.getElementById("<%=lblPgreen.ClientID %>").textContent = "";
                    return false;
                }
            }
            return true;
        }
    </script>--%>

    <script type="text/javascript" language="javascript">
        function ValidateMed() {
            var msg = ValidMed();

            if (msg != true) {
                document.getElementById("<%=lblRd.ClientID%>").innerText = msg;
                document.getElementById("<%=lblGrn.ClientID%>").innerText = "";
                return false;
            }
            else if (navigator.appName == "Netscape") {
                document.getElementById("<%=lblRd.ClientID%>").textContent = msg;
                document.getElementById("<%=lblGrn.ClientID%>").textContent = "";
                return false;
            }
            return true;
        }

        //Function for Multilingual Validations
        //Created By Sidharth


        function ValidMed() {

            var msg, a;

            msg = DropDownMul(document.getElementById("<%=DDLEmployeeName1.ClientID %>"));
            if (msg != "") {
                document.getElementById("<%=DDLEmployeeName1.ClientID %>").focus();
                a = document.getElementById("<%=lblStdid.ClientID %>").innerHTML;
                msg = Spliter(a) + " " + ErrorMessage(msg);
                return msg;
            }


            msg = Field50Mul(document.getElementById("<%=txtHeight.ClientID %>"));
            if (msg != "") {
                document.getElementById("<%=txtHeight.ClientID %>").focus();
                a = document.getElementById("<%=lblHeight.ClientID %>").innerHTML;
                msg = Spliter(a) + " " + ErrorMessage(msg);
                return msg;
            }
            msg = Field50Mul(document.getElementById("<%=txtWeight.ClientID %>"));
            if (msg != "") {
                document.getElementById("<%=txtWeight.ClientID %>").focus();
                a = document.getElementById("<%=lblWeight.ClientID %>").innerHTML;
                msg = Spliter(a) + " " + ErrorMessage(msg);
                return msg;
            }
            msg = Field50Mul(document.getElementById("<%=txtBloodGroup.ClientID %>"));
            if (msg != "") {
                document.getElementById("<%=txtBloodGroup.ClientID %>").focus();
                a = document.getElementById("<%=lblBloodGroup.ClientID %>").innerHTML;
                msg = Spliter(a) + " " + ErrorMessage(msg);
                return msg;
            }
            return true;
        }


        function ErrorMessage(msg) {
            var SesVar = '<%= Session("Validation") %>';
            var ValidationArray = new Array();
            ValidationArray = SesVar.split(":");
            for (var i = 0; i < ValidationArray.length - 1; i++) {
                if (ValidationArray[i] == msg) {
                    return ValidationArray[i + 1];
                }
            }
        }


        function Spliter(a) {
            var str = a;
            var n = str.indexOf("*");
            if (n != 0 && n != -1) {
                a = a.split("*");
                return a[0];
            }
            var n = str.indexOf("^");
            if (n != 0 && n != -1) {
                a = a.split("^");
                return a[0];
            }
            var n = str.indexOf(":");
            if (n != 0 && n != -1) {
                a = a.split(":");
                return a[0];
            }
        }
    </script>

    <a name="top">
        <div align="right">
            <a href="#bottom">
                <asp:Image ID="Image4" runat="server" ImageUrl="Images/down.png" Width="30px" Height="30px" /></a>
        </div>
    </a>
    <ajaxToolkit:TabContainer ID="TabContainer1" runat="server" CssClass="ajax__tab_xp"
        ActiveTabIndex="0">
        <ajaxToolkit:TabPanel ID="T1" runat="server" HeaderText="Employee Master" TabIndex="1">
            <HeaderTemplate>
                Employee Master
            </HeaderTemplate>
            <ContentTemplate>
                <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                    <Triggers>
                        <asp:PostBackTrigger ControlID="Upload" />
                        <asp:AsyncPostBackTrigger ControlID="Btnadd" EventName="Click" />
                    </Triggers>
                    <ContentTemplate>
                        <div>
                            <center>
                                <h1 class="headingTxt">
                                    EMPLOYEE MASTER</h1>
                                <table class="custTable">
                                    <tbody>
                                        <tr>
                                            <td colspan="4">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right">
                                                <asp:Label ID="lblEmpName" runat="server" SkinID="lblRsz" Text="Employee Name*^ :&nbsp;"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtEmpName" runat="server" BorderColor="White" CausesValidation="True"
                                                    SkinID="txt" TabIndex="2"></asp:TextBox>
                                                <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender10" runat="server"
                                                    FilterMode="InvalidChars" FilterType="Numbers" InvalidChars="'" TargetControlID="txtEmpName">
                                                </ajaxToolkit:FilteredTextBoxExtender>
                                            </td>
                                            <td align="right">
                                                <asp:Label ID="lblEmpType" runat="server" Text="Employment Type^ :&nbsp;" SkinID="lblRsz"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:DropDownList ID="ddlEmpType" runat="server" SkinID="ddl" TabIndex="3">
                                                    <asp:ListItem Value="0" Text="Select"></asp:ListItem>
                                                    <asp:ListItem Value="FullTime" Text="FullTime"></asp:ListItem>
                                                    <asp:ListItem Value="PartTime" Text="PartTime"></asp:ListItem>
                                                    <%-- <asp:ListItem Value="Visiting" Text="Visiting"></asp:ListItem>
                                                    <asp:ListItem Value="Honorary" Text="Honorary"></asp:ListItem>--%>
                                                </asp:DropDownList>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right">
                                                <asp:Label ID="lblEmpCode" runat="server" Width="150px" Text="Employee Code*^ :&nbsp;"
                                                    SkinID="lblRsz"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtEmpcode" runat="server" TabIndex="4" BorderColor="White" SkinID="txt"></asp:TextBox>
                                                <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" runat="server"
                                                    FilterMode="InvalidChars" FilterType="Numbers" InvalidChars="'" TargetControlID="txtEmpcode">
                                                </ajaxToolkit:FilteredTextBoxExtender>
                                            </td>
                                            <td align="right">
                                                <asp:Label ID="lblempcategory" runat="server" Width="180px" Text="Employee Category^ :&nbsp;"
                                                    SkinID="lblRsz"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:DropDownList ID="ddlempcategory" runat="server" SkinID="ddl" TabIndex="5">
                                                    <asp:ListItem Value="0" Text="Select"></asp:ListItem>
                                                    <asp:ListItem Value="General" Text="General"></asp:ListItem>
                                                </asp:DropDownList>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right">
                                                <asp:Label ID="lblGender" runat="server" Text="Gender*^ :&nbsp;" SkinID="lbl"></asp:Label>
                                            </td>
                                            <td align="left">
                                                <asp:DropDownList ID="ddlSex" runat="server" SkinID="ddl" TabIndex="6">
                                                    <asp:ListItem Selected="true" Value="Select">Select</asp:ListItem>
                                                    <asp:ListItem>Female</asp:ListItem>
                                                    <asp:ListItem>Male</asp:ListItem>
                                                </asp:DropDownList>
                                            </td>
                                            <td align="right">
                                                <asp:Label ID="lblDOB" runat="server" Text="Date of Birth^ :&nbsp;" SkinID="lbl"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtDOB" runat="server" TabIndex="7" SkinID="txt"></asp:TextBox>
                                                <ajaxToolkit:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="txtDOB"
                                                    Format="dd-MMM-yyyy" SkinID="CalendarView">
                                                </ajaxToolkit:CalendarExtender>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right">
                                                <asp:Label ID="lblDOJ" runat="server" Text="Date of Joining^ :&nbsp;" SkinID="lbl"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtDOJ" runat="server" TabIndex="8" BorderColor="White" SkinID="txt"
                                                    CausesValidation="true"></asp:TextBox>
                                                <ajaxToolkit:CalendarExtender ID="CalendarExtender2" runat="server" TargetControlID="txtDOJ"
                                                    Format="dd-MMM-yyyy" SkinID="CalendarView">
                                                </ajaxToolkit:CalendarExtender>
                                            </td>
                                            <td align="right">
                                                <asp:Label ID="lblDept" runat="server" Text="Department^ :&nbsp;" SkinID="lblRsz"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:DropDownList ID="ddlDept" runat="server" DataSourceID="ObjDept1" DataTextField="DeptName"
                                                    DataValueField="DeptID" SkinID="ddl"  TabIndex="9">
                                                </asp:DropDownList>
                                                <asp:ObjectDataSource ID="ObjDept1" runat="server" TypeName="BLIndividualFormMaster"
                                                    SelectMethod="GetddlDept"></asp:ObjectDataSource>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="4">
                                                <hr />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right">
                                                <asp:Label ID="lblDeptType" runat="server" Text="Branch Type^ :&nbsp;" SkinID="lbl"></asp:Label>
                                            </td>
                                            <td align="left">
                                                <asp:DropDownList ID="DDLDeptType" runat="server" DataSourceID="obBranchType" SkinID="ddl"
                                                    AppendDataBoundItems="true" DataValueField="BranchTypeCode" DataTextField="BranchTypeName"
                                                    TabIndex="10" AutoPostBack="true">
                                                    <asp:ListItem Selected="true" Value="Select">Select</asp:ListItem>
                                                </asp:DropDownList>
                                                <asp:ObjectDataSource ID="obBranchType" runat="server" TypeName="BLIndividualFormMaster"
                                                    SelectMethod="GetDeptTypeDDL" OldValuesParameterFormatString="original_{0}">
                                                </asp:ObjectDataSource>
                                            </td>
                                            <td align="right">
                                                <asp:Label ID="lblDesignation" runat="server" Text="Designation^ :&nbsp;" SkinID="lbl"></asp:Label>
                                            </td>
                                            <td align="left">
                                                <asp:DropDownList ID="ddldesignation" runat="server" DataSourceID="ObjDesignation"
                                                    DataTextField="Designation" DataValueField="DesignationCode" SkinID="ddl" TabIndex="12">
                                                </asp:DropDownList>
                                                <asp:ObjectDataSource ID="ObjDesignation" runat="server" TypeName="BLIndividualFormMaster"
                                                    SelectMethod="GetDesignationOnBranch">
                                                    <SelectParameters>
                                                        <asp:ControlParameter ControlID="Ddldpt" PropertyName="SelectedValue" Name="BranchCode"
                                                            DefaultValue="0" Type="String" />
                                                    </SelectParameters>
                                                </asp:ObjectDataSource>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right">
                                                <asp:Label ID="lblDeptName" runat="server" Text="Branch :&nbsp;" SkinID="lbl"></asp:Label>
                                            </td>
                                            <td align="left">
                                                <asp:DropDownList ID="Ddldpt" runat="server" DataSourceID="objDept" SkinID="ddlRsz"
                                                    DataValueField="BranchCode" DataTextField="BranchName" TabIndex="11" Width="157"
                                                    AutoPostBack="true">
                                                </asp:DropDownList>
                                                <asp:ObjectDataSource ID="objDept" runat="server" TypeName="BLIndividualFormMaster"
                                                    SelectMethod="Getdeptcombo">
                                                    <SelectParameters>
                                                        <asp:ControlParameter ControlID="DDLDeptType" PropertyName="SelectedValue" Name="BranchTypeCode"
                                                            DefaultValue="01" Type="String" />
                                                    </SelectParameters>
                                                </asp:ObjectDataSource>
                                            </td>
                                            <td align="right">
                                                <asp:Label ID="lblGrade" runat="server" Text="Salary Grade :&nbsp;" SkinID="lbl"></asp:Label>
                                            </td>
                                            <td align="left">
                                                <asp:DropDownList ID="ddlGrade" runat="server" DataSourceID="objGrade" DataValueField="Grade_Auto"
                                                    DataTextField="Grade" TabIndex="13" SkinID="ddl">
                                                </asp:DropDownList>
                                                <asp:ObjectDataSource ID="objGrade" runat="server" TypeName="BLIndividualFormMaster"
                                                    SelectMethod="GetGrade"></asp:ObjectDataSource>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="4">
                                                <hr />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right">
                                                <asp:Label ID="lblContactNo" runat="server" Text="Mobile No^ :&nbsp;" SkinID="lbl"></asp:Label>
                                            </td>
                                            <td align="left">
                                                <asp:TextBox ID="txtContactNo" runat="server" TabIndex="14" BorderColor="White" SkinID="txt" MaxLength ="15"></asp:TextBox>
                                                <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender8" runat="server"
                                                    FilterMode="ValidChars" FilterType="Custom" ValidChars="0123456789+,/\-" TargetControlID="txtContactNo">
                                                </ajaxToolkit:FilteredTextBoxExtender>
                                            </td>
                                            <td align="right" rowspan="4">
                                                <asp:Label ID="lblPhoto" runat="server" Width ="90" Text="Photo :&nbsp;" SkinID="lbl"></asp:Label>
                                                <br />
                                            </td>
                                            <td rowspan="3" align ="right">
                                                <asp:Image ID="Image2" runat="server" ImageUrl="~/Images/imageupload.gif" Width="90px"
                                                    Height="90px" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right">
                                                <asp:Label ID="lblLandlinNo" runat="server" Text="Landline No :&nbsp;" SkinID="lbl" ></asp:Label>
                                            </td>
                                            <td align="left">
                                                <asp:TextBox ID="txtLandlinNo" runat="server" TabIndex="15" BorderColor="White" SkinID="txt" MaxLength ="15"></asp:TextBox>
                                                <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender4" runat="server"
                                                    FilterMode="ValidChars" FilterType="Custom" ValidChars="0123456789+,/\-" TargetControlID="txtContactNo">
                                                </ajaxToolkit:FilteredTextBoxExtender>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right">
                                                <asp:Label ID="lblEmail" runat="server" Text="Email^ :&nbsp;" SkinID="lbl"></asp:Label>
                                            </td>
                                            <td align="left">
                                                <asp:TextBox ID="txtEmail" runat="server" TabIndex="16" BorderColor="White" SkinID="txtL"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right">
                                                <asp:Label ID="lblqualification" runat="server" Text="Qualification^ :&nbsp;" SkinID="lblRsz"></asp:Label>
                                            </td>
                                            <td align="left">
                                                <asp:TextBox ID="txtqualification" TabIndex="17" runat="server" SkinID="txt"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right">
                                                <asp:Label ID="lblNicNo" runat="server" Text="Aadhaar/NIC No.^ :&nbsp;" SkinID="lblRsz"
                                                    Width="250px"></asp:Label>
                                            </td>
                                            <td align="left">
                                                <asp:TextBox ID="txtNicNo" runat="server" SkinID="txt" TabIndex="18"></asp:TextBox>
                                                <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender14" runat="server"
                                                    FilterMode="InvalidChars" FilterType="Numbers" InvalidChars="'~!@#$%^&*()_+,<>.?/:;}]{[|\"
                                                    TargetControlID="txtNicNo">
                                                </ajaxToolkit:FilteredTextBoxExtender>
                                            </td>
                                            <td align="right" colspan="2">
                                                <asp:FileUpload ID="FileUpload1" runat="server" BorderColor="White" SkinID="btn"
                                                    TabIndex="19" />
                                                <asp:Button ID="Upload" runat="server" CssClass="ButtonClass" SkinID="btn" TabIndex="21"
                                                    Text="UPLOAD" Height="32px" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="4">
                                                <hr />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="center" colspan="2">
                                                <asp:Label ID="lblAddress" runat="server" SkinID="lblRsz" Width="200px" Text="Permanent Address* :&nbsp;"></asp:Label>
                                            </td>
                                            <td align="center">
                                                <asp:Label ID="lblCAddress" runat="server" SkinID="lblRsz" Width="200px" Text="Correspondence Address :&nbsp;"></asp:Label>
                                            </td>
                                            <td align="left">
                                            </td>
                                            <td align="left" valign="top">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="center" colspan="2">
                                                <asp:TextBox ID="txtAddress" runat="server" SkinID="txtRsz" Height="50" Width="200px"
                                                    TabIndex="21" TextMode="MultiLine"></asp:TextBox>
                                            </td>
                                            <td align="center">
                                                <asp:TextBox ID="txtCaddr" runat="server" SkinID="txtRsz" Height="50" Width="200px"
                                                    TabIndex="22" TextMode="MultiLine"></asp:TextBox>
                                            </td>
                                            <td align="left" valign="top">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="4">
                                                <hr />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right">
                                                <asp:Label ID="lblCountry" runat="server" Text="Country^ :&nbsp;" SkinID="lbl"></asp:Label>
                                            </td>
                                            <td align="left">
                                                <asp:TextBox ID="txtCountry" runat="server" BorderColor="White" SkinID="txt" TabIndex="23"></asp:TextBox>
                                            </td>
                                            <td align="right">
                                                <asp:Label ID="lblSpouseName" runat="server" SkinID="lblRsz" Width="120px" Text="Spouse Name :&nbsp;"></asp:Label>
                                            </td>
                                            <td align="left">
                                                <asp:TextBox ID="txtSpouseName" runat="server" SkinID="txt" TabIndex="24"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right">
                                                <asp:Label ID="lblAcctBranch" runat="server" Text="Acct Bank :&nbsp;" SkinID="lbl"></asp:Label>
                                            </td>
                                            <td align="left">
                                                <asp:TextBox ID="txtAcctBranch" runat="server" TabIndex="25" BorderColor="White"
                                                    SkinID="txt" CausesValidation="true"></asp:TextBox>
                                                <ajaxToolkit:AutoCompleteExtender ID="AutoCompleteExtender1" runat="server" OnClientPopulated="HideImage1"
                                                    OnClientPopulating="ShowImage1" TargetControlID="txtAcctBranch" MinimumPrefixLength="3"
                                                    CompletionInterval="1000" FirstRowSelected="true" EnableCaching="true" ServiceMethod="getBankExt"
                                                    ServicePath="TextBoxExt.asmx" OnClientItemSelected="SplitBank" CompletionListCssClass="completeListStyle">
                                                </ajaxToolkit:AutoCompleteExtender>
                                                <ajaxToolkit:TextBoxWatermarkExtender ID="TextBoxWatermarkExtender1" runat="server"
                                                    SkinID="watermark" TargetControlID="txtAcctBranch" WatermarkText="Type first 3 characters">
                                                </ajaxToolkit:TextBoxWatermarkExtender>
                                                <asp:HiddenField ID="HidBankId" runat="server" />
                                            </td>
                                            <td align="right">
                                                <asp:Label ID="lblFatherName" runat="server" SkinID="lblRsz" Width="120px" Text="Father Name :&nbsp;"></asp:Label>
                                            </td>
                                            <td align="left">
                                                <asp:TextBox ID="txtFname" runat="server" SkinID="txt" TabIndex="26"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right">
                                                <asp:Label ID="lblAccountNo" runat="server" Text="Account No :&nbsp;" SkinID="lbl"></asp:Label>
                                            </td>
                                            <td align="left">
                                                <asp:TextBox ID="txtAccountNo" runat="server" TabIndex="27" BorderColor="White" SkinID="txt"
                                                    CausesValidation="true"></asp:TextBox>
                                            </td>
                                            <td align="right">
                                                <asp:Label ID="lblMotherName" runat="server" SkinID="lblRsz" Width="120px" Text="Mother Name :&nbsp;"></asp:Label>
                                            </td>
                                            <td align="left">
                                                <asp:TextBox ID="txtMothername" runat="server" SkinID="txt" TabIndex="28"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right">
                                                <asp:Label ID="lblSalary" runat="server" Text="Salary :&nbsp;" SkinID="lbl"></asp:Label>
                                            </td>
                                            <td align="left">
                                                <asp:TextBox ID="txtSalary" runat="server" TabIndex="29" BorderColor="White" SkinID="txt"
                                                    CausesValidation="true"></asp:TextBox>
                                            </td>
                                            <td align="right">
                                                <asp:Label ID="lblDOL" runat="server" Text="Date of Leaving^ :&nbsp;" SkinID="lblRsz"
                                                    Width="160"></asp:Label>
                                            </td>
                                            <td align="left">
                                                <asp:TextBox ID="txtDOL" runat="server" TabIndex="30" BorderColor="White" SkinID="txt"
                                                    CausesValidation="true"></asp:TextBox>
                                                <ajaxToolkit:CalendarExtender ID="CalendarExtender3" runat="server" TargetControlID="txtDOL"
                                                    Format="dd-MMM-yyyy" SkinID="CalendarView">
                                                </ajaxToolkit:CalendarExtender>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right">
                                                <asp:Label ID="lblPanNo" runat="server" SkinID="lblRsz" Text="PAN No&nbsp;:&nbsp;"></asp:Label>
                                            </td>
                                            <td align="left">
                                                <asp:TextBox ID="txtPanNo" runat="server" SkinID="txt" TabIndex="31"></asp:TextBox>
                                            </td>
                                            <td align="right">
                                                <asp:Label ID="lblHRAEmpCode" runat="server" SkinID="lbl" Text="HR Emp Code :&nbsp;"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtHRAEmp" runat="server" SkinID="txt" TabIndex="32"></asp:TextBox>
                                                <ajaxToolkit:AutoCompleteExtender ID="AutoCompleteExtender5" TargetControlID="txtHRAEmp"
                                                    runat="Server" CompletionInterval="2000" EnableCaching="true" FirstRowSelected="true"
                                                    MinimumPrefixLength="3" OnClientPopulated="HideImage5" OnClientPopulating="ShowImage5"
                                                    OnClientItemSelected="SplitName5" ServiceMethod="getEmpCodeExt1" ServicePath="TextBoxExt.asmx"
                                                    CompletionListCssClass="completeListStyle">
                                                </ajaxToolkit:AutoCompleteExtender>
                                                <ajaxToolkit:TextBoxWatermarkExtender ID="TextBoxWatermarkExtender2" runat="server"
                                                    WatermarkText="Type first 3 characters" TargetControlID="txtHRAEmp" SkinID="watermark">
                                                </ajaxToolkit:TextBoxWatermarkExtender>
                                                <asp:HiddenField ID="HidHRAEmp" runat="server" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right">
                                                <asp:Label ID="lblPFNo" runat="server" SkinID="lblRsz" Width="180" Text="Provident Fund No :&nbsp;"></asp:Label>
                                            </td>
                                            <td align="left">
                                                <asp:TextBox ID="txtPFNo" runat="server" SkinID="txt" TabIndex="33"></asp:TextBox>
                                            </td>
                                            <td align="right">
                                                <asp:Label ID="lblFMEmpCode" runat="server" SkinID="lbl" Text="FM Emp Code :&nbsp;"></asp:Label>
                                            </td>
                                            <td align="left">
                                                <asp:TextBox ID="txtFMEmpCode" runat="server" SkinID="txt" TabIndex="34"></asp:TextBox>
                                                <ajaxToolkit:AutoCompleteExtender ID="AutoCompleteExtender4" TargetControlID="txtFMEmpCode"
                                                    runat="Server" CompletionInterval="2000" EnableCaching="true" FirstRowSelected="true"
                                                    MinimumPrefixLength="3" OnClientPopulated="HideImage4" OnClientPopulating="ShowImage4"
                                                    CompletionListCssClass="completeListStyle" OnClientItemSelected="SplitName4"
                                                    ServiceMethod="getEmpCodeExt1" ServicePath="TextBoxExt.asmx">
                                                </ajaxToolkit:AutoCompleteExtender>
                                                <ajaxToolkit:TextBoxWatermarkExtender ID="TextBoxWatermarkExtender4" runat="server"
                                                    WatermarkText="Type first 3 characters" TargetControlID="txtFMEmpCode" SkinID="watermark">
                                                </ajaxToolkit:TextBoxWatermarkExtender>
                                                <asp:HiddenField ID="HidFMEmpCode" runat="server" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right">
                                                <asp:Label ID="lblESINo" runat="server" SkinID="lblRsz" Width="150px" Text="ESI No. :&nbsp;"></asp:Label>
                                            </td>
                                            <td align="left">
                                                <asp:TextBox ID="txtESINo" runat="server" SkinID="txt" TabIndex="35"></asp:TextBox>
                                            </td>
                                            <td align="right">
                                                <asp:Label ID="lblRMEmpCode" runat="server" Text="RM Emp Code :&nbsp;" SkinID="lbl"></asp:Label>
                                            </td>
                                            <td align="left">
                                                <asp:TextBox ID="txtRMEmpCode" runat="server" SkinID="txt" TabIndex="36"></asp:TextBox>
                                                <ajaxToolkit:AutoCompleteExtender ID="AutoCompleteExtender3" TargetControlID="txtRMEmpCode"
                                                    runat="Server" CompletionInterval="2000" EnableCaching="true" FirstRowSelected="true"
                                                    MinimumPrefixLength="3" OnClientPopulated="HideImage3" OnClientPopulating="ShowImage3"
                                                    CompletionListCssClass="completeListStyle" OnClientItemSelected="SplitName3"
                                                    ServiceMethod="getEmpCodeExt1" ServicePath="TextBoxExt.asmx">
                                                </ajaxToolkit:AutoCompleteExtender>
                                                <ajaxToolkit:TextBoxWatermarkExtender ID="TextBoxWatermarkExtender5" runat="server"
                                                    WatermarkText="Type first 3 characters" TargetControlID="txtRMEmpCode" SkinID="watermark">
                                                </ajaxToolkit:TextBoxWatermarkExtender>
                                                <asp:HiddenField ID="HidRMEmpCode" runat="server" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right">
                                                <asp:Label ID="lblServicePeriod" runat="server" Text="Service Period :&nbsp;" SkinID="lbl"></asp:Label>
                                            </td>
                                            <td align="left">
                                                <asp:TextBox ID="txtServicePeriod" runat="server" TabIndex="37" SkinID="txt"></asp:TextBox>
                                            </td>
                                            <td align="right">
                                                <asp:Label ID="lblVDA" runat="server" SkinID="lblRsz" Width="250px" Text="Wages fixed including VDA&nbsp:&nbsp;&nbsp;"></asp:Label>
                                            </td>
                                            <td align="left">
                                                <asp:TextBox ID="txtVDA" runat="server" SkinID="txt" TabIndex="38"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                &nbsp;
                                            </td>
                                            <td>
                                                <asp:CheckBox ID="CheckBox1" runat="server" Text="Delegate" TabIndex="39" AutoPostBack="True"
                                                    SkinID="Chk" />
                                            </td>
                                            <td align="right">
                                                <asp:Label ID="lblDelegated" runat="server" Text="Delegated :&nbsp;" SkinID="lbl"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtDelegated" runat="server" SkinID="txt" TabIndex="40"></asp:TextBox>
                                                <ajaxToolkit:AutoCompleteExtender ID="AutoCompleteExtender2" runat="Server" CompletionInterval="2000"
                                                    EnableCaching="true" FirstRowSelected="true" MinimumPrefixLength="3" OnClientPopulated="HideImage2"
                                                    OnClientPopulating="ShowImage2" OnClientItemSelected="SplitName2" ServiceMethod="getEmpCodeExt1"
                                                    ServicePath="TextBoxExt.asmx" TargetControlID="txtDelegated" CompletionListCssClass="completeListStyle">
                                                </ajaxToolkit:AutoCompleteExtender>
                                                <ajaxToolkit:TextBoxWatermarkExtender ID="TextBoxWatermarkExtender3" runat="server"
                                                    SkinID="watermark" TargetControlID="txtDelegated" WatermarkText="Type first 3 characters">
                                                </ajaxToolkit:TextBoxWatermarkExtender>
                                                <asp:HiddenField ID="HidEmpCode" runat="server" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="4">
                                                <hr />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right">
                                                <asp:Label ID="lblNameinpassport" runat="server" SkinID="lblRsz" Width="180px" Text="Name as in Passport :&nbsp;"></asp:Label>
                                            </td>
                                            <td align="left">
                                                <asp:TextBox ID="txtNameinpassport" runat="server" SkinID="txt" TabIndex="41"></asp:TextBox>
                                            </td>
                                            <td align="right">
                                                <asp:Label ID="lblVisaNo" runat="server" SkinID="lblRsz" Width="180px" Text="Visa No :&nbsp;"></asp:Label>
                                            </td>
                                            <td align="left">
                                                <asp:TextBox ID="txtVisaNo" runat="server" SkinID="txt" TabIndex="42"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right">
                                                <asp:Label ID="lblPassportNo" runat="server" SkinID="lblRsz" Width="180px" Text="Passport No^ :&nbsp;"></asp:Label>
                                            </td>
                                            <td align="left">
                                                <asp:TextBox ID="txtPassportNo" runat="server" SkinID="txt" TabIndex="43"></asp:TextBox>
                                            </td>
                                            <td align="right">
                                                <asp:Label ID="lblVisaIssueDate" runat="server" SkinID="lblRsz" Width="180px" Text="Visa Issue Date :&nbsp;"></asp:Label>
                                            </td>
                                            <td align="left">
                                                <asp:TextBox ID="txtVisaIssueDate" runat="server" SkinID="txt" TabIndex="44"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right">
                                                <asp:Label ID="lblPassportIssueDate" runat="server" SkinID="lblRsz" Width="180px"
                                                    Text="Passport Issue Date :&nbsp;"></asp:Label>
                                            </td>
                                            <td align="left">
                                                <asp:TextBox ID="txtPassportIssueDate" runat="server" SkinID="txt" TabIndex="45"></asp:TextBox>
                                            </td>
                                            <td align="right">
                                                <asp:Label ID="lblVisaExpDate" runat="server" SkinID="lblRsz" Width="180px" Text="Visa Expiry Date :&nbsp;"></asp:Label>
                                            </td>
                                            <td align="left">
                                                <asp:TextBox ID="txtVisaExpDate" runat="server" SkinID="txt" TabIndex="46"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right">
                                                <asp:Label ID="lblExpiryDate" runat="server" SkinID="lblRsz" Width="180px" Text="Passport Expiry Date :&nbsp;"></asp:Label>
                                            </td>
                                            <td align="left">
                                                <asp:TextBox ID="txtExpiryDate" runat="server" SkinID="txt" TabIndex="47"></asp:TextBox>
                                            </td>
                                            <td align="right">
                                                <asp:Label ID="lblFRRO" runat="server" SkinID="lblRsz" Width="180px" Text="FRRO Expiry Date :&nbsp;"></asp:Label>
                                            </td>
                                            <td align="left">
                                                <asp:TextBox ID="txtFRRO" runat="server" SkinID="txt" TabIndex="48"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right">
                                                <asp:Label ID="lblPlaceofIssue" runat="server" SkinID="lblRsz" Width="250px" Text="Place of Issue&nbsp;&nbsp; (Passport) :&nbsp;"></asp:Label>
                                            </td>
                                            <td align="left">
                                                <asp:TextBox ID="txtPlaceofIssue" runat="server" SkinID="txt" TabIndex="49"></asp:TextBox>
                                            </td>
                                            <td>
                                                &nbsp;
                                            </td>
                                            <td>
                                                &nbsp;
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="4">
                                                <hr />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="3">
                                                &nbsp;
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="btnTd" colspan="4">
                                                <asp:Button ID="Btnadd" TabIndex="50" runat="server" Text="ADD" CausesValidation="true"
                                                    SkinID="btn" OnClientClick="return Validate();" CssClass="ButtonClass"></asp:Button>
                                                <asp:Button ID="BtnView" TabIndex="51" runat="server" Text="VIEW" CausesValidation="False"
                                                    SkinID="btn" CssClass="ButtonClass "></asp:Button>
                                                <asp:Button ID="btnSearch" Visible="false" TabIndex="53" runat="server" Text="SEARCH"
                                                    SkinID="btn" CssClass="ButtonClass "></asp:Button>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="btnTd" colspan="4">
                                                <asp:Label ID="lblmsg" runat="server" SkinID="lblRed"></asp:Label>
                                                <asp:Label ID="lblgreen" runat="server" SkinID="lblGreen"></asp:Label>
                                                <asp:UpdateProgress runat="server" ID="UpdateProgress1">
                                                    <ProgressTemplate>
                                                        <div class="PleaseWait">
                                                            <asp:Label ID="lblprocess" runat="server" Text="Processing your request..Please wait..."
                                                                SkinID="lblRsz" Width="300" Visible="True"></asp:Label>
                                                        </div>
                                                    </ProgressTemplate>
                                                </asp:UpdateProgress>
                                                <ajaxToolkit:CalendarExtender ID="CalendarExtender8" runat="server" TargetControlID="txtFRRO"
                                                    Format="dd-MMM-yyyy" SkinID="Calendar" Enabled="True">
                                                </ajaxToolkit:CalendarExtender>
                                                <ajaxToolkit:CalendarExtender ID="CalendarExtender4" runat="server" TargetControlID="txtExpiryDate"
                                                    Format="dd-MMM-yyyy" SkinID="Calendar" Enabled="True">
                                                </ajaxToolkit:CalendarExtender>
                                                <ajaxToolkit:CalendarExtender ID="CalendarExtender5" runat="server" TargetControlID="txtPassportIssueDate"
                                                    Format="dd-MMM-yyyy" SkinID="Calendar" Enabled="True">
                                                </ajaxToolkit:CalendarExtender>
                                                <ajaxToolkit:CalendarExtender ID="CalendarExtender6" runat="server" TargetControlID="txtVisaExpDate"
                                                    Format="dd-MMM-yyyy" SkinID="Calendar" Enabled="True">
                                                </ajaxToolkit:CalendarExtender>
                                                <ajaxToolkit:CalendarExtender ID="CalendarExtender7" runat="server" TargetControlID="txtVisaIssueDate"
                                                    Format="dd-MMM-yyyy" SkinID="Calendar" Enabled="True">
                                                </ajaxToolkit:CalendarExtender>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </center>
                            <asp:TextBox ID="txtPath" runat="server" SkinID="txt" Visible="False"></asp:TextBox>
                            <br />
                            <center>
                                <asp:Panel ID="GV" runat="server" ScrollBars="Auto" Width="650px" Height="300px">
                                    <asp:GridView ID="GridView1" runat="server" SkinID="GridView" AllowPaging="true"
                                        AutoGenerateColumns="false" PageSize="100" AllowSorting="True" EnableSortingAndPagingCallbacks="True">
                                        <Columns>
                                            <asp:TemplateField ShowHeader="false">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="false" CommandName="Edit"
                                                        Text="Edit" TabIndex="54"></asp:LinkButton>
                                                    <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="false" CommandName="Delete"
                                                        Text="Delete" TabIndex="55" OnClientClick="return confirm('Do you want to delete the selected record?')"></asp:LinkButton>
                                                    <br />
                                                </ItemTemplate>
                                                <ItemStyle Wrap="false" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Employee Type" SortExpression="EmploymentType">
                                                <ItemTemplate>
                                                    <asp:Label ID="LabelEmployeeType" runat="server" Text='<%# Bind("EmploymentType") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Photo" ControlStyle-Width="50px">
                                                <ItemTemplate>
                                                    <asp:Image ID="LabelEmp_Photo" ImageUrl='<%# Bind("Photos") %>' runat="server"></asp:Image>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Employee Name" ControlStyle-Width="150px"  SortExpression="Emp_Name">
                                                <ItemTemplate>
                                                    <asp:HiddenField ID="LabelEmp_Id" runat="server" Value='<%# Bind("Emp_Id") %>' />
                                                    <asp:Label ID="LabelEmp_Name" runat="server" Text='<%# Bind("Emp_Name") %>'></asp:Label>
                                                </ItemTemplate>
                                                 <ItemStyle Wrap="true" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Employee Code" SortExpression="Emp_Code">
                                                <ItemTemplate>
                                                    <asp:Label ID="LabelEmp_Code" runat="server" Text='<%# Bind("Emp_Code") %>'></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle Wrap="false" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Date of Birth">
                                                <ItemTemplate>
                                                    <asp:Label ID="LabelDOB" runat="server" Text='<%# Bind("DOB","{0:dd-MMM-yyyy}") %>'></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle Wrap="false" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Designation" SortExpression="Designation">
                                                <ItemTemplate>
                                                    <asp:Label ID="LabelDesignation" runat="server" Text='<%# Bind("Designation") %>'></asp:Label>
                                                    <asp:Label ID="LabelDesignationCode" Visible="false" runat="server" Text='<%# Bind("DesigID") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Department" SortExpression="DeptName">
                                                <ItemTemplate>
                                                    <asp:Label ID="LabelDept" runat="server" Text='<%# Bind("DeptName") %>'></asp:Label>
                                                    <asp:Label ID="LabelDeptId" Visible="false" runat="server" Text='<%# Bind("DeptID") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Qualification" SortExpression="Qualification">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblQualification" runat="server" Text='<%# Bind("Qualification") %>'></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle Wrap="false" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Branch Type">
                                                <ItemTemplate>
                                                    <asp:Label ID="LabelBranchTypeName" runat="server" Text='<%# Bind("BranchTypeName") %>'></asp:Label>
                                                    <asp:Label Visible="false" ID="LabelBranchType_ID" runat="server" Text='<%# Bind("BranchTypeCode") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Delegate" Visible="false">
                                                <ItemTemplate>
                                                    <asp:Label ID="LabelDelegateName" runat="server" Text='<%# Bind("DelName") %>'></asp:Label>
                                                    <asp:Label ID="lbldelegated" runat="server" Text='<%# Bind("Delegated") %>'></asp:Label>
                                                    <asp:Label Visible="false" ID="LabelDelegate" runat="server" Text='<%# Bind("Delegate") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Branch">
                                                <ItemTemplate>
                                                    <asp:Label ID="LabelBranchName" Width="200px" runat="server" Text='<%# Bind("BranchName") %>'></asp:Label>
                                                    <asp:Label Visible="false" ID="LabelBranchMaster_ID" runat="server" Text='<%# Bind("Branch_Code") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="PAN No">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblPanNo" runat="server" Text='<%# Bind("PanNo") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Mobile No">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblContactNo" runat="server" Text='<%# Bind("ContactNo") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="LandLine No">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblLandlinNo" runat="server" Text='<%# Bind("LandLineNo") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Email ID">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblEmailID" runat="server" Text='<%# Bind("Email") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Service Period" Visible="false">
                                                <ItemTemplate>
                                                    <asp:Label ID="lableServicePeriod" runat="server" Text='<%# Bind("ServicePeriod") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Address" ControlStyle-Width="200px">
                                                <ItemTemplate>
                                                    <asp:Label ID="LabelEmp_Address" runat="server" Text='<%# Bind("Emp_Address") %>'></asp:Label>
                                                    <asp:Label Visible="false" ID="LabelCountry" runat="server" Text='<%# Bind("Country") %>'></asp:Label>
                                                    <asp:Label Visible="false" ID="LabelContactNo" runat="server" Text='<%# Bind("ContactNo") %>'></asp:Label>
                                                    <%--<asp:Label Visible="false" ID="lblLandlinNo" runat="server" Text='<%# Bind("LandLineNo") %>'></asp:Label>--%>
                                                    <asp:Label Visible="false" ID="LabelEmail" runat="server" Text='<%# Bind("Email") %>'></asp:Label>
                                                    <asp:Label Visible="false" ID="LabelDOJ" runat="server" Text='<%# Bind("DOJ","{0:dd-MMM-yyyy}") %>'></asp:Label>
                                                    <asp:Label Visible="false" ID="LabelDOL" runat="server" Text='<%# Bind("DOL","{0:dd-MMM-yyyy}") %>'></asp:Label>
                                                    <asp:Label Visible="false" ID="LabelSalary" runat="server" Text='<%# Bind("Salary","{0:0.00}") %>'></asp:Label>
                                                    <asp:Label Visible="false" ID="LabelAccountNo" runat="server" Text='<%# Bind("AccountNo") %>'></asp:Label>
                                                    <asp:Label Visible="false" ID="LabelAgentID" runat="server" Text='<%# Bind("Bank_ID") %>'></asp:Label>
                                                    <asp:Label Visible="false" ID="LabelBank_Name" runat="server" Text='<%# Bind("Bank_Name") %>'></asp:Label>
                                                    <asp:Label Visible="false" ID="LabelPhotos" runat="server" Text='<%# Bind("Photos") %>'></asp:Label>
                                                    <asp:Label Visible="false" ID="LabelGender" runat="server" Text='<%# Bind("Gender") %>'></asp:Label>
                                                    <asp:Label Visible="false" ID="LabelBranch" runat="server" Text='<%# Bind("BranchName") %>'></asp:Label>
                                                    <asp:Label Visible="false" ID="LabelRMEEmpName" runat="server" Text='<%# Bind("RMEEmpName") %>'></asp:Label>
                                                    <asp:Label Visible="false" ID="LabelRMEmpCode" runat="server" Text='<%# Bind("RMEmpCode") %>'></asp:Label>
                                                    <asp:Label Visible="false" ID="LabelFMEmpName" runat="server" Text='<%# Bind("FMEmpName") %>'></asp:Label>
                                                    <asp:Label Visible="false" ID="LabelFMEmpCode" runat="server" Text='<%# Bind("FMEmpCode") %>'></asp:Label>
                                                    <asp:Label Visible="false" ID="LabelHRAEmpName" runat="server" Text='<%# Bind("HRAEmpName") %>'></asp:Label>
                                                    <asp:Label Visible="false" ID="LabelHRAEmpCode" runat="server" Text='<%# Bind("HRAEmpCode") %>'></asp:Label>
                                                    <asp:Label Visible="false" ID="lblEmployeeCategory" runat="server" Text='<%# Bind("EmployeeCategory") %>'></asp:Label>
                                                    <asp:Label Visible="false" ID="lblEmployeeType" runat="server" Text='<%# Bind("Full_PartTime") %>'></asp:Label>
                                                    <asp:Label Visible="false" ID="NICNO" runat="server" Text='<%# Bind("NICNO") %>'></asp:Label>
                                                    <asp:Label Visible="false" ID="Corres_Address" runat="server" Text='<%# Bind("Corres_Address") %>'></asp:Label>
                                                    <%-- <asp:Label Visible="false" ID="Hostel" runat="server" Text='<%# Bind("Hostel") %>'></asp:Label>
                                                    <asp:Label Visible="false" ID="Transport" runat="server" Text='<%# Bind("Transport") %>'></asp:Label>--%>
                                                    <asp:Label Visible="false" ID="FatherName" runat="server" Text='<%# Bind("FatherName") %>'></asp:Label>
                                                    <asp:Label Visible="false" ID="SpouseName" runat="server" Text='<%# Bind("SpouseName") %>'></asp:Label>
                                                    <asp:Label Visible="false" ID="NameInPassport" runat="server" Text='<%# Bind("NameInPassport") %>'></asp:Label>
                                                    <asp:Label Visible="false" ID="PlaceofIssue" runat="server" Text='<%# Bind("PlaceofIssue") %>'></asp:Label>
                                                    <asp:Label Visible="false" ID="PassportNo" runat="server" Text='<%# Bind("PassportNo") %>'></asp:Label>
                                                    <asp:Label Visible="false" ID="PassportExpiryDate" runat="server" Text='<%# Bind("PassportExpiryDate","{0:dd-MMM-yyyy}") %>'></asp:Label>
                                                    <asp:Label Visible="false" ID="PassportIssueDate" runat="server" Text='<%# Bind("PassportIssueDate","{0:dd-MMM-yyyy}") %>'></asp:Label>
                                                    <asp:Label Visible="false" ID="VisaIssueDate" runat="server" Text='<%# Bind("VisaIssueDate","{0:dd-MMM-yyyy}") %>'></asp:Label>
                                                    <asp:Label Visible="false" ID="VisaExpiryDate" runat="server" Text='<%# Bind("VisaExpiryDate","{0:dd-MMM-yyyy}") %>'></asp:Label>
                                                    <asp:Label Visible="false" ID="VisaNo" runat="server" Text='<%# Bind("VisaNo") %>'></asp:Label>
                                                    <asp:Label Visible="false" ID="FRROExpDate" runat="server" Text='<%# Bind("FRROExpDate","{0:dd-MMM-yyyy}") %>'></asp:Label>
                                                    <asp:Label Visible="false" ID="MotherName" runat="server" Text='<%# Bind("MotherName") %>'></asp:Label>
                                                    <asp:Label Visible="false" ID="PFNo" runat="server" Text='<%# Bind("PFNo") %>'></asp:Label>
                                                    <asp:Label Visible="false" ID="lblGrade" runat="server" Text='<%# Bind("Grade") %>'></asp:Label>
                                                    <asp:Label Visible="false" ID="lblVDA" runat="server" Text='<%# Bind("VDA") %>'></asp:Label>
                                                    <asp:Label Visible="false" ID="lblESINo" runat="server" Text='<%# Bind("ESI_No") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                    </asp:GridView>
                                </asp:Panel>
                            </center>
                        </div>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </ContentTemplate>
        </ajaxToolkit:TabPanel>
        <ajaxToolkit:TabPanel ID="EmpOther" runat="server" HeaderText="Employee Additional Details">
            <ContentTemplate>
                <asp:UpdatePanel runat="server" ID="UpdatePanel2">
                    <ContentTemplate>
                        <div>
                            <center>
                                <h1 class="headingTxt">
                                    EMPLOYEE ADDITIONAL DETAILS</h1>
                            </center>
                            <center>
                                <table>
                                    <tr>
                                        <td align="right">
                                            <asp:Label ID="lblEmployeeName" runat="server" SkinID="lblRsz" Width="180px" Text="Employee Name*^ :&nbsp;&nbsp;"></asp:Label>
                                        </td>
                                        <td align="left">
                                            <asp:DropDownList ID="DDLEmployeeName" runat="server" SkinID="ddlRsz" DataSourceID="ObjEmpName"
                                                DataTextField="Emp_Name" DataValueField="EmpID" Width="250px">
                                            </asp:DropDownList>
                                            <asp:ObjectDataSource runat="server" ID="ObjEmpName" SelectMethod="GetEmpNameDDL"
                                                TypeName="DLEmpQualification"></asp:ObjectDataSource>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2">
                                            <hr />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="center" colspan="2">
                                            <h4 class="headingTxt">
                                                QUALIFICATION DETAILS</h4>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right">
                                            <asp:Label ID="lblQType" runat="server" SkinID="lblRsz" Width="180px" Text="Qualification Type* :&nbsp;&nbsp;"></asp:Label>
                                        </td>
                                        <td align="left">
                                            <asp:DropDownList ID="DDLQualificationType" runat="server" SkinID="ddl" DataSourceID="ObjQType"
                                                DataTextField="Data" DataValueField="LookUpAutoID">
                                            </asp:DropDownList>
                                            <asp:ObjectDataSource runat="server" ID="ObjQType" SelectMethod="GetEmpQualificationType"
                                                TypeName="DLEmpQualification"></asp:ObjectDataSource>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right">
                                            <asp:Label ID="lblQ" runat="server" SkinID="lbl" Text="Qualification* :&nbsp;&nbsp;"></asp:Label>
                                        </td>
                                        <td align="left">
                                            <asp:TextBox runat="server" ID="txtQualificationf" SkinID="txt"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right">
                                            <asp:Label ID="lblYear" runat="server" SkinID="lbl" Text="Year :&nbsp;&nbsp;"></asp:Label>
                                        </td>
                                        <td align="left">
                                            <%-- <asp:TextBox runat="server" ID="txtYear" SkinID="txt"></asp:TextBox>
                                            <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender5" runat="server"
                                                FilterMode="ValidChars" FilterType="Custom" ValidChars="0123456789-" TargetControlID="txtYear">
                                            </ajaxToolkit:FilteredTextBoxExtender>--%>
                                            <asp:DropDownList ID="ddlYear" runat="server" DataSourceID="ObjSelectYear" DataTextField="Data"
                                                DataValueField="LookUpAutoID" SkinID="ddl"  >
                                            </asp:DropDownList>
                                            <asp:ObjectDataSource ID="ObjSelectYear" runat="server" SelectMethod="ddlYear" TypeName="BLClientContractMaster">
                                            </asp:ObjectDataSource>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right">
                                            <asp:Label ID="lblRemarks" runat="server" SkinID="lbl" Text="Remarks :&nbsp;&nbsp;"></asp:Label>
                                        </td>
                                        <td align="left">
                                            <asp:TextBox runat="server" ID="txtQualificationRemarks" TextMode="MultiLine" SkinID="txt"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2">
                                            <asp:TextBox ID="TextBox1" Visible="false" runat="server" SkinID="txt"></asp:TextBox>
                                            <asp:HiddenField ID="HiddenField1" runat="server" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="center" colspan="2">
                                            <asp:Button ID="btnQualificationAdd" OnClientClick="return ValidateQ();" SkinID="btn"
                                                CssClass="ButtonClass" runat="server" Text="ADD"></asp:Button>
                                            <asp:Button ID="btnQualificationView" SkinID="btn" CssClass="ButtonClass" OnClientClick="return ValidateQV();"
                                                runat="server" Text="VIEW"></asp:Button>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="center" colspan="2">
                                            <asp:Label ID="lblQRed" runat="server" SkinID="lblRed" Text=""></asp:Label>
                                            <asp:Label ID="lblQGreen" runat="server" SkinID="lblGreen" Text=""></asp:Label>
                                        </td>
                                    </tr>
                                    <%--</table>
                            </center>
                            <center>
                                <table>--%>
                                    <tr>
                                        <td align="center" colspan="2">
                                            <asp:Panel ID="panel1" runat="server" ScrollBars="Auto" Width="650px" Height="200px"
                                                Visible="false">
                                                <asp:GridView ID="GVQualification" runat="server" SkinID="GridView" AllowPaging="true"
                                                    AutoGenerateColumns="False" PageSize="100" AllowSorting="True" EnableSortingAndPagingCallbacks="True">
                                                    <Columns>
                                                        <asp:TemplateField InsertVisible="False" ShowHeader="False">
                                                            <ItemTemplate>
                                                                <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit"
                                                                    Text="Edit" />
                                                                <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Delete"
                                                                    Text="Delete" OnClientClick="return confirm('Do you want to delete the selected record?')" />
                                                            </ItemTemplate>
                                                            <ItemStyle Wrap="False"></ItemStyle>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Qualification Type" Visible="true">
                                                            <ItemTemplate>
                                                                <asp:Label ID="PKID" Visible="false" runat="server" Text='<%# Bind("PKID") %>'></asp:Label>
                                                                <asp:Label ID="EmpID" Visible="false" runat="server" Text='<%# Bind("EmpID") %>'></asp:Label>
                                                                <asp:Label ID="QualificationTypeID" Visible="false" runat="server" Text='<%# Bind("QualificationTypeID") %>'></asp:Label>
                                                                <asp:Label ID="Data" runat="server" Text='<%# Bind("Data") %>'></asp:Label>
                                                            </ItemTemplate>
                                                            <ItemStyle HorizontalAlign="Left"></ItemStyle>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Qualification" Visible="true">
                                                            <ItemTemplate>
                                                                <asp:Label ID="Qualification" runat="server" Text='<%# Bind("Qualification") %>'></asp:Label>
                                                            </ItemTemplate>
                                                            <ItemStyle HorizontalAlign="Left"></ItemStyle>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Year" Visible="true">
                                                            <ItemTemplate>
                                                                <asp:Label ID="Year" runat="server" Text='<%# Bind("Year") %>'></asp:Label>
                                                            </ItemTemplate>
                                                            <ItemStyle HorizontalAlign="Left"></ItemStyle>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Remarks" Visible="true">
                                                            <ItemTemplate>
                                                                <asp:Label ID="Remarks" runat="server" Text='<%# Bind("Remarks") %>'></asp:Label>
                                                            </ItemTemplate>
                                                            <ItemStyle HorizontalAlign="Left"></ItemStyle>
                                                        </asp:TemplateField>
                                                    </Columns>
                                                </asp:GridView>
                                            </asp:Panel>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2">
                                            <hr />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="center" colspan="2">
                                            <h4 class="headingTxt">
                                                EXPERIENCE DETAILS</h4>
                                        </td>
                                    </tr>
                                    <%--</center>
                            <center>
                                <table>--%>
                                    <tr>
                                        <td align="right">
                                            <asp:Label ID="lblExpT" runat="server" SkinID="lblRsz" Width="180px" Text="Experience Type* :&nbsp;&nbsp;"></asp:Label>
                                        </td>
                                        <td align="left">
                                            <asp:DropDownList ID="DDLExperienceType" runat="server" SkinID="ddl" DataSourceID="ObjExp"
                                                DataTextField="Data" DataValueField="LookUpAutoID">
                                            </asp:DropDownList>
                                            <asp:ObjectDataSource runat="server" ID="ObjExp" SelectMethod="GetEmpExperienceType"
                                                TypeName="DLEmpQualification"></asp:ObjectDataSource>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right">
                                            <asp:Label ID="lblExp" runat="server" SkinID="lbl" Text="Experience* :&nbsp;&nbsp;"></asp:Label>
                                        </td>
                                        <td align="left">
                                            <asp:TextBox runat="server" ID="txtExperience" SkinID="txt"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right">
                                            <asp:Label ID="lblFromDt" runat="server" SkinID="lbl" Text="From Date :&nbsp;&nbsp;"></asp:Label>
                                        </td>
                                        <td align="left">
                                            <asp:TextBox runat="server" ID="txtFromDt" SkinID="txt"></asp:TextBox>
                                            <ajaxToolkit:CalendarExtender ID="CalendarExtender9" runat="server" TargetControlID="txtFromDt"
                                                Format="dd-MMM-yyyy" SkinID="Calendar" Enabled="True">
                                            </ajaxToolkit:CalendarExtender>
                                            <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender9" runat="server"
                                                FilterMode="InvalidChars" FilterType="Custom" InvalidChars="',./;:'[]{}_=+)(*&^%$#@!"
                                                TargetControlID="txtFromDt">
                                            </ajaxToolkit:FilteredTextBoxExtender>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right">
                                            <asp:Label ID="lblToDate" runat="server" SkinID="lbl" Text="To Date :&nbsp;&nbsp;"></asp:Label>
                                        </td>
                                        <td align="left">
                                            <asp:TextBox runat="server" ID="txtToDate" SkinID="txt"></asp:TextBox>
                                            <ajaxToolkit:CalendarExtender ID="CalendarExtender10" runat="server" TargetControlID="txtToDate"
                                                Format="dd-MMM-yyyy" SkinID="Calendar" Enabled="True">
                                            </ajaxToolkit:CalendarExtender>
                                            <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender2" runat="server"
                                                FilterMode="InvalidChars" FilterType="Custom" InvalidChars="',./;:'[]{}_=+)(*&^%$#@!"
                                                TargetControlID="txtToDate">
                                            </ajaxToolkit:FilteredTextBoxExtender>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right">
                                            <asp:Label ID="lblRemarksE" runat="server" SkinID="lbl" Text="Remarks :&nbsp;&nbsp;"></asp:Label>
                                        </td>
                                        <td align="left">
                                            <asp:TextBox runat="server" ID="txtExperienceRemarks" TextMode="MultiLine" SkinID="txt"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2">
                                            <asp:TextBox ID="txtid" Visible="false" runat="server" SkinID="txt"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="center" colspan="2">
                                            <asp:Button ID="btnExperienceAdd" OnClientClick="return ValidateE();" SkinID="btn"
                                                CssClass="ButtonClass" runat="server" Text="ADD"></asp:Button>
                                            <asp:Button ID="btnExperienceView" SkinID="btn" CssClass="ButtonClass" OnClientClick="return ValidateEV();"
                                                runat="server" Text="VIEW"></asp:Button>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="center" colspan="2">
                                            <asp:Label ID="lblERed" runat="server" SkinID="lblRed" Text=""></asp:Label>
                                            <asp:Label ID="lblEGreen" runat="server" SkinID="lblGreen" Text=""></asp:Label>
                                        </td>
                                    </tr>
                                    <%--</table>
                            </center>
                            <center>
                                <table>--%>
                                    <tr>
                                        <td align="center" colspan="2">
                                            <asp:Panel ID="PExp" runat="server" ScrollBars="Auto" Width="650px" Height="200px"
                                                Visible="false">
                                                <asp:GridView ID="GVExperience" runat="server" SkinID="GridView" AllowPaging="true"
                                                    AutoGenerateColumns="False" PageSize="100" AllowSorting="True" EnableSortingAndPagingCallbacks="True">
                                                    <Columns>
                                                        <asp:TemplateField InsertVisible="False" ShowHeader="False">
                                                            <ItemTemplate>
                                                                <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit"
                                                                    Text="Edit" />
                                                                <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Delete"
                                                                    Text="Delete" OnClientClick="return confirm('Do you want to delete the selected record?')" />
                                                            </ItemTemplate>
                                                            <ItemStyle Wrap="False"></ItemStyle>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Experience Type" Visible="true">
                                                            <ItemTemplate>
                                                                <asp:Label ID="PKID" Visible="false" runat="server" Text='<%# Bind("PKID") %>'></asp:Label>
                                                                <asp:Label ID="EmpID" Visible="false" runat="server" Text='<%# Bind("EmpID") %>'></asp:Label>
                                                                <asp:Label ID="ExperienceTypeID" Visible="false" runat="server" Text='<%# Bind("ExperienceTypeID") %>'></asp:Label>
                                                                <asp:Label ID="Data" runat="server" Text='<%# Bind("Data") %>'></asp:Label>
                                                            </ItemTemplate>
                                                            <ItemStyle HorizontalAlign="Left"></ItemStyle>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Experience" Visible="true">
                                                            <ItemTemplate>
                                                                <asp:Label ID="Experience" runat="server" Text='<%# Bind("Experience") %>'></asp:Label>
                                                            </ItemTemplate>
                                                            <ItemStyle HorizontalAlign="Left"></ItemStyle>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="From Date" Visible="true">
                                                            <ItemTemplate>
                                                                <asp:Label ID="FromDate" runat="server" Text='<%# Bind("FromDate","{0:dd-MMM-yyyy}") %>'></asp:Label>
                                                            </ItemTemplate>
                                                            <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="To Date" Visible="true">
                                                            <ItemTemplate>
                                                                <asp:Label ID="ToDate" runat="server" Text='<%# Bind("ToDate","{0:dd-MMM-yyyy}") %>'></asp:Label>
                                                            </ItemTemplate>
                                                            <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="No of Years" Visible="true">
                                                            <ItemTemplate>
                                                                <asp:Label ID="NoofYears" runat="server" Text='<%# Bind("NoofYears") %>'></asp:Label>
                                                            </ItemTemplate>
                                                            <ItemStyle HorizontalAlign="Right"></ItemStyle>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Remarks" Visible="true">
                                                            <ItemTemplate>
                                                                <asp:Label ID="Remarks" runat="server" Text='<%# Bind("Remarks") %>'></asp:Label>
                                                            </ItemTemplate>
                                                            <ItemStyle HorizontalAlign="Left"></ItemStyle>
                                                        </asp:TemplateField>
                                                    </Columns>
                                                </asp:GridView>
                                            </asp:Panel>
                                        </td>
                                    </tr>
                                    <%----%>
                                    <tr>
                                        <td colspan="2">
                                            <hr />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="center" colspan="2">
                                            <h4 class="headingTxt">
                                                RESEARCH PAPER/PUBLICATION DETAILS</h4>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right">
                                            <asp:Label ID="lblTitle" runat="server" SkinID="lblRsz" Width="280px" Text="Research Paper/Publication Title* :&nbsp;&nbsp;"></asp:Label>
                                        </td>
                                        <td align="left">
                                            <asp:TextBox ID="txtTitle" runat="server" SkinID="txt">
                                            </asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right">
                                            <asp:Label ID="lblName" runat="server" SkinID="lblRsz" Width="230px" Text="Name of Publisher* :&nbsp;&nbsp;"></asp:Label>
                                        </td>
                                        <td align="left">
                                            <asp:TextBox runat="server" ID="txtName" SkinID="txt"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right">
                                            <asp:Label ID="lblPYear" runat="server" SkinID="lblRsz" Width="230px" Text="Year of Publishing :&nbsp;&nbsp;"></asp:Label>
                                        </td>
                                        <td align="left">
                                            <asp:TextBox runat="server" ID="txtPYear" SkinID="txt"></asp:TextBox>
                                            <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender3" runat="server"
                                                FilterMode="validChars" FilterType="Custom" ValidChars="0123456789-" TargetControlID="txtPYear">
                                            </ajaxToolkit:FilteredTextBoxExtender>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right">
                                            <asp:Label ID="lblPRemarks" runat="server" SkinID="lbl" Text="Remarks :&nbsp;&nbsp;"></asp:Label>
                                        </td>
                                        <td align="left">
                                            <asp:TextBox runat="server" ID="txtPublicationRemarks" TextMode="MultiLine" SkinID="txt"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2">
                                            <asp:TextBox ID="txtPID" Visible="false" runat="server" SkinID="txt"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="center" colspan="2">
                                            <asp:Button ID="btnPublicationAdd" OnClientClick="return ValidateP();" SkinID="btn"
                                                CssClass="ButtonClass" runat="server" Text="ADD"></asp:Button>
                                            <asp:Button ID="btnPublicationView" SkinID="btn" CssClass="ButtonClass" OnClientClick="return ValidatePV();"
                                                runat="server" Text="VIEW"></asp:Button>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="center" colspan="2">
                                            <center>
                                                <asp:UpdateProgress runat="server" ID="UpdateProgress2">
                                                    <ProgressTemplate>
                                                        <div class="PleaseWait">
                                                            <asp:Label ID="lblprocess" runat="server" Text="Processing your request..Please wait..."
                                                                SkinID="lblRsz" Width="300" Visible="True"></asp:Label>
                                                        </div>
                                                    </ProgressTemplate>
                                                </asp:UpdateProgress>
                                            </center>
                                            <asp:Label ID="lblPRed" runat="server" SkinID="lblRed" Text=""></asp:Label>
                                            <asp:Label ID="lblPGreen" runat="server" SkinID="lblGreen" Text=""></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="center" colspan="2">
                                            <asp:Panel ID="PnlP" runat="server" ScrollBars="Auto" Width="650px" Height="200px"
                                                Visible="false">
                                                <asp:GridView ID="GVPublication" runat="server" SkinID="GridView" AllowPaging="true"
                                                    AutoGenerateColumns="False" PageSize="100" AllowSorting="True" EnableSortingAndPagingCallbacks="True">
                                                    <Columns>
                                                        <asp:TemplateField InsertVisible="False" ShowHeader="False">
                                                            <ItemTemplate>
                                                                <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit"
                                                                    Text="Edit" />
                                                                <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Delete"
                                                                    Text="Delete" OnClientClick="return confirm('Do you want to delete the selected record?')" />
                                                            </ItemTemplate>
                                                            <ItemStyle Wrap="False"></ItemStyle>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Research Paper/Publication Title" Visible="true">
                                                            <ItemTemplate>
                                                                <asp:Label ID="PKID" Visible="false" runat="server" Text='<%# Bind("PKID") %>'></asp:Label>
                                                                <asp:Label ID="EmpID" Visible="false" runat="server" Text='<%# Bind("EmpID") %>'></asp:Label>
                                                                <asp:Label ID="PublicationTitle" runat="server" Text='<%# Bind("PublicationTitle") %>'></asp:Label>
                                                            </ItemTemplate>
                                                            <ItemStyle HorizontalAlign="Left"></ItemStyle>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Name of Publisher" Visible="true">
                                                            <ItemTemplate>
                                                                <asp:Label ID="PublisherName" runat="server" Text='<%# Bind("PublisherName") %>'></asp:Label>
                                                            </ItemTemplate>
                                                            <ItemStyle HorizontalAlign="Left"></ItemStyle>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Year of Publishing" Visible="true">
                                                            <ItemTemplate>
                                                                <asp:Label ID="YearOfPublishing" runat="server" Text='<%# Bind("YearOfPublishing") %>'></asp:Label>
                                                            </ItemTemplate>
                                                            <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Remarks" Visible="true">
                                                            <ItemTemplate>
                                                                <asp:Label ID="Remarks" runat="server" Text='<%# Bind("Remarks") %>'></asp:Label>
                                                            </ItemTemplate>
                                                            <ItemStyle HorizontalAlign="Left"></ItemStyle>
                                                        </asp:TemplateField>
                                                    </Columns>
                                                </asp:GridView>
                                            </asp:Panel>
                                        </td>
                                    </tr>
                                    <%----%>
                                </table>
                            </center>
                        </div>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </ContentTemplate>
        </ajaxToolkit:TabPanel>
        <ajaxToolkit:TabPanel ID="MEDICAL" runat="server" HeaderText="MEDICAL DETAILS">
            <ContentTemplate>
                <asp:UpdatePanel runat="server" ID="UpdatePanel3">
                    <ContentTemplate>
                        <div>
                            <center>
                                <h1 class="headingTxt">
                                    <asp:Label ID="Label4" runat="server" Text="MEDICAL DETAILS"></asp:Label>
                                </h1>
                            </center>
                            <center>
                                <table>
                                    <tbody>
                                        <tr>
                                            <td align="right">
                                                <asp:Label ID="lblStdid" runat="server" SkinID="lblRsz" Width="170px" Text="Employee Name*&nbsp;:&nbsp;&nbsp;"></asp:Label>
                                            </td>
                                            <td align="left">
                                                <asp:HiddenField ID="HidId" runat="server"></asp:HiddenField>
                                                <asp:DropDownList ID="DDLEmployeeName1" runat="server" SkinID="ddlRsz" TabIndex="1"
                                                    DataSourceID="ObjectDataSource1" DataTextField="Emp_Name" DataValueField="EmpID"
                                                    Width="250px">
                                                </asp:DropDownList>
                                                <asp:ObjectDataSource runat="server" ID="ObjectDataSource1" SelectMethod="GetEmpNameDDL"
                                                    TypeName="DLEmpQualification"></asp:ObjectDataSource>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right">
                                                <asp:Label ID="lblHeight" runat="server" SkinID="lbl" Text="Height(Cms)*&nbsp;:&nbsp;&nbsp;"></asp:Label>
                                            </td>
                                            <td align="left">
                                                <asp:TextBox ID="txtHeight" runat="server" SkinID="txt" TabIndex="2"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right">
                                                <asp:Label ID="lblWeight" runat="server" SkinID="lbl" Text="Weight(Kgs)*&nbsp;:&nbsp;&nbsp;"></asp:Label>
                                            </td>
                                            <td align="left">
                                                <asp:TextBox ID="txtWeight" runat="server" SkinID="txt" TabIndex="3"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right">
                                                <asp:Label ID="lblIdentificationMark" runat="server" SkinID="lblRsz" Width="200px"
                                                    Text="Identification Mark&nbsp;:&nbsp;&nbsp;"></asp:Label>
                                            </td>
                                            <td align="left">
                                                <asp:TextBox ID="txtIdentificationMark" runat="server" SkinID="txt" TabIndex="4"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right">
                                                <asp:Label ID="lblBloodGroup" runat="server" SkinID="lblRsz" Width="200px" Text="Blood Group*&nbsp;:&nbsp;&nbsp;"></asp:Label>
                                            </td>
                                            <td align="left">
                                                <asp:TextBox ID="txtBloodGroup" runat="server" SkinID="txt" TabIndex="5"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right">
                                                <asp:Label ID="lblImmunizationRecord" runat="server" SkinID="lblRsz" Width="200px"
                                                    Text="Immunization Record&nbsp;:&nbsp;&nbsp;"></asp:Label>
                                            </td>
                                            <td align="left">
                                                <asp:TextBox ID="txtImmunizationRecord" runat="server" SkinID="txt" TabIndex="6"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right">
                                                <asp:Label ID="lblDetailsofanyseriousillness" runat="server" SkinID="lblRsz" Width="230px"
                                                    Text="Details of any serious illness&nbsp;:&nbsp;&nbsp;"></asp:Label>
                                            </td>
                                            <td align="left">
                                                <asp:TextBox ID="txtDetailsofanyseriousillness" runat="server" SkinID="txt" TabIndex="7"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right">
                                                <asp:Label ID="lblParticularsofanyallergies" runat="server" SkinID="lblRsz" Width="230px"
                                                    Text="Particulars of any allergies&nbsp;:&nbsp;&nbsp;"></asp:Label>
                                            </td>
                                            <td align="left">
                                                <asp:TextBox ID="txtParticularsofanyallergies" runat="server" SkinID="txt" TabIndex="8"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right">
                                                <asp:Label ID="lblEmergencyContactName" runat="server" SkinID="lblRsz" Width="230px"
                                                    Text="Emergency Contact Name&nbsp;:&nbsp;&nbsp;"></asp:Label>
                                            </td>
                                            <td align="left">
                                                <asp:TextBox ID="txtEmergencyContactName" runat="server" SkinID="txt" TabIndex="9"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right">
                                                <asp:Label ID="lblEmergencyContactNumber" runat="server" SkinID="lblRsz" Width="230px"
                                                    Text="Emergency Contact Number&nbsp;:&nbsp;&nbsp;"></asp:Label>
                                            </td>
                                            <td align="left">
                                                <asp:TextBox ID="txtEmergencyContactNumber" runat="server" SkinID="txt" TabIndex="10"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right">
                                                <asp:Label ID="lblDisabilitiesifany" runat="server" SkinID="lblRsz" Width="200px"
                                                    Text="Disabilities if any&nbsp;:&nbsp;&nbsp;"></asp:Label>
                                            </td>
                                            <td align="left">
                                                <asp:TextBox ID="txtDisabilitiesifany" runat="server" SkinID="txt" TabIndex="11"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="2">
                                                &nbsp;
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="2">
                                                <asp:Button ID="btnInsert" runat="server" CommandName="Insert" CssClass="ButtonClass"
                                                    SkinID="btn" TabIndex="12" Text="ADD" OnClientClick="return ValidateMed();" />
                                                <asp:Button ID="btnBack" runat="server" CssClass="ButtonClass" SkinID="btn" TabIndex="13"
                                                    Text="VIEW" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="2">
                                                &nbsp;
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="2">
                                                <asp:Label ID="lblRd" runat="server" SkinID="lblRed"></asp:Label>
                                                <asp:Label ID="lblGrn" runat="server" SkinID="lblGreen"></asp:Label>
                                                <asp:UpdateProgress runat="server" ID="UpdateProgress3">
                                                    <ProgressTemplate>
                                                        <div class="PleaseWait">
                                                            <asp:Label ID="lblprocess" runat="server" Text="Processing your request..Please wait..."
                                                                SkinID="lblRsz" Width="300" Visible="True"></asp:Label>
                                                        </div>
                                                    </ProgressTemplate>
                                                </asp:UpdateProgress>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                                <table>
                                    <tbody>
                                        <tr>
                                            <td>
                                                <asp:Panel ID="panel2" runat="server" ScrollBars="Auto" Width="650px" Height="300px">
                                                    <table>
                                                        <tr>
                                                            <td>
                                                                <asp:GridView ID="GridMedical" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                                                                    PageSize="100" SkinID="GridView" Width="368px">
                                                                    <Columns>
                                                                        <asp:TemplateField ShowHeader="False">
                                                                            <ItemTemplate>
                                                                                <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit"
                                                                                    Text="Edit" TabIndex="14"></asp:LinkButton>
                                                                                <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Delete"
                                                                                    Text="Delete" TabIndex="15" OnClientClick="return confirm('Do you want to delete the selected record?')"
                                                                                    Visible="True"></asp:LinkButton>
                                                                            </ItemTemplate>
                                                                            <ItemStyle Wrap="False" />
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Employee Name">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblId" runat="server" Text='<%# Bind("Id") %>' Visible="false"></asp:Label>
                                                                                <asp:Label ID="lblEmpId" runat="server" Text='<%# Bind("Emp_Id") %>' Visible="false"></asp:Label>
                                                                                <asp:Label ID="lblEmpName" runat="server" Text='<%# Bind("Emp_Name")  %>'></asp:Label>
                                                                            </ItemTemplate>
                                                                            <ItemStyle Wrap="false" />
                                                                            <HeaderStyle Wrap="false" />
                                                                            <ItemStyle HorizontalAlign="Left"></ItemStyle>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Employee Code">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblEmpCode" runat="server" Text='<%# Bind("Emp_Code")  %>'></asp:Label>
                                                                            </ItemTemplate>
                                                                            <ItemStyle Wrap="false" />
                                                                            <HeaderStyle Wrap="false" />
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Height(Cms)">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblHeight" runat="server" Text='<%# Bind("Height") %>'></asp:Label>
                                                                            </ItemTemplate>
                                                                            <ItemStyle Wrap="false" />
                                                                            <HeaderStyle Wrap="false" />
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Weight(Kgs)">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblWeight" runat="server" Text='<%# Bind("Weight") %>'></asp:Label>
                                                                            </ItemTemplate>
                                                                            <ItemStyle Wrap="false" />
                                                                            <HeaderStyle Wrap="false" />
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Identification Mark">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblIdentificationMark" runat="server" Text='<%# Bind("IdentificationMark") %>'></asp:Label>
                                                                            </ItemTemplate>
                                                                            <ItemStyle Wrap="false" />
                                                                            <HeaderStyle Wrap="false" />
                                                                            <ItemStyle HorizontalAlign="Left"></ItemStyle>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Blood Group">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblBloodGroup" runat="server" Text='<%# Bind("BloodGroup") %>'></asp:Label>
                                                                            </ItemTemplate>
                                                                            <ItemStyle Wrap="false" />
                                                                            <HeaderStyle Wrap="false" />
                                                                            <ItemStyle HorizontalAlign="Left"></ItemStyle>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Immunization Record">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblImmunizationRecord" runat="server" Text='<%# Bind("ImmunizationRecord") %>'></asp:Label>
                                                                            </ItemTemplate>
                                                                            <ItemStyle Wrap="false" />
                                                                            <HeaderStyle Wrap="false" />
                                                                            <ItemStyle HorizontalAlign="Left"></ItemStyle>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Details of any serious illness">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblDetailsofanyseriousillness" runat="server" Text='<%# Bind("Detailsofanyseriousillness") %>'></asp:Label>
                                                                            </ItemTemplate>
                                                                            <ItemStyle Wrap="false" />
                                                                            <HeaderStyle Wrap="false" />
                                                                            <ItemStyle HorizontalAlign="Left"></ItemStyle>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Particulars of any allergies">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblParticularsofanyallergies" runat="server" Text='<%# Bind("Particularsofanyallergies") %>'></asp:Label>
                                                                            </ItemTemplate>
                                                                            <ItemStyle Wrap="false" />
                                                                            <HeaderStyle Wrap="false" />
                                                                            <ItemStyle HorizontalAlign="Left"></ItemStyle>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Emergency Contact Name">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblEmergencyContactName" runat="server" Text='<%# Bind("EmergencyContactName") %>'></asp:Label>
                                                                            </ItemTemplate>
                                                                            <ItemStyle Wrap="false" />
                                                                            <HeaderStyle Wrap="false" />
                                                                            <ItemStyle HorizontalAlign="Left"></ItemStyle>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Emergency Contact Number">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblEmergencyContactNumber" runat="server" Text='<%# Bind("EmergencyContactNumber") %>'></asp:Label>
                                                                            </ItemTemplate>
                                                                            <ItemStyle Wrap="false" />
                                                                            <HeaderStyle Wrap="false" />
                                                                            <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Disabilities if any">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblDisabilitiesifany" runat="server" Text='<%# Bind("Disabilitiesifany") %>'></asp:Label>
                                                                            </ItemTemplate>
                                                                            <ItemStyle Wrap="false" />
                                                                            <HeaderStyle Wrap="false" />
                                                                            <ItemStyle HorizontalAlign="Left"></ItemStyle>
                                                                        </asp:TemplateField>
                                                                    </Columns>
                                                                </asp:GridView>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </asp:Panel>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </center>
                        </div>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </ContentTemplate>
        </ajaxToolkit:TabPanel>
    </ajaxToolkit:TabContainer>
    <a name="bottom">
        <div align="right">
            <a href="#top">
                <asp:Image ID="Image5" runat="server" ImageUrl="Images/top.png" Width="30px" Height="30px" /></a>
            <asp:LinkButton ID="LinkButton3" runat="server"></asp:LinkButton>
        </div>
    </a>
</asp:Content>
