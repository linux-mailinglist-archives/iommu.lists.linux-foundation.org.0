Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ED5E21C605
	for <lists.iommu@lfdr.de>; Sat, 11 Jul 2020 21:53:54 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id AC0E120461;
	Sat, 11 Jul 2020 19:53:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4H0DDYOl3Bcu; Sat, 11 Jul 2020 19:53:50 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id BE21D203F8;
	Sat, 11 Jul 2020 19:53:50 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A50B1C016F;
	Sat, 11 Jul 2020 19:53:50 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 49869C016F
 for <iommu@lists.linux-foundation.org>; Sat, 11 Jul 2020 19:53:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 2C74B88F6E
 for <iommu@lists.linux-foundation.org>; Sat, 11 Jul 2020 19:53:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SQkOgDUEIMCi for <iommu@lists.linux-foundation.org>;
 Sat, 11 Jul 2020 19:53:48 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 60FA388F47
 for <iommu@lists.linux-foundation.org>; Sat, 11 Jul 2020 19:53:48 +0000 (UTC)
Received: from localhost (mobile-166-175-191-139.mycingular.net
 [166.175.191.139])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 939A820725;
 Sat, 11 Jul 2020 19:53:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594497228;
 bh=Z16Tvyu00GM8lWPjZaVxUYQVl8q4upyC4+JAo11HVT4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=j5yQ/CohDw63QZlCRPNpB3igj8YUwmWz54kQmR+NLDemFBfMmRRyj9/fuFXIS/v5l
 3+MtbbkCOKqOka1dDKyYWRtf6hATIydJPL9bZqOY/LWXNw0x+EsedbDrP/UmzD93DF
 3kZBjfdZw4jfkVJfgeBp42Hfh+z3ro3SuIb9JwjA=
Date: Sat, 11 Jul 2020 14:53:46 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Rajat Jain <rajatja@google.com>
Subject: Re: [PATCH v4 4/4] PCI/ACS: Enable PCI_ACS_TB for
 untrusted/external-facing devices
Message-ID: <20200711195346.GA132330@bjorn-Precision-5520>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CACK8Z6F-8OZNJU8wqWuZq=moCaOi+3W=CzBeppfO31VZnkqBrg@mail.gmail.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

On Fri, Jul 10, 2020 at 03:53:59PM -0700, Rajat Jain wrote:
> On Fri, Jul 10, 2020 at 2:29 PM Raj, Ashok <ashok.raj@intel.com> wrote:
> > On Fri, Jul 10, 2020 at 03:29:22PM -0500, Bjorn Helgaas wrote:
> > > On Tue, Jul 07, 2020 at 03:46:04PM -0700, Rajat Jain wrote:
> > > > When enabling ACS, enable translation blocking for external facing ports
> > > > and untrusted devices.
> > > >
> > > > Signed-off-by: Rajat Jain <rajatja@google.com>
> > > > ---
> > > > v4: Add braces to avoid warning from kernel robot
> > > >     print warning for only external-facing devices.
> > > > v3: print warning if ACS_TB not supported on external-facing/untrusted ports.
> > > >     Minor code comments fixes.
> > > > v2: Commit log change
> > > >
> > > >  drivers/pci/pci.c    |  8 ++++++++
> > > >  drivers/pci/quirks.c | 15 +++++++++++++++
> > > >  2 files changed, 23 insertions(+)
> > > >
> > > > diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
> > > > index 73a8627822140..a5a6bea7af7ce 100644
> > > > --- a/drivers/pci/pci.c
> > > > +++ b/drivers/pci/pci.c
> > > > @@ -876,6 +876,14 @@ static void pci_std_enable_acs(struct pci_dev *dev)
> > > >     /* Upstream Forwarding */
> > > >     ctrl |= (cap & PCI_ACS_UF);
> > > >
> > > > +   /* Enable Translation Blocking for external devices */
> > > > +   if (dev->external_facing || dev->untrusted) {
> > > > +           if (cap & PCI_ACS_TB)
> > > > +                   ctrl |= PCI_ACS_TB;
> > > > +           else if (dev->external_facing)
> > > > +                   pci_warn(dev, "ACS: No Translation Blocking on external-facing dev\n");
> > > > +   }
> > >
> > > IIUC, this means that external devices can *never* use ATS and
> > > can never cache translations.
> 
> Yes, but it already exists today (and this patch doesn't change that):
> 521376741b2c2 "PCI/ATS: Only enable ATS for trusted devices"
> 
> IMHO any external device trying to send ATS traffic despite having ATS
> disabled should count as a bad intent. And this patch is trying to
> plug that loophole, by blocking the AT traffic from devices that we do
> not expect to see AT from anyway.

Thinking about this some more, I wonder if Linux should:

  - Explicitly disable ATS for every device at enumeration-time, e.g.,
    in pci_init_capabilities(), 

  - Enable PCI_ACS_TB for every device (not just external-facing or
    untrusted ones),

  - Disable PCI_ACS_TB for the relevant devices along the path only
    when enabling ATS.

One nice thing about doing that is that the "untrusted" test would be
only in pci_enable_ats(), and we wouldn't need one in
pci_std_enable_acs().

It's possible BIOS gives us devices with ATS enabled, and this might
break them, but that seems like something we'd want to find out about.

Bjorn
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
