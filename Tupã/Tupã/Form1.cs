using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using System.DirectoryServices;

namespace Tupã
{
    public partial class frmMain : Form
    {
        public frmMain()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            DirectoryEntry entry = new DirectoryEntry(
                           "LDAP://mtdc00.tre-mt.gov.br:389/OU=Servidores,DC=tre-mt,DC=gov,DC=br",
                           "bublitz", "jorge230302");

            try
            {
                Object native = entry.NativeObject;
                label1.Text = "Autenticado! " + entry.Username;
                
            }
            catch (Exception ex)
            {
                label1.Text = ex.Message;
            }

        }
    }
}
