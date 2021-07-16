Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C1C83CB27C
	for <lists.iommu@lfdr.de>; Fri, 16 Jul 2021 08:26:35 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A577F84350;
	Fri, 16 Jul 2021 06:26:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8nLPNCn7-uG1; Fri, 16 Jul 2021 06:26:33 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id DF3D08434F;
	Fri, 16 Jul 2021 06:26:32 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id AD8CEC000E;
	Fri, 16 Jul 2021 06:26:32 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0A23EC000E
 for <iommu@lists.linux-foundation.org>; Fri, 16 Jul 2021 06:26:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D8D4960C03
 for <iommu@lists.linux-foundation.org>; Fri, 16 Jul 2021 06:26:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=infradead.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WBBAQfhjS37S for <iommu@lists.linux-foundation.org>;
 Fri, 16 Jul 2021 06:26:30 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3AE146066B
 for <iommu@lists.linux-foundation.org>; Fri, 16 Jul 2021 06:26:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=nUjvHWwQzpb8v3JLLhXC0gHnxeaBdGyJCLTEJYo+tDU=; b=huSKh0okN6XoYJ0y+dNAPgyNBm
 F7FXsLDRcvDHuySrVPIHVbyStwyItZ/mdSW3L/fqeJJ47c6kBdo/N6Poo2g0iLZB8JaYtHz8Pz2FR
 aF0dgTJomsYvCIKwL6zIjvxUHCQZVJ8bhRZeAG44PSQ4CKcVEXxGf6aM4lt8rptgyJLFsw3ryiGSE
 231k4bokw+Cu6nOyqGfOabFJNNlO6dr/gzmeQIwo5Yqcsx4WM/Nj2H1DHuNNlJVHayhmrjC+8KUyb
 dstirsS0SKabaihWxuTE6mv8KdQ0UMLkuM7hdYgi4xIsWblap+VguVBQB6wwRahw5mGKn3GUSlZeH
 07nz0j9w==;
Received: from hch by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat
 Linux)) id 1m4HGV-004DCm-CL; Fri, 16 Jul 2021 06:24:28 +0000
Date: Fri, 16 Jul 2021 07:24:03 +0100
From: Christoph Hellwig <hch@infradead.org>
To: Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH v4 0/3] Apple M1 DART IOMMU driver
Message-ID: <YPEmA0rdXHiGtHSx@infradead.org>
References: <20210627143405.77298-1-sven@svenpeter.dev>
 <7261df01-34a9-4e53-37cd-ae1aa15b1fb4@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7261df01-34a9-4e53-37cd-ae1aa15b1fb4@arm.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
Cc: Arnd Bergmann <arnd@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 r.czerwinski@pengutronix.de, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, Marc Zyngier <maz@kernel.org>,
 Hector Martin <marcan@marcan.st>, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, Rob Herring <robh+dt@kernel.org>,
 Alexander Graf <graf@amazon.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Mohamed Mediouni <mohamed.mediouni@caramail.com>,
 Mark Kettenis <mark.kettenis@xs4all.nl>, Will Deacon <will@kernel.org>,
 linux-arm-kernel@lists.infradead.org, Stan Skowronek <stan@corellium.com>
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

On Wed, Jul 14, 2021 at 07:19:50PM +0100, Robin Murphy wrote:
> Even at the DMA API level you could hide *some* of it (at the cost of
> effectively only having 1/4 of the usable address space), but there are
> still cases like where v4l2 has a hard requirement that a page-aligned
> scatterlist can be mapped into a contiguous region of DMA addresses.

Where does v4l2 make that broken assumption?  Plenty of dma mapping
implementations including dma-direct do not support that.

Drivers need to call dma_get_merge_boundary() to check for that kind of
behavior.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
