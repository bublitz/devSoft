using System;
using System.IO;
using System.Collections;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using iTextSharp.text.pdf;
using System.Configuration;
using System.Security;
using System.Security.Cryptography;
using System.Security.Permissions;
using System.Security.Cryptography.X509Certificates;
using System.Security.Cryptography.Pkcs;
using System.Collections.Generic;
using Org.BouncyCastle.X509;
using System.Net;
using System.Net.Mail;
using AssinaDEJE.intranet;
using Bublitz;


namespace AssinaDEJE
{
    public partial class Form1 : Form
    {
        public DateTime data_publi;
        public DateTime data_disp;
        public Int32 eco_id;

        public Form1()
        {
            InitializeComponent();
            //configurationAppSettings.GetValue("Nome.Valor", GetType(System.String))            
            txtBanco.Text = ConfigurationManager.AppSettings.Get("Banco");
            txtTemp.Text = ConfigurationManager.AppSettings.Get("PastaTemp");
            //labUser.Text = DateTime.Now.ToLongDateString();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            //labArq.Text = "dje_9999_final.pdf";
            String arq1 = ConfigurationManager.AppSettings.Get("LocalPdfIntranet") + labArq.Text;
            String arq2 = ConfigurationManager.AppSettings.Get("PastaTemp") + labArq.Text;
            String novo = ConfigurationManager.AppSettings.Get("PastaTemp") + labArq.Text.Substring(0, labArq.Text.Length - 9);
            DateTime data = DateTime.Now;
            novo = novo + data.ToString("ddMMyyyy") + ".pdf";
            //MessageBox.Show(novo);

            labMens.Text = "ATENÇÃO: Não esqueça de conectar o Token no equipamento!!!";
            MessageBox.Show("Não esqueça de conectar o Token no equipamento!", "ATENÇÃO!!!!!");

            if (txtLog.Lines.Length  == 0) // vazio
            {
                // baixa arquivo da Intranet
                labMens.Text = "Mensagem: Aguarde... Baixando versão final...";
                System.Windows.Forms.Application.DoEvents();
                try
                {
                    WebClient webClient = new WebClient();
                    webClient.DownloadFile(arq1, @arq2);
                }
                catch
                {
                    labMens.Text = "Mensagem: Erro ao baixar a edição!!";
                    MessageBox.Show("Erro ao baixar a edição. Tente novamente!", "Erro!");
                    return;
                }
                finally
                {
                    txtLog.Text = "Edição baixada.\r\n" + txtLog.Text;
                }

                // Assinando Edição
                labMens.Text = "Mensagem: Aguarde... Assinando edição...";
                System.Windows.Forms.Application.DoEvents();
                try
                {
                    X509Certificate2 card = CertA3.GetCertificate();
                    DateTime expira = new DateTime();
                    expira = Convert.ToDateTime(card.GetExpirationDateString());
                    DateTime hoje = DateTime.Now;
                    if (hoje > expira)
                    {
                        labMens.Text = "ERRO: Este Certificadon está expirado!!!!!";
                        MessageBox.Show("Este Certificadon está expirado!!!!!");
                        return;
                    }
                    String info = card.ToString(false);
                    int p = info.IndexOf("ICP-Brasil");
                    if (p == -1)
                    {
                        labMens.Text = "ERRO: Este Certificado não é válido para assinar o DEJE!!!!!";
                        MessageBox.Show("Este Certificado não é válido para assinar o DEJE!!!!!");
                        return;
                    }

                    X509CertificateParser cp = new X509CertificateParser();
                    Org.BouncyCastle.X509.X509Certificate[] chain = new Org.BouncyCastle.X509.X509Certificate[1];
                    chain[0] = cp.ReadCertificate(card.RawData);

                    PdfReader reader = new PdfReader(arq2);
                    FileStream fs = new FileStream(novo, FileMode.Create);
                    PdfStamper stp = PdfStamper.CreateSignature(reader, fs, '\0');

                    PdfSignatureAppearance sap = CertA3.PutSign(stp, chain);

                    PdfSignature dic = new PdfSignature(PdfName.ADOBE_PPKMS, PdfName.ADBE_PKCS7_SHA1);
                    dic.Date = new PdfDate(sap.SignDate);
                    dic.Name = PdfPKCS7.GetSubjectFields(chain[0]).GetField("CN");

                    if (sap.Reason != null)
                        dic.Reason = sap.Reason;

                    if (sap.Location != null)
                        dic.Location = sap.Location;

                    sap.CryptoDictionary = dic;
                    int csize = 4000;
                    Hashtable exc = new Hashtable();
                    exc[PdfName.CONTENTS] = csize * 2 + 2;
                    sap.PreClose(exc);

                    SHA1CryptoServiceProvider sha = new SHA1CryptoServiceProvider();

                    Stream s = sap.RangeStream;
                    int read = 0;
                    byte[] buff = new byte[8192];

                    while ((read = s.Read(buff, 0, 8192)) > 0)
                    {
                        sha.TransformBlock(buff, 0, read, buff, 0);
                    }

                    sha.TransformFinalBlock(buff, 0, 0);
                    byte[] pk = CertA3.SigMsg(sha.Hash, card, false);
                    byte[] outc = new byte[csize];

                    PdfDictionary dic2 = new PdfDictionary();

                    Array.Copy(pk, 0, outc, 0, pk.Length);

                    dic2.Put(PdfName.CONTENTS, new PdfString(outc).SetHexWriting(true));
                    sap.Close(dic2);
                }
                catch
                {
                    labMens.Text = "Mensagem: Erro ao assinar a edição!!";
                    MessageBox.Show("Erro ao assinar a edição. Tente novamente!", "Erro!");
                    return;
                }
                finally
                {
                    txtLog.Text = "Edição assinada.\r\n" + txtLog.Text;
                }

            } // nenhum item checked            

            labMens.Text = "Mensagem: Aguarde... Enviando para Intranet...";
            System.Windows.Forms.Application.DoEvents();

            // Armezana em Buffer
            BinaryReader br = new BinaryReader(File.Open(novo, FileMode.Open, FileAccess.Read));
            byte[] buf = br.ReadBytes((Int32)br.BaseStream.Length);
            br.Close();

            // Enviando para Intranet
            try
            {
                intranet.TWebService1 ws1 = new TWebService1();
                ws1.Timeout = -1;
                if (ws1.TransfPDF(buf, Path.GetFileName(novo), "DJE_TRE_MT_SAD_CSC_STI"))
                {

                }

            }
            catch
            {
                labMens.Text = "Mensagem: Erro ao enviar para a Intranet!!";
                MessageBox.Show("Erro ao enviar para a Intranet. Tente novamente!", "Erro!");
                return;
            }
            finally
            {
                txtLog.Text = "Edição enviada a Intranet.\r\n" + txtLog.Text;
            }

            // Enviando para Intranet
            labMens.Text = "Mensagem: Aguarde... Enviando para Internet...";
            System.Windows.Forms.Application.DoEvents();
            try
            {
                internet.TWebService1 ws2 = new internet.TWebService1();
                ws2.Timeout = -1;
                if (ws2.TransfPDF(buf, Path.GetFileName(novo), "DJE_TRE_MT_SAD_CSC_STI"))
                {

                }

            }
            catch
            {
                labMens.Text = "Mensagem: Erro ao enviar para a Internet!!";
                MessageBox.Show("Erro ao enviar para a Internet. Tente novamente!", "Erro!");
                return;
            }
            finally
            {
                txtLog.Text = "Edição enviada a Internet.\r\n" + txtLog.Text;
            }
            
            // Enviando para TSE
            labMens.Text = "Mensagem: Aguarde... Enviando para o TSE...";
            System.Windows.Forms.Application.DoEvents();
            try
            {
                OracleConnection con = new OracleConnection("user id=admdjesc;data source=" +
                    txtBanco.Text + ";persist security info=True;password=admdjesc");
                OracleCommand cmd = new OracleCommand("insert into diario" +
                    " (IDO, ANO, NUMERO, DATA_DISPONIBILIZACAO, DATA_DISPONIBILIZACAO_PRETEND, DOCUMENTO_PDF)" +
                    " values (GET_IDO.nextval, :p1, :p2, to_date(:p3,'dd/MM/yyyy'), to_date(:p4,'dd/MM/yyyy'), :p5)", con);
                cmd.Parameters.Add("p1", data_publi.Year.ToString());
                cmd.Parameters.Add("p2", labNum.Text);
                cmd.Parameters.Add("p3", data_disp.ToShortDateString().ToString());
                cmd.Parameters.Add("p4", data_publi.ToShortDateString().ToString());
                cmd.Parameters.Add("p5", buf);
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
            }
            catch
            {
                labMens.Text = "Mensagem: Erro ao enviar para o TSE!!";
                MessageBox.Show("Erro ao enviar para o TSE! Tente novamente!", "Erro!");
                return;
            }
            finally
            {
                txtLog.Text = "Edição enviada para o TSE.\r\n" + txtLog.Text;
            }

            // Atualiza Banco
            labMens.Text = "Mensagem: Aguarde... Atualizando o banco...";
            System.Windows.Forms.Application.DoEvents();
            try
            {
                OracleConnection con = new OracleConnection("user id=admdje;data source=" +
                    txtBanco.Text + ";persist security info=True;password=djeadm2000");
                String sql = "update EDICAO set assinada = '" +
                    labUser.Text + ": " + DateTime.Now.ToLongDateString() + " " + DateTime.Now.ToLongTimeString() + "', " +
                    "datadisp = to_date('" + DateTime.Now.ToShortDateString() + " " + DateTime.Now.ToLongTimeString() + "', 'dd/mm/yyyy HH24:mi:ss'), " +
                    "arquivo = '" + Path.GetFileName(novo) + "' where eco_id = " + eco_id.ToString();
                OracleCommand cmd = new OracleCommand(sql, con);
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
            }
            catch
            {
                labMens.Text = "Mensagem: Erro ao atualizar o banco!!";
                MessageBox.Show("Erro ao enviar atualizar o banco! Tente novamente!", "Erro!");
                return;
            }
            finally
            {
                txtLog.Text = "Banco atualizado.\r\n" + txtLog.Text;
            }


            // Enviando para e-mails
            labMens.Text = "Mensagem: Aguarde... Enviando e-mail's...";
            System.Windows.Forms.Application.DoEvents();

            MailMessage mail = new MailMessage();
            mail.From = new MailAddress("diario@tre-mt.gov.br");
            String lista = "";
            String user = "";
            String email = "";
            String num = "";
            try
            {
                OracleConnection con = new OracleConnection("user id=admdje;data source=" +
                    txtBanco.Text + ";persist security info=True;password=djeadm2000");
                OracleCommand sql = new OracleCommand("SELECT e.numero, u.email, u.nome, m.titulo " +
                   "   FROM edicaopossuimateria l, materia m, edicao e, usuario u" +
                   " where l.edicaos = :p1" +
                   "   and l.materias = m.eco_id" +
                   "   and l.edicaos = e.eco_id" +
                   "   and m.usuario = u.eco_id" +
                   "   order by email, titulo", con);
                sql.Parameters.Add("p1", eco_id.ToString());
                con.Open();

                OracleDataReader re = sql.ExecuteReader();
                while (re.Read())
                {
                    num = re.GetInt32(0).ToString();
                    if (user != re.GetString(2))
                    {
                        lista = "<ul>";
                        user = re.GetString(2);
                        email = re.GetString(1);

                        Boolean ok = true;
                        while (ok)
                        {
                            lista = lista + "<li>" + re.GetString(3) + "</li>";
                            if (!re.Read())
                            {
                                ok = false;
                            }
                            else
                            {
                                if (user != re.GetString(2))
                                    ok = false;
                            }
                        }
                        lista = lista + "</ul>";
                        mail.To.Add(new MailAddress(email));
                        mail.Subject = "Matérias Publicadas no DEJE";
                        mail.Body = "<p><font face='Verdana'><strong>Mensagem Automática do Diário Eletrônico</strong></font></p>" +
                            "<p><font face='Verdana' size='2'>Prezado(a) " + user +
                            ",</font></p><p><font face='Verdana' size='2'>Na edição <b>" + num +
                            "</b> do Diário Eletrônico foram publicadas as seguintes matérias de sua autoria:</font></p>" +
                            "<p><font face='Verdana' size='2'>" + lista + "</font></p>" +
                            "<p><font face='Verdana' size='2'></font>&nbsp;</p>" +
                            "<p><font face='Verdana' size='1'>Este é um e-mail automático. Não responda este e-mail.</font></p>" +
                            "<p><font face='Verdana'></font>&nbsp;</p>";
                        mail.IsBodyHtml = true;
                        SmtpClient client = new SmtpClient();
                        client.Host = "smtp.tre-mt.gov.br";
                        try
                        {
                            client.Send(mail);
                        }
                        catch
                        {
                        }
                    }
                }
                con.Close();
            }
            catch
            {
                //labMens.Text = "Mensagem: Erro ao enviar e-mail´s!!";
                //MessageBox.Show("Erro ao enviar e-mail's! Tente novamente!", "Erro!");
                //return;
                webBrowser1.Navigate(new Uri("http://intranet.tre-mt.gov.br/diario/conf_email.aspx?Edicao=" + labECO_ID.Text));

            }
            finally
            {
                txtLog.Text = "E-mail's enviados com sucesso.\r\n" + txtLog.Text;
            }

            labMens.Text = "Mensagem: Edição assinada e publicada com sucesso!";

            MessageBox.Show("Edição assinada e publicada com sucesso!", "Sucesso!");
            Application.Exit();

        }

