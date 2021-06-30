Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 373423B7D9F
	for <lists.iommu@lfdr.de>; Wed, 30 Jun 2021 08:50:11 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CA4E240004;
	Wed, 30 Jun 2021 06:50:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aWoMYvcDvwzo; Wed, 30 Jun 2021 06:50:07 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 05CCD4010C;
	Wed, 30 Jun 2021 06:50:06 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C5A59C0022;
	Wed, 30 Jun 2021 06:50:06 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6BCCCC000E
 for <iommu@lists.linux-foundation.org>; Wed, 30 Jun 2021 06:50:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 52E4283AB4
 for <iommu@lists.linux-foundation.org>; Wed, 30 Jun 2021 06:50:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=infradead.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OGzvyHThWrQH for <iommu@lists.linux-foundation.org>;
 Wed, 30 Jun 2021 06:50:04 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2144D83AB2
 for <iommu@lists.linux-foundation.org>; Wed, 30 Jun 2021 06:50:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=b+svzs78j/62UsetKE/X8fy/L/Rti/5BS8qNFSo3AdY=; b=YvWJ06tpNI/PQXlniltz4HwA3w
 qvb35mtIRc7zoasrxSW0mwsdp8zrl4IJSUR7/UExaPp/G8HsbZqhmZlr4ASbIIp59RN4JH3VQh7fp
 xHEDUrkCCy2uCHpgfbSjVyKOkg4PTOCvVF4Enjph0VlxcF4zTLWkTlRaISyXvZB/VwmOM3y+FpBoV
 6qZoJl6WMlxndz8lCibcQIqcC5UECay58H2CbwSkj9LoPW1VLcWhEzsZrRfGx/73bje+xZPfyhKNH
 lVnlsQnRDYwDqRdQZanFGZ7dwRrA4fkXGgnVrpwNPbUCu1xejZSK9SK+jWBqCRn8QlyeNiYye6v4P
 Swb3eHsA==;
Received: from hch by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat
 Linux)) id 1lyU1x-0050Oj-1M; Wed, 30 Jun 2021 06:49:09 +0000
Date: Wed, 30 Jun 2021 07:49:05 +0100
From: Christoph Hellwig <hch@infradead.org>
To: Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [RFC] /dev/ioasid uAPI proposal
Message-ID: <YNwT4eO2LCIEXyiq@infradead.org>
References: <30e5c597-b31c-56de-c75e-950c91947d8f@redhat.com>
 <20210604160336.GA414156@nvidia.com>
 <2c62b5c7-582a-c710-0436-4ac5e8fd8b39@redhat.com>
 <20210604172207.GT1002214@nvidia.com>
 <20210604152918.57d0d369.alex.williamson@redhat.com>
 <20210604230108.GB1002214@nvidia.com>
 <20210607094148.7e2341fc.alex.williamson@redhat.com>
 <20210607181858.GM1002214@nvidia.com>
 <20210607125946.056aafa2.alex.williamson@redhat.com>
 <20210607190802.GO1002214@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210607190802.GO1002214@nvidia.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>, "Tian,
 Kevin" <kevin.tian@intel.com>, "Jiang, Dave" <dave.jiang@intel.com>, "Raj,
 Ashok" <ashok.raj@intel.com>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Robin Murphy <robin.murphy@arm.com>,
 Jason Wang <jasowang@redhat.com>, LKML <linux-kernel@vger.kernel.org>,
 Kirti Wankhede <kwankhede@nvidia.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
 Paolo Bonzini <pbonzini@redhat.com>, David Woodhouse <dwmw2@infradead.org>,
 David Gibson <david@gibson.dropbear.id.au>
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

On Mon, Jun 07, 2021 at 04:08:02PM -0300, Jason Gunthorpe wrote:
> Compatibility is important, but when I look in the kernel code I see
> very few places that call wbinvd(). Basically all DRM for something
> relavent to qemu.
> 
> That tells me that the vast majority of PCI devices do not generate
> no-snoop traffic.

Part of it is that we have no general API for it, because the DRM folks
as usual just tarted piling up local hacks instead of introducing
a proper API..
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
