Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id E345421C6CC
	for <lists.iommu@lfdr.de>; Sun, 12 Jul 2020 02:09:09 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 1EDEF8804D;
	Sun, 12 Jul 2020 00:09:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NRpkDnmuac06; Sun, 12 Jul 2020 00:09:07 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 7272A86A8C;
	Sun, 12 Jul 2020 00:09:07 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5B677C016F;
	Sun, 12 Jul 2020 00:09:07 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BB130C016F
 for <iommu@lists.linux-foundation.org>; Sun, 12 Jul 2020 00:09:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id A3D9522049
 for <iommu@lists.linux-foundation.org>; Sun, 12 Jul 2020 00:09:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rAEP+U9t9DEl for <iommu@lists.linux-foundation.org>;
 Sun, 12 Jul 2020 00:09:04 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com
 [209.85.160.195])
 by silver.osuosl.org (Postfix) with ESMTPS id F173520243
 for <iommu@lists.linux-foundation.org>; Sun, 12 Jul 2020 00:09:03 +0000 (UTC)
Received: by mail-qt1-f195.google.com with SMTP id g13so7374903qtv.8
 for <iommu@lists.linux-foundation.org>; Sat, 11 Jul 2020 17:09:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:reply-to:from:date:message-id
 :subject:to:cc;
 bh=pou8Xfe98lnWE/rbRKHVE6SyHdTXSqWjqH3LyMm2g1g=;
 b=VS6vv99Vg+bqf95zuX4c+7cQB4qH9c0v2nf/YVV/5Qq7W4TIfgoKhTyLLt6gllzaD2
 2sDIc+gSeKdyaeH2/4iMGWnT8plbBkjDfLgFjWYViZMWB9YKL4GtSkZz70yQFAZAG8F2
 opo6cytCGbpzgnKdVEI2SGN+iIsXI4eU6XpBF1rWFlKxUtShEQYcsVEub/ttLfOP2cvw
 bklV724Jb7ZwSBei3wih3mzvvEvZ+YHxRc/+syR53QZY7B1+mMf8qr6TWML9wNpHoX2Y
 DFgWis5Phn93qJ3N9gOPk1mbtexwwRcKzyev5tpM9UO+t4bWtWEJ3h2vcNNjX8HbzcDU
 oLgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
 :from:date:message-id:subject:to:cc;
 bh=pou8Xfe98lnWE/rbRKHVE6SyHdTXSqWjqH3LyMm2g1g=;
 b=ajAk4gCc/1+swPdaGIERJOi9ys5qYLwgNbV4mAbJRgpCquMZpwhi7PjNYxvqLVFBL5
 2JfjW0qsucEFmyaCXwH3QGMen2kUX+ByfjpKQjWDLRD3sEv1Ma/8VHcqchsKGc5bh8Rc
 LqbLgIfi9hA6G7uC+WpP/c4wBi2j6tayaiOjsEaPiifBip663epK40j+MicaRH+5fbok
 saL+7Q+fw3nJ/9FHaiSCebPxmPKZvp83EgE/P0LG1Z7zZZBN0g2/QcThYE7Te7FelT61
 Hwhso9AbkhUhA9Vv5UsDCMB05A3uDAVGtgYEotDtZjMVOcOhzZep7jhA0k7UtxmbBsmX
 ix+w==
X-Gm-Message-State: AOAM532Ygm8lwjaI9r+X/AxiYp3txWgF/7UdxbX31/EJb6exFgQUD9+l
 uXyh1TJNOm7B1YeUiNklu1Q20TKzEgvPvPRTtL4=
X-Google-Smtp-Source: ABdhPJwGbWSe6AmUoeoFkZuqf2GX8tN/l1kTz2CbVY36DMOxeSmlg58d0fnBi/IgFdweYfqb4tDywCSMUJqdan/2aY4=
X-Received: by 2002:ac8:518b:: with SMTP id c11mr76434264qtn.195.1594512542683; 
 Sat, 11 Jul 2020 17:09:02 -0700 (PDT)
MIME-Version: 1.0
References: <CACK8Z6F-8OZNJU8wqWuZq=moCaOi+3W=CzBeppfO31VZnkqBrg@mail.gmail.com>
 <20200711195346.GA132330@bjorn-Precision-5520>
In-Reply-To: <20200711195346.GA132330@bjorn-Precision-5520>
From: Rajat Jain <rajatxjain@gmail.com>
Date: Sat, 11 Jul 2020 17:08:51 -0700
Message-ID: <CAA93t1rjzTYmag1vTDT==7GQ8LLduc9Ne06btEEwiyBRtCeTNg@mail.gmail.com>
Subject: Re: [PATCH v4 4/4] PCI/ACS: Enable PCI_ACS_TB for
 untrusted/external-facing devices
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Todd Broch <tbroch@google.com>, linux-pci <linux-pci@vger.kernel.org>,
 "Krishnakumar, Lalithambika" <lalithambika.krishnakumar@intel.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Diego Rivas <diegorivas@google.com>, Rajat Jain <rajatja@google.com>,
 Jean-Philippe Brucker <jean-philippe@linaro.org>,
 Furquan Shaikh <furquan@google.com>, "Raj, Ashok" <ashok.raj@intel.com>,
 Saravana Kannan <saravanak@google.com>,
 ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
 Christian Kellner <christian@kellner.me>,
 Mattias Nissler <mnissler@google.com>, Jesse Barnes <jsbarnes@google.com>,
 Len Brown <lenb@kernel.org>, Prashant Malani <pmalani@google.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Aaron Durbin <adurbin@google.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Benson Leung <bleung@google.com>, Duncan Laurie <dlaurie@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "open list:AMD IOMMU \(AMD-VI\)" <iommu@lists.linux-foundation.org>,
 Arnd Bergmann <arnd@arndb.de>, Oliver O'Halloran <oohall@gmail.com>,
 Bernie Keany <bernie.keany@intel.com>, David Woodhouse <dwmw2@infradead.org>,
 Alex Levin <levinale@google.com>