        private void btnLogin_Click(object sender, EventArgs e)
        {
            labMens.Text = "Mensagem: Aguarde. Conectando ao banco Oracle...";
            System.Windows.Forms.Application.DoEvents();
            String loginsenha = CertA3.MD5(txtLogin.Text + txtSenha.Text).ToUpper();
            
            OracleConnection con = new OracleConnection("user id=admdje;data source=" +
                txtBanco.Text + ";persist security info=True;password=djeadm2000");
            OracleCommand cmd = new OracleCommand("select NIVEL, NOME from USUARIO where LOGIN = :p1 and LOGINSENHA = :p2 and STATUS='A'", con);
            cmd.Parameters.Add("p1", txtLogin.Text);
            cmd.Parameters.Add("p2", loginsenha);
            con.Open();
            OracleDataReader re1 = cmd.ExecuteReader();
            Int32 nivel = 0;
            if (re1.Read())
                nivel = re1.GetInt32(0);

            if (nivel != 0)
            {  // Login OK
                labMens.Text = "Mensagem: Login OK. Verificando Edição...";
                labUser.Text = re1.GetString(1);
                OracleCommand sql = new OracleCommand("select * from (select ARQUIVO, ASSINADA, DATADISP, DATAPUBLI, NUMERO, ECO_ID from EDICAO order by NUMERO desc) where rownum <= 1", con);
                OracleDataReader re = sql.ExecuteReader();
                re.Read();
                labArq.Text = re.GetString(0);
                labAss.Text = re.GetString(1);
                labDis.Text = re.GetDateTime(2).ToString();
                data_disp = re.GetDateTime(2);
                labPub.Text = re.GetDateTime(3).ToString();
                data_publi = re.GetDateTime(3);
                labNum.Text = re.GetInt32(4).ToString();
                labECO_ID.Text = re.GetInt32(5).ToString();
                eco_id = re.GetInt32(5);
                String nom_arq = re.GetString(0);
                re.Close();
                int i = nom_arq.IndexOf("final");
                if (i == -1)
                {
                    labMens.Text = "Mensagem: ERRO! Edição não pode ser assinada!";
                    MessageBox.Show("Edição não pode ser assinada!", "Erro");
                    btnAssina.Enabled = false;
                }
                else
                {
                    btnAssina.Enabled = true;
                    labMens.Text = "Mensagem: Edição pode ser assinada!";
                }
            }
            else
            {
                labMens.Text = "Mensagem: ERRO. Login/Senha inválidos...";
                labUser.Text = "---";
                MessageBox.Show("Login/Senha inválidos!", "Erro");
            }
            System.Windows.Forms.Application.DoEvents();
            re1.Close();
            con.Close();
        }




