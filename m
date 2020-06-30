Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 8895920F883
	for <lists.iommu@lfdr.de>; Tue, 30 Jun 2020 17:38:33 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 33C73886C4;
	Tue, 30 Jun 2020 15:38:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QV2Gpk5yHWqS; Tue, 30 Jun 2020 15:38:31 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 907F78833F;
	Tue, 30 Jun 2020 15:38:31 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 76815C08A6;
	Tue, 30 Jun 2020 15:38:31 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 93B93C016E
 for <iommu@lists.linux-foundation.org>; Tue, 30 Jun 2020 15:38:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 7AB7688370
 for <iommu@lists.linux-foundation.org>; Tue, 30 Jun 2020 15:38:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5b2ao4Vp+InS for <iommu@lists.linux-foundation.org>;
 Tue, 30 Jun 2020 15:38:28 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by hemlock.osuosl.org (Postfix) with ESMTPS id E4DD68833F
 for <iommu@lists.linux-foundation.org>; Tue, 30 Jun 2020 15:38:28 +0000 (UTC)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id EC25A20675;
 Tue, 30 Jun 2020 15:38:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1593531508;
 bh=+mq7WcFXbYo5431aLEmBieudqWsKg/kt/fvcWMZkCBE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Bl5RxFhCCwtZ5oZDGw16ns2h6Q1i3BvDgAiiZajr1R4bo3LNxd92zGKQulajPnAgr
 r+LDhITZ9t4UD+Arr3ExbqZRI1I7z4PJOV36rG+wNmngm6kE6gmcaxGmW6D7xP69RV
 T0U12bR/14EoCs2+2EM2angdXKN5GkhIQdYlIyCI=
Date: Tue, 30 Jun 2020 17:38:16 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>
Subject: Re: [PATCH v2 5/7] driver core: Add device location to "struct
 device" and expose it in sysfs
Message-ID: <20200630153816.GD1785141@kroah.com>
References: <20200630044943.3425049-1-rajatja@google.com>
 <20200630044943.3425049-6-rajatja@google.com>
 <20200630104948.GC856968@kuha.fi.intel.com>
 <20200630125216.GA1109228@kroah.com>
 <CAJZ5v0iYFKrouQx_b7afPnz7ohjWOKKDhdHj_3HObKYV_rRhiw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJZ5v0iYFKrouQx_b7afPnz7ohjWOKKDhdHj_3HObKYV_rRhiw@mail.gmail.com>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Linux PCI <linux-pci@vger.kernel.org>, lalithambika.krishnakumar@intel.com,
 Todd Broch <tbroch@google.com>, Diego Rivas <diegorivas@google.com>,
 Rajat Jain <rajatja@google.com>,
 Jean-Philippe Brucker <jean-philippe@linaro.org>,
 Furquan Shaikh <furquan@google.com>, Raj Ashok <ashok.raj@intel.com>,
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

On Tue, Jun 30, 2020 at 03:00:34PM +0200, Rafael J. Wysocki wrote:
> On Tue, Jun 30, 2020 at 2:52 PM Greg Kroah-Hartman
> <gregkh@linuxfoundation.org> wrote:
> >
> > On Tue, Jun 30, 2020 at 01:49:48PM +0300, Heikki Krogerus wrote:
> > > On Mon, Jun 29, 2020 at 09:49:41PM -0700, Rajat Jain wrote:
> > > > Add a new (optional) field to denote the physical location of a device
> > > > in the system, and expose it in sysfs. This was discussed here:
> > > > https://lore.kernel.org/linux-acpi/20200618184621.GA446639@kroah.com/
> > > >
> > > > (The primary choice for attribute name i.e. "location" is already
> > > > exposed as an ABI elsewhere, so settled for "site"). Individual buses
> > > > that want to support this new attribute can opt-in by setting a flag in
> > > > bus_type, and then populating the location of device while enumerating
> > > > it.
> > >
> > > So why not just call it "physical_location"?
> >
> > That's better, and will allow us to put "3rd blue plug from the left,
> > 4th row down" in there someday :)
> >
> > All of this is "relative" to the CPU, right?  But what CPU?  Again, how
> > are the systems with drawers of PCI and CPUs and memory that can be
> > added/removed at any point in time being handled here?  What is
> > "internal" and "external" for them?
> >
> > What exactly is the physical boundry here that is attempting to be
> > described?
> 
> Also, where is the "physical location" information going to come from?

Who knows?  :)

Some BIOS seem to provide this, but do you trust that?

> If that is the platform firmware (which I suspect is the anticipated
> case), there may be problems with reliability related to that.

s/may/will/

which means making the kernel inact a policy like this patch series
tries to add, will result in a lot of broken systems, which is why I
keep saying that it needs to be done in userspace.

It's as if some of us haven't been down this road before and just keep
being ignored...

{sigh}

greg k-h
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
