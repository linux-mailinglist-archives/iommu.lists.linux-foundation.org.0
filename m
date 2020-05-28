Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 615F91E574D
	for <lists.iommu@lfdr.de>; Thu, 28 May 2020 08:14:06 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 99F64204AD;
	Thu, 28 May 2020 06:14:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pAd9AkvRcTwp; Thu, 28 May 2020 06:14:03 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 7F9612046A;
	Thu, 28 May 2020 06:14:03 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 60050C016F;
	Thu, 28 May 2020 06:14:03 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B6455C016F
 for <iommu@lists.linux-foundation.org>; Thu, 28 May 2020 06:13:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 9F14586D7B
 for <iommu@lists.linux-foundation.org>; Thu, 28 May 2020 06:13:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PLbq7I0D3s_k for <iommu@lists.linux-foundation.org>;
 Thu, 28 May 2020 06:13:55 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 670DA86D20
 for <iommu@lists.linux-foundation.org>; Thu, 28 May 2020 06:13:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=zni0B8k5iMx2062s+cLkcal1ezBX/6+aSXESnytrVBA=; b=n6L4oCgg5qx1q88mtA0neKBlJH
 VH5WkwsKABSpxb2nXXripcejQz22sXvL/OXW6RXPrCwIl3MJy9Z0HTPAP2asJIv+VT3HxqDGr6Qtj
 Db/jZtyXSdRaq03bWrdWmluP1qui019NEK5NZkiRVdb6cNJNj85irS1+kavTyvaJ3gwBTlAAShxgF
 6jcnT1yUoRPamgODIO4mqAstUWV9KEQzTDTcyuAukl73XzsP2imQk1CtHPU8waqlwRAPN6V8CP717
 A1wABNoblFdvkivbGnODWd7/NBuXGGgYsjNhvA4Qmt3/7dasgoJfiboIkWqXJ2iSsbO87fAqkCStm
 SIyURPEA==;
Received: from hch by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1jeBnd-0007EK-9j; Thu, 28 May 2020 06:13:53 +0000
Date: Wed, 27 May 2020 23:13:53 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Joerg Roedel <joro@8bytes.org>
Subject: Re: [PATCH 02/10] iommu/amd: Unexport get_dev_data()
Message-ID: <20200528061353.GA17035@infradead.org>
References: <20200527115313.7426-1-joro@8bytes.org>
 <20200527115313.7426-3-joro@8bytes.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200527115313.7426-3-joro@8bytes.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
Cc: iommu@lists.linux-foundation.org, jroedel@suse.de,
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

On Wed, May 27, 2020 at 01:53:05PM +0200, Joerg Roedel wrote:
> From: Joerg Roedel <jroedel@suse.de>
> 
> This function is internal to the AMD IOMMU driver and only exported
> because the amd_iommu_v2 modules calls it. But the reason it is called
> from there could better be handled by amd_iommu_is_attach_deferred().
> So unexport get_dev_data() and use amd_iommu_is_attach_deferred()
> instead.

Btw, what is the reason amd_iommu_v2 is a separate module?  It is
very little code, and other drivers seem to just integrate such
functionality.

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