        //BOTÃO TESTE
        private void button1_Click_1(object sender, EventArgs e)
        {
            {
                //labArq.Text = "dje_9999_final.pdf";

                labMens.Text = "ATENÇÃO: Não esqueça de conectar o Token no equipamento!!!";
                MessageBox.Show("Não esqueça de conectar o Token no equipamento!", "ATENÇÃO!!!!!");

                    // Assinando Edição
                    labMens.Text = "Mensagem: Aguarde... Assinando edição...";
                    System.Windows.Forms.Application.DoEvents();
                        X509Certificate2 card = CertA3.GetCertificate();


                        DateTime expira = new DateTime();
                        expira = Convert.ToDateTime(card.GetExpirationDateString());
                        DateTime hoje = DateTime.Now;

                        if (hoje > expira)
                        {
                            labMens.Text = "ERRO: Este Certificadon está expirado!!!!!";
                            MessageBox.Show("Este Certificadon está expirado!!!!!");
                            return;
                        }


                        String info = card.ToString(false);
                        int p = info.IndexOf("ICP-Brasil");
                        if (p == -1)
                        {
                            labMens.Text = "ERRO: Este Certificado não é válido para assinar o DEJE!!!!!";
                            MessageBox.Show("Este Certificado não é válido para assinar o DEJE!!!!!");
                            return;
                        }

                        PdfReader reader = new PdfReader("c:\\temp\\teste.pdf");

                        FileStream fs = new FileStream("c:\\temp\\teste_assinado.pdf", FileMode.Create);
                        PdfStamper stp = PdfStamper.CreateSignature(reader, fs, '\0');
                        X509CertificateParser cp = new X509CertificateParser();
                        Org.BouncyCastle.X509.X509Certificate[] chain = new Org.BouncyCastle.X509.X509Certificate[1];
                        chain[0] = cp.ReadCertificate(card.RawData);

                        PdfSignatureAppearance sap = stp.SignatureAppearance;
                        DateTime agora = DateTime.Now;
                        sap.SignDate = agora;

                        sap.SetCrypto(null, chain, null, null);

                        sap.Reason = "TESTE ASSINATURA - BUBLITZ";
                        sap.Location = "CIEC - STI";
                        sap.Acro6Layers = true;
                        sap.Render = PdfSignatureAppearance.SignatureRender.NameAndDescription;

                        PdfSignature dic = new PdfSignature(PdfName.ADOBE_PPKMS, PdfName.ADBE_PKCS7_SHA1);
                        dic.Date = new PdfDate(sap.SignDate);
                        dic.Name = PdfPKCS7.GetSubjectFields(chain[0]).GetField("CN");


                        if (sap.Reason != null)
                            dic.Reason = sap.Reason;

                        if (sap.Location != null)
                            dic.Location = sap.Location;

                        sap.CryptoDictionary = dic;
                        int csize = 4000;
                        Hashtable exc = new Hashtable();
                        exc[PdfName.CONTENTS] = csize * 2 + 2;
                        sap.PreClose(exc);

                        SHA1CryptoServiceProvider sha = new SHA1CryptoServiceProvider();

                        Stream s = sap.RangeStream;
                        int read = 0;
                        byte[] buff = new byte[8192];

                        while ((read = s.Read(buff, 0, 8192)) > 0)
                        {
                            sha.TransformBlock(buff, 0, read, buff, 0);
                        }

                        sha.TransformFinalBlock(buff, 0, 0);
                        byte[] pk = CertA3.SigMsg(sha.Hash, card, false);
                        byte[] outc = new byte[csize];

                        PdfDictionary dic2 = new PdfDictionary();

                        Array.Copy(pk, 0, outc, 0, pk.Length);

                        dic2.Put(PdfName.CONTENTS, new PdfString(outc).SetHexWriting(true));
                        sap.Close(dic2);


                } // nenhum item checked            

            }
    }
}
