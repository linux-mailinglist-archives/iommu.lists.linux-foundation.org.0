Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 27C5217AA9C
	for <lists.iommu@lfdr.de>; Thu,  5 Mar 2020 17:36:39 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 9A8D821546;
	Thu,  5 Mar 2020 16:36:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eboab6QxjLoi; Thu,  5 Mar 2020 16:36:36 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id BD0B62152A;
	Thu,  5 Mar 2020 16:36:36 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A6E2FC1AE2;
	Thu,  5 Mar 2020 16:36:36 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 45B61C013E
 for <iommu@lists.linux-foundation.org>; Thu,  5 Mar 2020 16:36:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 4138287E45
 for <iommu@lists.linux-foundation.org>; Thu,  5 Mar 2020 16:36:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iNW5-mrfemre for <iommu@lists.linux-foundation.org>;
 Thu,  5 Mar 2020 16:36:32 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by hemlock.osuosl.org (Postfix) with ESMTPS id C28FF87E43
 for <iommu@lists.linux-foundation.org>; Thu,  5 Mar 2020 16:36:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=IN0z5lvxX3vfG4LlR2OLwyz2tFIOaeyOpNZ/LAjxDFE=; b=UJibfdPpIN84IhGGV66FPK3zNA
 yzVJpxyXzBbrmM5EvaVqPmPWHjvZR+sV4xZ14YVEOnaN8OOkCuH8q0AT4VeUlWx807tTEAH18J6Bk
 JIm5SKt7rEZQ/hDAgkoqur9CPBKLhHBF0YRspnJbyni4rW7a0oT944GJJS+12KbkBkGC1Pl5FSBJz
 Uoh08v2WTHIfTMXi9KnTDqdE1vEo42kw5RuS+Jtq9QWJOxyAF4F7VkX3oViG/23kudgEKDkxvvzmm
 Z392HeGdJZ+fM7Twz/UX0YPWV3KCG1aAU+wMcKjeXQ0m7rUdsK6NwE13/Yc86vw33q6rAJ3JLag1t
 /FLdA+0A==;
Received: from hch by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1j9tU5-0006i6-Lu; Thu, 05 Mar 2020 16:36:29 +0000
Date: Thu, 5 Mar 2020 08:36:29 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: Re: [PATCH v4 01/26] mm/mmu_notifiers: pass private data down to
 alloc_notifier()
Message-ID: <20200305163629.GA14299@infradead.org>
References: <20200224182401.353359-1-jean-philippe@linaro.org>
 <20200224182401.353359-2-jean-philippe@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200224182401.353359-2-jean-philippe@linaro.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
Cc: mark.rutland@arm.com, linux-pci@vger.kernel.org, linux-mm@kvack.org,
 will@kernel.org, Dimitri Sivanich <sivanich@sgi.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, catalin.marinas@arm.com,
 zhangfei.gao@linaro.org, devicetree@vger.kernel.org, kevin.tian@intel.com,
 Arnd Bergmann <arnd@arndb.de>, robh+dt@kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 iommu@lists.linux-foundation.org, Andrew Morton <akpm@linux-foundation.org>,
 robin.murphy@arm.com, christian.koenig@amd.com
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

On Mon, Feb 24, 2020 at 07:23:36PM +0100, Jean-Philippe Brucker wrote:
> -static struct mmu_notifier *gru_alloc_notifier(struct mm_struct *mm)
> +static struct mmu_notifier *gru_alloc_notifier(struct mm_struct *mm, void *privdata)

Pleae don't introduce any > 80 char lines.  Not here, and not anywhere
else in this patch or the series.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
