Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B493255B9B
	for <lists.iommu@lfdr.de>; Fri, 28 Aug 2020 15:53:04 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id A195A87DEF;
	Fri, 28 Aug 2020 13:53:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SugaZlFyaLHe; Fri, 28 Aug 2020 13:53:00 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id B93EB87EF9;
	Fri, 28 Aug 2020 13:53:00 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 945F0C0051;
	Fri, 28 Aug 2020 13:53:00 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CF205C0051
 for <iommu@lists.linux-foundation.org>; Fri, 28 Aug 2020 13:52:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id BD06B87EEC
 for <iommu@lists.linux-foundation.org>; Fri, 28 Aug 2020 13:52:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rsz2oMzQct0F for <iommu@lists.linux-foundation.org>;
 Fri, 28 Aug 2020 13:52:58 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 7F34D87DEF
 for <iommu@lists.linux-foundation.org>; Fri, 28 Aug 2020 13:52:58 +0000 (UTC)
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org
 [51.254.78.96])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0FD3420776;
 Fri, 28 Aug 2020 13:52:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598622778;
 bh=T7BIgnulmA7Rr4VLtFe5t2nLsQIXVYWoUuHXGZx4Vjs=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Uo6SO5R2ezrJiBPDRV1S93w8bWqnRhEY+W9XY9s6oSe7cKp02czOoNpg0rTdv9o0Q
 ph8kxjMp/pXOSqcn2p1nxoQjh6mHG7VaVIxPqsu1ZI8ntzCsqdwIurHSpRrEdA3w+Q
 ZxybgY1fooOM/99PO34iLFdwoPHAMX5TShHXGqVU=
Received: from disco-boy.misterjones.org ([51.254.78.96] helo=www.loen.fr)
 by disco-boy.misterjones.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <maz@kernel.org>)
 id 1kBeoK-007Qex-8b; Fri, 28 Aug 2020 14:52:56 +0100
MIME-Version: 1.0
Date: Fri, 28 Aug 2020 14:52:56 +0100
From: Marc Zyngier <maz@kernel.org>
To: Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [patch V2 34/46] PCI/MSI: Make arch_.*_msi_irq[s] fallbacks
 selectable
In-Reply-To: <20200828125403.GR1152540@nvidia.com>
References: <20200826112333.992429909@linutronix.de>
 <20200827182040.GA2049623@bjorn-Precision-5520>
 <20200828112142.GA14208@e121166-lin.cambridge.arm.com>
 <20200828121944.GQ1152540@nvidia.com>
 <0cc8bfd9258dfc507585fd0f19a945e3@kernel.org>
 <20200828125403.GR1152540@nvidia.com>
User-Agent: Roundcube Webmail/1.4.8
Message-ID: <9346b8358726185a31f50b0fac257129@kernel.org>
X-Sender: maz@kernel.org
X-SA-Exim-Connect-IP: 51.254.78.96
X-SA-Exim-Rcpt-To: jgg@nvidia.com, lorenzo.pieralisi@arm.com,
 helgaas@kernel.org, tglx@linutronix.de, linux-kernel@vger.kernel.org,
 x86@kernel.org, joro@8bytes.org, iommu@lists.linux-foundation.org,
 linux-hyperv@vger.kernel.org, haiyangz@microsoft.com,
 jonathan.derrick@intel.com, baolu.lu@linux.intel.com, wei.liu@kernel.org,
 kys@microsoft.com, sthemmin@microsoft.com, steve.wahl@hpe.com,
 sivanich@hpe.com, rja@hpe.com, linux-pci@vger.kernel.org, bhelgaas@google.com,
 konrad.wilk@oracle.com, xen-devel@lists.xenproject.org, jgross@suse.com,
 boris.ostrovsky@oracle.com, sstabellini@kernel.org, gregkh@linuxfoundation.org,
 rafael@kernel.org, megha.dey@intel.com, dave.jiang@intel.com,
 alex.williamson@redhat.com, jacob.jun.pan@intel.com, baolu.lu@intel.com,
 kevin.tian@intel.com, dan.j.williams@intel.com, robh@kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org);
 SAEximRunCond expanded to false
Cc: Dimitri Sivanich <sivanich@hpe.com>, linux-hyperv@vger.kernel.org,
 Steve Wahl <steve.wahl@hpe.com>, linux-pci@vger.kernel.org,
 "K. Y. Srinivasan" <kys@microsoft.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Rob Herring <robh@kernel.org>,
 Wei Liu <wei.liu@kernel.org>, Stephen Hemminger <sthemmin@microsoft.com>,
 Baolu Lu <baolu.lu@intel.com>, x86@kernel.org,
 Bjorn Helgaas <helgaas@kernel.org>, Megha Dey <megha.dey@intel.com>,
 xen-devel@lists.xenproject.org, Kevin Tian <kevin.tian@intel.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Haiyang Zhang <haiyangz@microsoft.com>,
 Dan Williams <dan.j.williams@intel.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>, Dave Jiang <dave.jiang@intel.com>,
 Thomas Gleixner <tglx@linutronix.de>, Jon Derrick <jonathan.derrick@intel.com>,
 Juergen Gross <jgross@suse.com>, Russ Anderson <rja@hpe.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 LKML <linux-kernel@vger.kernel.org>, iommu@lists.linux-foundation.org,
 Jacob Pan <jacob.jun.pan@intel.com>, "Rafael J. Wysocki" <rafael@kernel.org>
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

On 2020-08-28 13:54, Jason Gunthorpe wrote:
> On Fri, Aug 28, 2020 at 01:47:59PM +0100, Marc Zyngier wrote:
> 
>> > So the arch_setup_msi_irq/etc is not really an arch hook, but some
>> > infrastructure to support those 4 PCI root port drivers.
>> 
>> I happen to have a *really old* patch addressing Tegra [1], which
>> I was never able to test (no HW). Rebasing it shouldn't be too hard,
>> and maybe you can find someone internally willing to give it a spin?
> 
> Sure, that helps a bunch, I will ask internally if someone in that BU
> can take a look.

I just rebased[1] the patch onto -rc2, and provided a TODO list in the
commit message.

Thanks,

         M.

[1] 
https://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.git/log/?h=irq/tegra-msi
-- 
Jazz is not dead. It just smells funny...
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
