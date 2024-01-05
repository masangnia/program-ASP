<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Default.aspx.vb" Inherits="LatihanDML._Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
     <title>UNIVERSITAS INSAN PEMBANGUNAN INDONESIA</title>
     <link href="StyleSheet1.css" rel="stylesheet" type="text/css" />
     <style type="text/css">
  .latar
  {
  	background-image: url("bg.jpg");
  	}
  .style1
 {
 text-align: center;
 }
 .style2
 {
 font-family: "Courier New";
 font-size: small;
 color: #FFFFFF;
 }
 </style>
</head>
<body>
     <form id="form1" runat="server">
     <div class="latar" style="width:100%; height:610px; margin:auto; padding-top:10px; border:1px; " >
         <div style="width:780px; height:125px; margin:auto; background:white; padding-top:2px; " >
             <div style ="width:770px; height:110px; background:gray; margin:auto; 
            padding-top:0px; padding-bottom:0px;">
             <img src="header.png" width="770" height ="120" alt =""/>
         </div> 
     </div>
     <div style ="width:780px; height:415px; margin:auto; background:#999999; 
    margin-top:5px; padding-bottom :5px; " >
         <div style="width:200px; height:415px; float:left; background:white; " >
             <div style ="width:190px; height:395px; background:#333333; margin:auto; 
            padding-left:5px; padding-top:5px; padding-bottom:5px; margin-top:5px;">
         <div class="StyleMenu">
          <h3 class="HeaderBar">MAIN MENU</h3>
          <ul>
             <li><a href="menu-utama.aspx">HOME</a></li>
             <li><a href="data-karyawan.aspx">Data Karyawan</a></li>
             <li><a href="data-absensi.aspx">Data Absebsi Karyawan</a></li>
             <li><a href="data-jabatan.aspx">Data Jabatan Karyawan</a></li>
             <li><a href="page-login.aspx">LOGOUT</a></li>
         </ul>
         </div>
         </div>
     </div>
 <div style ="width:580px; height:415px; float:right; background:blue;" >
     <div style =" width:550px; height:20px; background:silver; margin:auto; 
    padding-right :10px; padding-left:10px; padding-top:5px; padding-bottom:5px; margin-top:5px;">
         <table align="center" >
             <tr align="center" valign="middle">
             <td align="center" valign="middle">OLAH DATA KARYAWAN</td>
             </tr>
         </table>
     </div>
     <div style =" width:550px; height:150px; background:silver; margin:auto; 
    padding-right :10px; padding-left:10px; padding-top:5px; padding-bottom:5px; margin-top:5px; ">
     <table>
     <tr>
         <td style="width:100px;">ID KARYAWAN</td>
         <td>
         <asp:TextBox ID="txtIDKaryawan" runat="server" Width="80px" MaxLength="10"></asp:TextBox>
         </td>
     </tr>
     <tr>
         <td style="width:100px;">NAMA KARYAWAN</td>
         <td>
         <asp:TextBox ID="txtNamaKaryawan" runat="server" Width="200px"></asp:TextBox>
         </td>
         <td style="width:50px;" ></td>
         <td><asp:Button ID="btnSave" Width="80px" runat="server" Text="Save" /></td>
     </tr> 
     <tr>
         <td style="width:100px;">JENIS KELAMIN</td>
         <td >
        <asp:RadioButtonList ID="optJenisKelamin" runat="server" RepeatDirection="Horizontal" >
        <asp:ListItem Text="Pria" Value="P"></asp:ListItem>
        <asp:ListItem Text="Wanita" Value="W"></asp:ListItem>
        </asp:RadioButtonList>
        </td>       
         <td style="width:50px;" ></td>
         <td><asp:Button ID="btnUpdate" Width="80px" runat="server" Text="Update" /></td>
     </tr>      
     <tr>
          <td>JABATAN</td>
          <td>
            <asp:DropDownList ID="ddlJabatan" runat="server" Width="190px">
            <asp:ListItem Text="ADMIN" Value="A"></asp:ListItem>
            <asp:ListItem Text="HRD" Value="H"></asp:ListItem>
            <asp:ListItem Text="OPERATOR PRODUKSI" Value="O"></asp:ListItem>
            <asp:ListItem Text="STAFF MARKETING" Value="S"></asp:ListItem>
            </asp:DropDownList>
          </td> 
          <td style="width:50px;" ></td>
          <td><asp:Button ID="btnDelete" Width="80px" runat="server" Text="Delete" /></td>
         
     </tr> 
     <tr>
         <td>TGL MASUK</td>
        <td>
            <asp:TextBox ID="txtTglMasuk" runat="server" type="date"></asp:TextBox>
        </td>
        
         <td style="width:50px;" ></td>
         <td><asp:Button ID="btnClear" Width="80px" runat="server" Text="Clear" /></td>
    </tr>
   
     <tr>
         <td style="width:180px;">STATUS</td>
         <td>
         <asp:TextBox ID="txtStatus" runat="server" Width="100px"></asp:TextBox> 
         </td>     
     </tr> 

     <td>&nbsp;</td>
    </table> 
 </div>
     <div style =" width:550px; height:200px; background:silver; margin:auto; 
    padding-right :10px; padding-left:10px; margin-top:5px; padding-top:5px; ">
         <div style =" width:545px; height:198px; background:white; margin:auto; 
        overflow:auto ; ">
     <asp:GridView ID ="grdList" runat ="server" AutoGenerateColumns ="false" ShowFooter ="false" Width ="600px" >
     <Columns >
     <asp:CommandField ControlStyle-ForeColor="Blue" HeaderText ="Select" ShowHeader="true" ShowSelectButton ="true" >
     <ControlStyle ForeColor ="Blue" />
     </asp:CommandField>
     <asp:BoundField DataField ="id_karyawan" HeaderText ="ID" ItemStyle-Width ="40px" >
     <HeaderStyle Wrap ="false" />
     <ItemStyle Wrap ="false" />
     </asp:BoundField >
     <asp:BoundField DataField ="nama_karyawan" HeaderText ="NAMA KARYAWAN" ItemStyle-Width ="250px" >
     <HeaderStyle Wrap ="false" />
     <ItemStyle Wrap ="false" />
     </asp:BoundField >
     <asp:BoundField DataField ="jenis_kelamin" HeaderText ="JENIS KELAMIN" ItemStyle-Width ="100px" >
     <HeaderStyle Wrap ="false" />
     <ItemStyle Wrap ="false" />
     </asp:BoundField >
     <asp:BoundField DataField ="jabatan" HeaderText ="JABATAN" ItemStyle-Width ="50px" >
     <HeaderStyle Wrap ="false" />
     <ItemStyle Wrap ="false" />
     </asp:BoundField >
    <asp:BoundField DataField ="status" HeaderText ="STATUS" ItemStyle-Width ="80px" ItemStyle-HorizontalAlign="Right" DataFormatString ="{0:N2}">
    <HeaderStyle Wrap ="false" />
    <ItemStyle Wrap ="false" />
    </asp:BoundField >
    
 </Columns>
 </asp:GridView> 
 </div>
 </div>
 </div> 
 </div>
 
 <div style="width:780px; height:40px; margin:auto; background:white; padding-top:5px;" class="style1" >
 <div style ="width:770px; height:30px; background:#333333; margin:auto; 
padding-bottom:5px;" > 
 <span class="style2">Copyrights by Siti - TANGERANG</span><br 
class="style2" />
 <span class="style2"><span class="style2">&copy; 2023 All Rights 
Reserved</span></span><span class="style2"> </span>
 </div>
 </div>
 </div> 
 </form>
</body>
</html>

