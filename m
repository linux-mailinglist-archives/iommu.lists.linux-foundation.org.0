Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 1881E1D5788
	for <lists.iommu@lfdr.de>; Fri, 15 May 2020 19:22:07 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 917A589B53;
	Fri, 15 May 2020 17:22:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id elrCwDfhn+1Z; Fri, 15 May 2020 17:22:01 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 1F87589AF5;
	Fri, 15 May 2020 17:22:01 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 14565C016F;
	Fri, 15 May 2020 17:22:01 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 59825C016F
 for <iommu@lists.linux-foundation.org>; Fri, 15 May 2020 17:21:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 54E55879EF
 for <iommu@lists.linux-foundation.org>; Fri, 15 May 2020 17:21:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Q8k7Ty_d_Gl1 for <iommu@lists.linux-foundation.org>;
 Fri, 15 May 2020 17:21:59 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 011078791D
 for <iommu@lists.linux-foundation.org>; Fri, 15 May 2020 17:21:58 +0000 (UTC)
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D35B82073E;
 Fri, 15 May 2020 17:21:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1589563318;
 bh=0P8rL+XmxOR/BVtEmlu60acHvGkwGm2FDdjswXIkm68=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=GRNC4iSbHX8O2WHd1MLCSQ+5chG8FCYLWzzSuJ1Sdqejq2+A6bxxojc3r++wZatCU
 VsAw+NehG0ZYH8SSRm4A0HLaqagynOVtuaGeMneX4jImS9u7o8WEQgMdCyR8aNkbYU
 e9y0qROMvVqwlLtcwPde3eSYl8XtXXZr11HwXh5M=
Date: Fri, 15 May 2020 18:21:53 +0100
From: Will Deacon <will@kernel.org>
To: "Raj, Ashok" <ashok.raj@intel.com>
Subject: Re: [PATCH 0/4] PCI, iommu: Factor 'untrusted' check for ATS
 enablement
Message-ID: <20200515172152.GC23334@willie-the-truck>
References: <20200515104359.1178606-1-jean-philippe@linaro.org>
 <20200515154351.GA6546@infradead.org>
 <20200515171948.GC75440@otc-nc-03>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200515171948.GC75440@otc-nc-03>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>, linux-pci@vger.kernel.org,
 alex.williamson@redhat.com, Christoph Hellwig <hch@infradead.org>,
 iommu@lists.linux-foundation.org, bhelgaas@google.com, robin.murphy@arm.com,
 dwmw2@infradead.org, linux-arm-kernel@lists.infradead.org
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

Hi,

On Fri, May 15, 2020 at 10:19:49AM -0700, Raj, Ashok wrote:
> On Fri, May 15, 2020 at 08:43:51AM -0700, Christoph Hellwig wrote:
> > Can you please lift the untrusted flag into struct device?  It really
> > isn't a PCI specific concept, and we should not have code poking into
> > pci_dev all over the iommu code.
> 
> Just for clarification: All IOMMU's today mostly pertain to only PCI devices
> and for devices that aren't PCI like HPET for instance we give a PCI
> identifier. Facilities like ATS for instance require the platform to have 
> an IOMMU.
> 
> what additional problems does moving this to struct device solve?

ATS is PCI specific, but IOMMUs certainly aren't! The vast majority of
IOMMUs deployed in arm/arm64 SoCs are /not/ using any sort of PCI.

Will
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
