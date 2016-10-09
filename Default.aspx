<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <br />
    <br />
    <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="true" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
        <asp:ListItem Text="English" Value="en-US"></asp:ListItem>
        <asp:ListItem Text="简体中文" Value="zh-CN"></asp:ListItem>
    </asp:DropDownList>
        <table cellpadding="0" cellspacing="0"  Width="471px">
            <tr align =left >
                <td colspan="3"  valign =top align =left >
                    <asp:DataList ID="visitor" runat="server"  Font-Size="9pt">
                        <ItemTemplate>
                            <table cellpadding="0" cellspacing="0"　>
                                <tr>
                                    <td><asp:Label ID="labID" runat="server" Font-Size="9pt"  Text='<%# DataBinder.Eval(Container.DataItem,"ID") %>'></asp:Label></td>
                                        
                                    <td><asp:Label ID="Label1" runat="server" Font-Size="9pt"  Text='<%# DataBinder.Eval(Container.DataItem,"IP") %>'></asp:Label></td>
                                    <td><asp:Label ID="Label2" runat="server" Font-Size="9pt"  Text='<%# DataBinder.Eval(Container.DataItem,"LoginTime") %>'></asp:Label></td>
                                    <td><asp:Label ID="Label3" runat="server" Font-Size="9pt"  Text='<%# DataBinder.Eval(Container.DataItem,"LeaveTime") %>'></asp:Label></td>  
                                    <td><asp:Label ID="Label4" runat="server" Font-Size="9pt"  Text='<%# DataBinder.Eval(Container.DataItem,"Browser") %>'></asp:Label></td>  
                                    <td><asp:Label ID="Label5" runat="server" Font-Size="9pt"  Text='<%# DataBinder.Eval(Container.DataItem,"OS") %>'></asp:Label></td>    
                                </tr> 
                            </table>
                        </ItemTemplate>
                    </asp:DataList>                    
                    </td>
            </tr>
          <tr>
              <td style="width: 471px; text-align: center; font-size: 9pt; height: 16px;" >
                  <asp:Label ID="labCP" runat="server" Text="<%$ Resources:current_page%>"></asp:Label><asp:Label ID="labPage" runat="server" Text="1"></asp:Label>
                  <asp:Label ID="labTP" runat="server" Text="<%$ Resources:total_page%>"></asp:Label>
                  <asp:Label ID="labBackPage" runat="server"></asp:Label>
                  <asp:LinkButton ID="lnkbtnOne" runat="server" Font-Underline="False" ForeColor="Red" OnClick="lnkbtnOne_Click" CausesValidation="False"><asp:Literal runat="server" Text="<%$ Resources:frist_page%>" /></asp:LinkButton>
                  <asp:LinkButton ID="lnkbtnUp" runat="server" Font-Underline="False" ForeColor="Red" OnClick="lnkbtnUp_Click" CausesValidation="False"><asp:Literal runat="server" Text="<%$ Resources:previous_page%>" /></asp:LinkButton>
                  <asp:LinkButton ID="lnkbtnNext" runat="server" Font-Underline="False" ForeColor="Red" OnClick="lnkbtnNext_Click" CausesValidation="False"><asp:Literal runat="server" Text="<%$ Resources:next_page%>" /></asp:LinkButton>&nbsp;
                  <asp:LinkButton ID="lnkbtnBack" runat="server" Font-Underline="False" ForeColor="Red" OnClick="lnkbtnBack_Click" CausesValidation="False"><asp:Literal runat="server" Text="<%$ Resources:last_page%>" /></asp:LinkButton>&nbsp;&nbsp;
              </td>
          </tr>
        </table>
</asp:Content>