X-BeenThere: iommu@lists.linux-foundation.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: Development issues for Linux IOMMU support
 <iommu.lists.linux-foundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/iommu>,
 <mailto:iommu-request@lists.linux-foundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/iommu/>
List-Post: <mailto:iommu@lists.linux-foundation.org>
List-Help: <mailto:iommu-request@lists.linux-foundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/iommu>,
 <mailto:iommu-request@lists.linux-foundation.org?subject=subscribe>
Reply-To: rajatxjain@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

On Sat, Jul 11, 2020 at 12:53 PM Bjorn Helgaas <helgaas@kernel.org> wrote:
>
> On Fri, Jul 10, 2020 at 03:53:59PM -0700, Rajat Jain wrote:
> > On Fri, Jul 10, 2020 at 2:29 PM Raj, Ashok <ashok.raj@intel.com> wrote:
> > > On Fri, Jul 10, 2020 at 03:29:22PM -0500, Bjorn Helgaas wrote:
> > > > On Tue, Jul 07, 2020 at 03:46:04PM -0700, Rajat Jain wrote:
> > > > > When enabling ACS, enable translation blocking for external facing ports
> > > > > and untrusted devices.
> > > > >
> > > > > Signed-off-by: Rajat Jain <rajatja@google.com>
> > > > > ---
> > > > > v4: Add braces to avoid warning from kernel robot
> > > > >     print warning for only external-facing devices.
> > > > > v3: print warning if ACS_TB not supported on external-facing/untrusted ports.
> > > > >     Minor code comments fixes.
> > > > > v2: Commit log change
> > > > >
> > > > >  drivers/pci/pci.c    |  8 ++++++++
> > > > >  drivers/pci/quirks.c | 15 +++++++++++++++
> > > > >  2 files changed, 23 insertions(+)
> > > > >
> > > > > diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
> > > > > index 73a8627822140..a5a6bea7af7ce 100644
> > > > > --- a/drivers/pci/pci.c
> > > > > +++ b/drivers/pci/pci.c
> > > > > @@ -876,6 +876,14 @@ static void pci_std_enable_acs(struct pci_dev *dev)
> > > > >     /* Upstream Forwarding */
> > > > >     ctrl |= (cap & PCI_ACS_UF);
> > > > >
> > > > > +   /* Enable Translation Blocking for external devices */
> > > > > +   if (dev->external_facing || dev->untrusted) {
> > > > > +           if (cap & PCI_ACS_TB)
> > > > > +                   ctrl |= PCI_ACS_TB;
> > > > > +           else if (dev->external_facing)
> > > > > +                   pci_warn(dev, "ACS: No Translation Blocking on external-facing dev\n");
> > > > > +   }
> > > >
> > > > IIUC, this means that external devices can *never* use ATS and
> > > > can never cache translations.
> >
> > Yes, but it already exists today (and this patch doesn't change that):
> > 521376741b2c2 "PCI/ATS: Only enable ATS for trusted devices"
> >
> > IMHO any external device trying to send ATS traffic despite having ATS
> > disabled should count as a bad intent. And this patch is trying to
> > plug that loophole, by blocking the AT traffic from devices that we do
> > not expect to see AT from anyway.
>
> Thinking about this some more, I wonder if Linux should:
>
>   - Explicitly disable ATS for every device at enumeration-time, e.g.,
>     in pci_init_capabilities(),
>
>   - Enable PCI_ACS_TB for every device (not just external-facing or
>     untrusted ones),
>
>   - Disable PCI_ACS_TB for the relevant devices along the path only
>     when enabling ATS.
>
> One nice thing about doing that is that the "untrusted" test would be
> only in pci_enable_ats(), and we wouldn't need one in
> pci_std_enable_acs().

Yes, this could work.

I think I had thought about this but I'm blanking out on why I had
given it up. I think it was because of the possibility that some
bridges may have "Translation blocking" disabled, even if not all
their descendents were trusted enough to enable ATS on them. But now
thinking about this again, as long as we retain the policy of not
enabling ATS on external devices (and thus enable TB for sure on
them), this should not be a problem. WDYT?

>
> It's possible BIOS gives us devices with ATS enabled, and this might
> break them, but that seems like something we'd want to find out about.
>

Why would they break? We'd disable ATS on each device as we enumerate
them, so they'd be functional, just with ATS disabled until it is
enabled again on internal devices as needed. Which would be WAI
behavior?

Thanks,
,
Rajat




> Bjorn
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
