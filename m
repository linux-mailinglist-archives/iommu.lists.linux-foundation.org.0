Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 49AD61D7E79
	for <lists.iommu@lfdr.de>; Mon, 18 May 2020 18:29:24 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 04AEA86DB3;
	Mon, 18 May 2020 16:29:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yuEVanTM84+o; Mon, 18 May 2020 16:29:22 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 6336886E49;
	Mon, 18 May 2020 16:29:22 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 47EAAC07FF;
	Mon, 18 May 2020 16:29:22 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A994EC07FF
 for <iommu@lists.linux-foundation.org>; Mon, 18 May 2020 16:29:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 9839186DF4
 for <iommu@lists.linux-foundation.org>; Mon, 18 May 2020 16:29:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cZ97tN-Prazd for <iommu@lists.linux-foundation.org>;
 Mon, 18 May 2020 16:29:19 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 5E32C86DB3
 for <iommu@lists.linux-foundation.org>; Mon, 18 May 2020 16:29:19 +0000 (UTC)
IronPort-SDR: HjlSkzBV7wAJk76ZHmtDevKAbq2NGq+UanRxcN/SOGmDw4XgVCxViFRUeen9KeYBHUk3KztQ7N
 T9FNTTy87NjA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2020 09:29:16 -0700
IronPort-SDR: IsfGIPgmh9ow/1nMPOsWe8QHvrerOLaKz4ePIfTIl77UGc9ouzE5GO46eu84skAVC9ndMGi6C3
 DnATkJggKVCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,407,1583222400"; d="scan'208";a="308152106"
Received: from otc-nc-03.jf.intel.com (HELO otc-nc-03) ([10.54.39.25])
 by FMSMGA003.fm.intel.com with ESMTP; 18 May 2020 09:29:11 -0700
Date: Mon, 18 May 2020 09:29:11 -0700
From: "Raj, Ashok" <ashok.raj@intel.com>
To: David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH 0/4] PCI, iommu: Factor 'untrusted' check for ATS
 enablement
Message-ID: <20200518162911.GA92942@otc-nc-03>
References: <20200515104359.1178606-1-jean-philippe@linaro.org>
 <20200515154351.GA6546@infradead.org>
 <20200515171948.GC75440@otc-nc-03>
 <3ce5d02db49254e50883224771ffb35cf436845f.camel@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3ce5d02db49254e50883224771ffb35cf436845f.camel@infradead.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>,
 Ashok Raj <ashok.raj@intel.com>, linux-pci@vger.kernel.org,
 alex.williamson@redhat.com, Christoph Hellwig <hch@infradead.org>,
 iommu@lists.linux-foundation.org, bhelgaas@google.com, will@kernel.org,
 linux-arm-kernel@lists.infradead.org, robin.murphy@arm.com
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

On Mon, May 18, 2020 at 04:47:17PM +0100, David Woodhouse wrote:
> On Fri, 2020-05-15 at 10:19 -0700, Raj, Ashok wrote:
> > Hi Christoph
> > 
> > On Fri, May 15, 2020 at 08:43:51AM -0700, Christoph Hellwig wrote:
> > > Can you please lift the untrusted flag into struct device?  It really
> > > isn't a PCI specific concept, and we should not have code poking into
> > > pci_dev all over the iommu code.
> > 
> > Just for clarification: All IOMMU's today mostly pertain to only PCI devices
> > and for devices that aren't PCI like HPET for instance we give a PCI
> > identifier. Facilities like ATS for instance require the platform to have 
> > an IOMMU.
> > 
> > what additional problems does moving this to struct device solve?
> 
> Even the Intel IOMMU supports ACPI devices for which there is no struct
> pci_dev; only a B/D/F in the ANDD record indicating which entry in the
> context table to use.

Yes, spaced out :-).. just don't work on those platforms on a daily
basis and its easy to forget :-(
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
