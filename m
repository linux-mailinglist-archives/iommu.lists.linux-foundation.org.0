Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FADA259250
	for <lists.iommu@lfdr.de>; Tue,  1 Sep 2020 17:08:24 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id A310886407;
	Tue,  1 Sep 2020 15:08:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fxnQD2274cS8; Tue,  1 Sep 2020 15:08:21 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id BA7B08638F;
	Tue,  1 Sep 2020 15:08:21 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A39DDC0051;
	Tue,  1 Sep 2020 15:08:21 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A2609C1E44
 for <iommu@lists.linux-foundation.org>; Tue,  1 Sep 2020 15:08:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 48C17203D0
 for <iommu@lists.linux-foundation.org>; Tue,  1 Sep 2020 15:08:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VD1Chsxr1pIj for <iommu@lists.linux-foundation.org>;
 Tue,  1 Sep 2020 15:08:05 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
 by silver.osuosl.org (Postfix) with ESMTPS id 9545A2079A
 for <iommu@lists.linux-foundation.org>; Tue,  1 Sep 2020 15:06:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=TQLSoH0xPQ3SjLQOZr/hg2RXQ7cUeDg7DQ8wAuWlnPY=; b=jZd0L7aTlxDR248PzMNlW27wkh
 U5RPUon6By39MJmZf0ctObEI9pE6t9/Rga1EYLZwsrKYL9QKBtSzQY4MensUyVRxNASrX33Pl6ldS
 zbXRi9/lO7DOPWfK1zGncHVRI29r2AMThiNWFyK5BL0hKgOTicHc7ljMttBaeAT085JBU3dfIIkhB
 i2DXKzLWz59dGh9/sp69/KBXolj/SaGGtRWihBzzh4x4klX60zoq5kB/U7R9cVPhcDeNn5gerBNkJ
 glYPLWys77T11Ln0t8j7NNm/ySZOphISgDrR6WnPzsdkVah1bi4+EBuWuom6AkSHomcEJms18cORZ
 5mRx4n8A==;
Received: from willy by casper.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1kD7r8-0008OT-59; Tue, 01 Sep 2020 15:05:54 +0000
Date: Tue, 1 Sep 2020 16:05:54 +0100
From: Matthew Wilcox <willy@infradead.org>
To: James Bottomley <James.Bottomley@hansenpartnership.com>
Subject: Re: [PATCH 07/28] 53c700: improve non-coherent DMA handling
Message-ID: <20200901150554.GN14765@casper.infradead.org>
References: <20200819065555.1802761-1-hch@lst.de>
 <20200819065555.1802761-8-hch@lst.de>
 <1598971960.4238.5.camel@HansenPartnership.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1598971960.4238.5.camel@HansenPartnership.com>
Cc: alsa-devel@alsa-project.org, linux-ia64@vger.kernel.org,
 linux-doc@vger.kernel.org, nouveau@lists.freedesktop.org,
 linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, Christoph Hellwig <hch@lst.de>,
 linux-samsung-soc@vger.kernel.org, Joonyoung Shim <jy0922.shim@samsung.com>,
 linux-scsi@vger.kernel.org, Kyungmin Park <kyungmin.park@samsung.com>,
 Ben Skeggs <bskeggs@redhat.com>, Matt Porter <mporter@kernel.crashing.org>,
 linux-media@vger.kernel.org, Tom Lendacky <thomas.lendacky@amd.com>,
 Pawel Osciak <pawel@osciak.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org,
 netdev@vger.kernel.org, Seung-Woo Kim <sw0312.kim@samsung.com>,
 linux-mips@vger.kernel.org, iommu@lists.linux-foundation.org
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

On Tue, Sep 01, 2020 at 07:52:40AM -0700, James Bottomley wrote:
> I think this looks mostly OK, except for one misnamed parameter below. 
> Unfortunately, the last non-coherent parisc was the 700 series and I no
> longer own a box, so I can't test that part of it (I can fire up the
> C360 to test it on a coherent arch).

I have a 715/50 that probably hasn't been powered on in 15 years if you
need something that old to test on (I believe the 725/100 uses the 7100LC
and so is coherent).  I'll need to set up a cross-compiler ...
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
