﻿using System;
using System.Collections.Generic;
using System.Windows;
using System.Windows.Controls;
using Outlook = Microsoft.Office.Interop.Outlook;

namespace CheckMyMail
{
    /// <summary>
    /// MainDialog.xaml の相互作用ロジック
    /// </summary>
    public partial class MainDialog : Window
    {
        public MainDialog()
        {
            InitializeComponent();
        }

        private List<MailRecipient> GetRecipients(Outlook.MailItem mail)
        {
            var list = new List<MailRecipient>();

            foreach (Outlook.Recipient recp in mail.Recipients)
            {
                list.Add(new MailRecipient(recp));
            }

            list.Sort(CompareByAddress);
            return list;
        }

        public int CompareByAddress(MailRecipient x, MailRecipient y)
        {
            if (x.DispOrder != y.DispOrder)
            {
                return x.DispOrder - y.DispOrder;
            }
            var ret = String.Compare(x.Group, y.Group);
            if (ret != 0)
            {
                return ret;
            }
            ret = String.Compare(x.SendType, y.SendType);
            if (ret != 0)
            {
                return -ret;
            }
            return String.Compare(x.Address, y.Address);
        }

        public void LoadMail(Outlook.MailItem mail, Config config)
        {
            StackPanel sp;
            CheckBox cb;
            var groups = new HashSet<string>();

            foreach (MailRecipient recp in GetRecipients(mail))
            {
                if (config.InternalDomains.Contains(recp.Group))
                {
                    sp = spInt;
                }
                else
                {
                    sp = spExt;
                }

                if (!groups.Contains(recp.Group))
                {
                    var label = new Label
                    {
                        Content = recp.Group
                    };
                    label.FontWeight = FontWeights.Bold;
                    label.Padding = new Thickness(0, 3, 0, 3);
                    sp.Children.Add(label);
                    groups.Add(recp.Group);
                }
                cb = new CheckBox
                {
                    Content = recp.Address,
                    ToolTip = recp.Tooltip
                };
                cb.Click += HandleClickCB;
                cb.Margin = new Thickness(10, 2, 0, 2);
                sp.Children.Add(cb);
            }

            foreach (Outlook.Attachment item in mail.Attachments)
            {
                cb = new CheckBox { Content = item.FileName };
                cb.Click += HandleClickCB;
                spFile.Children.Add(cb);
            }
        }

        void HandleClickCB(object sender, RoutedEventArgs e)
        {
            if (AllChecked(spInt) && AllChecked(spExt) && AllChecked(spFile))
            {
                ButtonOK.IsEnabled = true;
            }
            else
            {
                ButtonOK.IsEnabled = false;
            }
        }

        void HandleClickOK(object sender, RoutedEventArgs e)
        {
            this.DialogResult = true;
        }

        private bool AllChecked(StackPanel sp)
        {
            foreach (UIElement e in sp.Children)
            {
                if (e is CheckBox && ((CheckBox)e).IsChecked != true)
                {
                    return false;
                }
            }
            return true;
        }
    }
}