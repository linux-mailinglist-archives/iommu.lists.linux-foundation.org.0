Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 29BD7341E81
	for <lists.iommu@lfdr.de>; Fri, 19 Mar 2021 14:39:45 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C40E84011B;
	Fri, 19 Mar 2021 13:39:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id C5zA24kKseVw; Fri, 19 Mar 2021 13:39:42 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTP id C5A3F40113;
	Fri, 19 Mar 2021 13:39:42 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9B13CC0010;
	Fri, 19 Mar 2021 13:39:42 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2F8D4C0001
 for <iommu@lists.linux-foundation.org>; Fri, 19 Mar 2021 13:39:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 10A854EA77
 for <iommu@lists.linux-foundation.org>; Fri, 19 Mar 2021 13:39:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=infradead.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id m2vcYnWkfcR8 for <iommu@lists.linux-foundation.org>;
 Fri, 19 Mar 2021 13:39:39 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4BE494A43F
 for <iommu@lists.linux-foundation.org>; Fri, 19 Mar 2021 13:39:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=Zz9OTExqWnVyVHLTeY/MLahbbs3q6nG+4sXDvkfDjns=; b=vvEhNtibtwpUxVKyUI6OVRz4/A
 Qp6liY6gXAiGZ6RXI8w1adnCO4ehL0uPGPiOXmM2YUIwtBkQ0b9MTUTWpRCWH0uwIAm9EXq7cvy4r
 mFxMEk2c6slQ6OMzVB+MXjnNVRGSMn6BFkKrYGsV0SDAZ2lL5rV3jETakxml9M8sqsuAjVdmA3Ti8
 c+h7yJWkjqvnSIPcXt4ImJBOY2tfwjKcwDzX5EACj7kul3zkyWG1CAleFGisTx6qiAyY1DtRSTRfl
 RZV0Egowij7o0BeE27Gc938O0GEDrtNZ7g5MpXzWHdbeRQKSF51FK0pUD1xK5R1KzSQDrcIpM2ybr
 GSwGrIgw==;
Received: from hch by casper.infradead.org with local (Exim 4.94 #2 (Red Hat
 Linux)) id 1lNFLM-004ShW-67; Fri, 19 Mar 2021 13:39:16 +0000
Date: Fri, 19 Mar 2021 13:39:12 +0000
From: Christoph Hellwig <hch@infradead.org>
To: Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH 1/2] iommu: Statically set module owner
Message-ID: <20210319133912.GA1063154@infradead.org>
References: <f4de29d8330981301c1935e667b507254a2691ae.1616157612.git.robin.murphy@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f4de29d8330981301c1935e667b507254a2691ae.1616157612.git.robin.murphy@arm.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
Cc: will@kernel.org, iommu@lists.linux-foundation.org,
 linux-kernel@vger.kernel.org
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

On Fri, Mar 19, 2021 at 12:52:01PM +0000, Robin Murphy wrote:
> It happens that the 3 drivers which first supported being modular are
> also ones which play games with their pgsize_bitmap, so have non-const
> iommu_ops where dynamically setting the owner manages to work out OK.
> However, it's less than ideal to force that upon all drivers which want
> to be modular - like the new sprd-iommu driver which now has a potential
> bug in that regard - so let's just statically set the module owner and
> let ops remain const wherever possible.
> 
> Signed-off-by: Robin Murphy <robin.murphy@arm.com>
> ---
> 
> This is something I hadn't got round to sending earlier, so now rebased
> onto iommu/next to accommodate the new driver :)

Ah, nice.  That __iommu_device_set_ops dance always confused me.

Reviewed-by: Christoph Hellwig <hch@lst.de>
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
