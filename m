Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id BA8AC37B63E
	for <lists.iommu@lfdr.de>; Wed, 12 May 2021 08:39:41 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 450586072C;
	Wed, 12 May 2021 06:39:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2G3imWqHwY69; Wed, 12 May 2021 06:39:39 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTP id 336F3605D4;
	Wed, 12 May 2021 06:39:39 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 04FCDC0024;
	Wed, 12 May 2021 06:39:39 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1FB2EC0001
 for <iommu@lists.linux-foundation.org>; Wed, 12 May 2021 06:39:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 065426072C
 for <iommu@lists.linux-foundation.org>; Wed, 12 May 2021 06:39:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZMzZofmKHHEj for <iommu@lists.linux-foundation.org>;
 Wed, 12 May 2021 06:39:36 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CD71B605D4
 for <iommu@lists.linux-foundation.org>; Wed, 12 May 2021 06:39:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=qT8iDHBtgV77fF8gHSSRJsweWuoLwMxssud1SQ+sMFw=; b=ekg1E450CgRxJwrigDD4HIGXvy
 qTLJcWMI7uNPCzwaWsYYZF/KX0n2Euqn1nzZ8/r3VogDq44psgbEO5tjSxh25+ixKgYQqfeO1nHb8
 hNsnEjGZyXAWFndfUAd/TDMgtXwovpIXfh1ahU9khrB8jQ/bQlEXYRkiQNMXWk41ULbwH1hjsBQUV
 X4a9KsTuYG/ix1dW2e7d+x9efrRhnwZd1yyzfTRSyXa+3BfvYk3DBa0FDiS849nDIE/JEdiCD0ctD
 3Eg1wbBhKB1LxgX3bphe3vXT+rykAg0mfG5Qc5xG5C6lHZkAuoYgqn5sVobKMp2bSZ1Oi8K0fDshc
 0WfcCPuQ==;
Received: from hch by casper.infradead.org with local (Exim 4.94 #2 (Red Hat
 Linux)) id 1lgiV2-0081QQ-2F; Wed, 12 May 2021 06:37:54 +0000
Date: Wed, 12 May 2021 07:37:40 +0100
From: Christoph Hellwig <hch@infradead.org>
To: Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [PATCH v4 1/2] iommu/sva: Tighten SVA bind API with explicit flags
Message-ID: <YJt3tGlzFK3b4E82@infradead.org>
References: <1620653108-44901-1-git-send-email-jacob.jun.pan@linux.intel.com>
 <1620653108-44901-2-git-send-email-jacob.jun.pan@linux.intel.com>
 <20210510233749.GG1002214@nvidia.com>
 <20210510203145.086835cc@jacob-builder>
 <20210511114848.GK1002214@nvidia.com>
 <20210511091452.721e9a03@jacob-builder>
 <20210511163521.GN1002214@nvidia.com>
 <20210511110550.477a434f@jacob-builder>
 <20210511194726.GP1002214@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210511194726.GP1002214@nvidia.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
Cc: vkoul@kernel.org, "Tian, Kevin" <kevin.tian@intel.com>,
 Dave Jiang <dave.jiang@intel.com>, Raj Ashok <ashok.raj@intel.com>,
 David Woodhouse <dwmw2@infradead.org>, LKML <linux-kernel@vger.kernel.org>,
 Christoph Hellwig <hch@infradead.org>, iommu@lists.linux-foundation.org,
 zhangfei.gao@linaro.org, Jean-Philippe Brucker <jean-philippe@linaro.com>
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

On Tue, May 11, 2021 at 04:47:26PM -0300, Jason Gunthorpe wrote:
> > Let me try to break down your concerns:
> > 1. portability - driver uses DMA APIs can function w/ and w/o IOMMU. is
> > that your concern? But PASID is intrinsically tied with IOMMU and if
> > the drivers are using a generic sva-lib API, why they are not portable?
> > SVA by its definition is to avoid map/unmap every time.
> 
> Kernel explicitly does not support this programming model. All DMA is
> explicit and the DMA API hides platform details like IOMMU and CPU
> cache coherences. Just because x86 doesn't care about this doesn't
> make any of it optional.

Exactly.

> If you want to do SVA PASID then it also must come with DMA APIs to
> manage the CPU cache coherence that are all NOP's on x86.

Yes.  And we have plenty of precende where an IOMMU is in "bypass" mode
to allow access to all memory and then uses the simple dma-direct case.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
