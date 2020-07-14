Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 62AAF21FE6F
	for <lists.iommu@lfdr.de>; Tue, 14 Jul 2020 22:19:52 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 1504D88BBC;
	Tue, 14 Jul 2020 20:19:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zuWWACSeErSf; Tue, 14 Jul 2020 20:19:48 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 539BD88AFB;
	Tue, 14 Jul 2020 20:19:48 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3A14EC0733;
	Tue, 14 Jul 2020 20:19:48 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A622FC0733
 for <iommu@lists.linux-foundation.org>; Tue, 14 Jul 2020 20:19:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 83E0486C6A
 for <iommu@lists.linux-foundation.org>; Tue, 14 Jul 2020 20:19:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7w0B5DLljOpq for <iommu@lists.linux-foundation.org>;
 Tue, 14 Jul 2020 20:19:45 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com
 [209.85.208.196])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 0CEC386C48
 for <iommu@lists.linux-foundation.org>; Tue, 14 Jul 2020 20:19:44 +0000 (UTC)
Received: by mail-lj1-f196.google.com with SMTP id h22so25208443lji.9
 for <iommu@lists.linux-foundation.org>; Tue, 14 Jul 2020 13:19:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XWpCwFxzq2ITP3K2PgbPEPYflHGc9CASEeamyGhecg4=;
 b=ktzGRdNHxUc/NOjGB1vSjjeBZhP/eN1zV/MJ3JD8wmxjdxCf0IQ+zpHExTOeKFCy+a
 lkIxtWm6PjqYkFHafKjnDH7YyMKXwotc5q6DnqSw3TopHIRLxHCs+deg6PTyFFdIXYFv
 k7EKTWOzzY2ectIvYgQJoT3PC8WtQ36MwQGEEdeS4yRKsH7OHceijsqk6ydBx4RUmYvR
 IZrllP4JBOp0cXppgKAXu1mmq6yPSvexe7a431gzpco6kw0dfLio0xngHrY49l7HSD+o
 /v/hKsd9rStGhPgfKDu4Tzc6hz5W+DzX3Fs66+EIKtMQGOTLMOIPGhjlXHu/EB8LfYrq
 3KdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XWpCwFxzq2ITP3K2PgbPEPYflHGc9CASEeamyGhecg4=;
 b=lH+QXa/edHkz8tcHNVzz17y4k9xlsT+LrmIeMTplPi8XOAmt1qMEHvT3fEPDhN+zbf
 hcne6ghMCA9B0zSLOGbS5zxpvhjr2zyrTRu4rMtZ8EjPFBc2H0zDwABV8uyBv+diQkc5
 asfDicPHXqLGl+AYxU+PCrTE5U7E3umxAQ3CMADGffRG4uRmBo4u7x0+GMQekt/lIL7y
 62DjvdKWI4Nbe2KugUSGMI5jAHegOld5qAzkaqYv6GdCamQ5LtiFbc1ZYDcK4z/5+/De
 eCjhvExA3Hwiax4I8dw0cPhR00dp0koihzgjyFkGrx/JD9v4EeQDsSfd09V/NURRWaDs
 rFOA==
X-Gm-Message-State: AOAM533/Wu4EDHzQQfSpq4YiH4oMZlHCXtXHinziwEodQDS8IFqoIXMh
 xtZCDwNSuMysxE+5AxgGl5ieJBQ3Nq4V8k1DElIxFg==
X-Google-Smtp-Source: ABdhPJyog1559G29m5pJ504Xf+0cH4eNg4/1fwwOhATAWoZMeuV+BZE2PrcQIEm6ttR2VLYvOaa4/0qm67q9Isa6wdw=
X-Received: by 2002:a2e:8199:: with SMTP id e25mr2844648ljg.307.1594757982632; 
 Tue, 14 Jul 2020 13:19:42 -0700 (PDT)
MIME-Version: 1.0
References: <CACK8Z6F-8OZNJU8wqWuZq=moCaOi+3W=CzBeppfO31VZnkqBrg@mail.gmail.com>
 <20200711195346.GA132330@bjorn-Precision-5520>
In-Reply-To: <20200711195346.GA132330@bjorn-Precision-5520>
Date: Tue, 14 Jul 2020 13:19:05 -0700
Message-ID: <CACK8Z6HP1VHs4P=U6-+D_D8HrQ5D1P679P_=saNqUMXE-bNUjg@mail.gmail.com>
Subject: Re: [PATCH v4 4/4] PCI/ACS: Enable PCI_ACS_TB for
 untrusted/external-facing devices
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Todd Broch <tbroch@google.com>, linux-pci <linux-pci@vger.kernel.org>,
 "Krishnakumar, Lalithambika" <lalithambika.krishnakumar@intel.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Diego Rivas <diegorivas@google.com>,
 Jean-Philippe Brucker <jean-philippe@linaro.org>,
 Furquan Shaikh <furquan@google.com>, "Raj, Ashok" <ashok.raj@intel.com>,
 Saravana Kannan <saravanak@google.com>,
 ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
 Christian Kellner <christian@kellner.me>,
 Mattias Nissler <mnissler@google.com>, Jesse Barnes <jsbarnes@google.com>,
 Len Brown <lenb@kernel.org>, Rajat Jain <rajatxjain@gmail.com>,
 Prashant Malani <pmalani@google.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Aaron Durbin <adurbin@google.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Bernie Keany <bernie.keany@intel.com>, Duncan Laurie <dlaurie@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "open list:AMD IOMMU \(AMD-VI\)" <iommu@lists.linux-foundation.org>,
 Arnd Bergmann <arnd@arndb.de>, Oliver O'Halloran <oohall@gmail.com>,
 Benson Leung <bleung@google.com>, David Woodhouse <dwmw2@infradead.org>,
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
From: Rajat Jain via iommu <iommu@lists.linux-foundation.org>
Reply-To: Rajat Jain <rajatja@google.com>
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

Sent out v5 with this approach here:
https://patchwork.kernel.org/patch/11663515/

Thanks,

Rajat

>
>
> It's possible BIOS gives us devices with ATS enabled, and this might
> break them, but that seems like something we'd want to find out about.
>
> Bjorn
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
