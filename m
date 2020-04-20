Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id ADBA61B03E9
	for <lists.iommu@lfdr.de>; Mon, 20 Apr 2020 10:10:48 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 5591D20656;
	Mon, 20 Apr 2020 08:10:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZHw5Y2iFPftE; Mon, 20 Apr 2020 08:10:46 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 585FF20535;
	Mon, 20 Apr 2020 08:10:46 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 36473C0177;
	Mon, 20 Apr 2020 08:10:46 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A5DA3C0177
 for <iommu@lists.linux-foundation.org>; Mon, 20 Apr 2020 08:10:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id A016085B2F
 for <iommu@lists.linux-foundation.org>; Mon, 20 Apr 2020 08:10:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dgoLRUZzBZzj for <iommu@lists.linux-foundation.org>;
 Mon, 20 Apr 2020 08:10:39 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 416DE81A16
 for <iommu@lists.linux-foundation.org>; Mon, 20 Apr 2020 08:10:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=C1JU5+id39RVYYiwVLrKINx5vf4t7nToazXLCIKWefE=; b=kaM0tk5W81sI2+qX4Q+fhFqknM
 bURUCNk0t2z/tH3hUWbh5Ya9slhk5rLszSWU71wkyFyy7q2Tqtylx0B1qa4oBZPhzl1Pzd0n9iYI8
 U7EmgJ8u5DWdLj8f4XGdJLn1gEer0ExVNct3iwrHWd6KEFcS/i5dzVd1+giEP2fKM0YZ5nI94pJGU
 bLc0GipQGkEljB04yFayRugJ2xmfUknk0m5ohkt5kM/71a59PYsDPRLMCziNvX2mPRoqrCALoAuOB
 x+Diqoon7jrr1Snwm2VWR5aH9n2Hpqx5jH6fbbjyms2QLla8aBMh0zsJvsuQdVSIVR0dIm7P9QRvO
 X5rQmNQQ==;
Received: from hch by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1jQRVi-0007EB-H6; Mon, 20 Apr 2020 08:10:34 +0000
Date: Mon, 20 Apr 2020 01:10:34 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: Re: [PATCH v5 02/25] iommu/sva: Manage process address spaces
Message-ID: <20200420081034.GA17305@infradead.org>
References: <20200414170252.714402-1-jean-philippe@linaro.org>
 <20200414170252.714402-3-jean-philippe@linaro.org>
 <20200416072852.GA32000@infradead.org>
 <20200416085402.GB1286150@myrica>
 <20200416121331.GA18661@infradead.org>
 <20200420074213.GA3180232@myrica>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200420074213.GA3180232@myrica>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
Cc: devicetree@vger.kernel.org, kevin.tian@intel.com, jgg@ziepe.ca,
 linux-pci@vger.kernel.org, robin.murphy@arm.com, linux-mm@kvack.org,
 iommu@lists.linux-foundation.org, catalin.marinas@arm.com,
 zhangfei.gao@linaro.org, will@kernel.org, christian.koenig@amd.com,
 linux-arm-kernel@lists.infradead.org
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

On Mon, Apr 20, 2020 at 09:42:13AM +0200, Jean-Philippe Brucker wrote:
> Right, I can see the appeal. I still like having a single mmu notifier per
> mm because it ensures we allocate a single PASID per mm (as required by
> x86). I suppose one alternative is to maintain a hashtable of mm->pasid,
> to avoid iterating over all bonds during allocation.

Given that the PASID is a pretty generic and important concept can
we just add it directly to the mm_struct and allocate it lazily once
we first need it?
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
