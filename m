Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 35E3C2D9D0
	for <lists.iommu@lfdr.de>; Wed, 29 May 2019 12:00:21 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 3A3F224B0;
	Wed, 29 May 2019 10:00:19 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 3B84923E3
	for <iommu@lists.linux-foundation.org>;
	Wed, 29 May 2019 09:57:41 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from prv1-mh.provo.novell.com (prv1-mh.provo.novell.com
	[137.65.248.33])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id C99C96C5
	for <iommu@lists.linux-foundation.org>;
	Wed, 29 May 2019 09:57:40 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
	with Novell_GroupWise; Wed, 29 May 2019 03:57:40 -0600
Message-Id: <5CEE57910200007800233571@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.1 
Date: Wed, 29 May 2019 03:57:37 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Juergen Gross" <jgross@suse.com>
Subject: Re: [Xen-devel] [PATCH v2 3/3] xen/swiotlb: remember having
	called xen_create_contiguous_region()
References: <20190529090407.1225-1-jgross@suse.com>
	<20190529090407.1225-4-jgross@suse.com>
In-Reply-To: <20190529090407.1225-4-jgross@suse.com>
Mime-Version: 1.0
Content-Disposition: inline
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
	xen-devel <xen-devel@lists.xenproject.org>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>
X-BeenThere: iommu@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
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
Sender: iommu-bounces@lists.linux-foundation.org
Errors-To: iommu-bounces@lists.linux-foundation.org

>>> On 29.05.19 at 11:04, <jgross@suse.com> wrote:
> @@ -345,8 +346,11 @@ xen_swiotlb_free_coherent(struct device *hwdev, size_t size, void *vaddr,
>  	size = 1UL << (order + XEN_PAGE_SHIFT);
>  
>  	if (!WARN_ON((dev_addr + size - 1 > dma_mask) ||
> -		     range_straddles_page_boundary(phys, size)))
> +		     range_straddles_page_boundary(phys, size)) &&
> +	    PageXenRemapped(virt_to_page(vaddr))) {
>  		xen_destroy_contiguous_region(phys, order);
> +		ClearPageXenRemapped(virt_to_page(vaddr));
> +	}

To be symmetric with setting the flag only after having made the region
contiguous, and to avoid (perhaps just theoretical) races, wouldn't it be
better to clear the flag before calling xen_destroy_contiguous_region()?
Even better would be a TestAndClear...() operation.

Jan


_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
