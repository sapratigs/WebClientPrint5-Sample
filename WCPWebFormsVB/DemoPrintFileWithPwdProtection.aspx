﻿<%@ Page Title="Print Files With Password Protection" Language="VB" MasterPageFile="~/MasterPage.master" %>


<script runat="server">


</script>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderBody" runat="Server">

    <div class="container">
        <div class="row">

            <h3><a href="Samples.aspx" class="btn btn-md btn-danger"><i class="fa fa-chevron-left"></i></a>&nbsp;Print Files With Password Protection without displaying any Print dialog! <small>(if needed)</small></h3>
            <p>
                With <strong>WebClientPrint for ASP.NET</strong> solution you can <strong>print password protected PDF, DOC &amp; XLS files</strong> right to any installed printer at the client side.
            </p>

            <div class="alert alert-info">
                The file password is set at server side and then it's encrypted (using RSA) and embedded into the file metadata. Although the file is downloaded to the client machine, it keeps password protected. The WebClientPrint Processor app, loads the file in memory and unlock the file in system memory for printing it. 
            </div>

            <div class="well">
                <p>
                    The following are pre-selected files to test WebClientPrint File Printing with Password Protection feature enabled. You can download the files for testing them. The password for all files is <code>ABC123</code>
                </p>
                <div class="row">
                    <div class="col-md-4 col-md-offset-2">
                        <hr />
                        <div class="checkbox">
                            <label>
                                <input type="checkbox" id="useDefaultPrinter" />
                                <strong>Print to Default printer</strong> or...
                            </label>
                        </div>
                        <div id="loadPrinters">
                            Click to load and select one of the installed printers!
                            <br />
                            <a onclick="javascript:jsWebClientPrint.getPrinters();" class="btn btn-success">Load installed printers...</a>
                            <br />
                            <br />
                        </div>
                        <div id="installedPrinters" style="visibility: hidden">
                            <label for="installedPrinterName">Select an installed Printer:</label>
                            <select name="installedPrinterName" id="installedPrinterName" class="form-control"></select>
                        </div>
                        <script type="text/javascript">
                            //var wcppGetPrintersDelay_ms = 0;
                            var wcppGetPrintersTimeout_ms = 60000; //60 sec
                            var wcppGetPrintersTimeoutStep_ms = 500; //0.5 sec
                            function wcpGetPrintersOnSuccess() {
                                // Display client installed printers
                                if (arguments[0].length > 0) {
                                    var p = arguments[0].split("|");
                                    var options = '';
                                    for (var i = 0; i < p.length; i++) {
                                        options += '<option>' + p[i] + '</option>';
                                    }
                                    $('#installedPrinters').css('visibility', 'visible');
                                    $('#installedPrinterName').html(options);
                                    $('#installedPrinterName').focus();
                                    $('#loadPrinters').hide();
                                } else {
                                    alert("No printers are installed in your system.");
                                }
                            }
                            function wcpGetPrintersOnFailure() {
                                // Do something if printers cannot be got from the client
                                alert("No printers are installed in your system.");
                            }
                        </script>
                    </div>
                    <div class="col-md-4">
                        <hr />
                        <div id="fileToPrint">
                            <label for="ddlFileType">Select a sample File to print:</label>
                            <select id="ddlFileType" class="form-control">
                                <option>PDF</option>
                                <option>DOC</option>
                                <option>XLS</option>
                            </select>
                            <br />
                            <a class="btn btn-success btn-lg" onclick="javascript:jsWebClientPrint.print('encryptPassword=true' + '&useDefaultPrinter=' + $('#useDefaultPrinter').attr('checked') + '&printerName=' + encodeURIComponent($('#installedPrinterName').val()) + '&filetype=' + $('#ddlFileType').val());">Print File...</a>
                            <br /><br />
                            <a class="btn btn-info btn-sm" href="files/LoremIpsum-PasswordProtected.pdf" target="_blank"><i class="fa fa-download"></i>&nbsp;PDF</a>
                            <a class="btn btn-info btn-sm" href="files/LoremIpsum-PasswordProtected.doc" target="_blank"><i class="fa fa-download"></i>&nbsp;DOC</a>
                            <a class="btn btn-info btn-sm" href="files/SampleSheet-PasswordProtected.xls" target="_blank"><i class="fa fa-download"></i>&nbsp;XLS</a>
                        </div>
                    </div>
                </div>

            </div>
                    

        </div>
    </div>


</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolderScripts" runat="Server">

    <%-- Register the WebClientPrint script code --%>
    <%=Neodynamic.SDK.Web.WebClientPrint.CreateScript(HttpContext.Current.Request.Url.Scheme & "://" & HttpContext.Current.Request.Url.Host & ":" & HttpContext.Current.Request.Url.Port & "/WebClientPrintAPI.ashx", HttpContext.Current.Request.Url.Scheme & "://" & HttpContext.Current.Request.Url.Host & ":" & HttpContext.Current.Request.Url.Port & "/DemoPrintFileWithPwdProtectionHandler.ashx", HttpContext.Current.Session.SessionID)%>


</asp:Content>

