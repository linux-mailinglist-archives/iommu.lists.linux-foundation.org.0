Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 306331A22D1
	for <lists.iommu@lfdr.de>; Wed,  8 Apr 2020 15:18:40 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id C2CD9203D2;
	Wed,  8 Apr 2020 13:18:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id G646bYUiJGA0; Wed,  8 Apr 2020 13:18:36 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 0A548203A6;
	Wed,  8 Apr 2020 13:18:36 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E6AB8C0177;
	Wed,  8 Apr 2020 13:18:35 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2D712C0177
 for <iommu@lists.linux-foundation.org>; Wed,  8 Apr 2020 13:18:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 2157E203D0
 for <iommu@lists.linux-foundation.org>; Wed,  8 Apr 2020 13:18:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cJF5DS6je5u3 for <iommu@lists.linux-foundation.org>;
 Wed,  8 Apr 2020 13:18:29 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail3-167.sinamail.sina.com.cn (mail3-167.sinamail.sina.com.cn
 [202.108.3.167])
 by silver.osuosl.org (Postfix) with SMTP id 294E2203A6
 for <iommu@lists.linux-foundation.org>; Wed,  8 Apr 2020 13:18:27 +0000 (UTC)
Received: from unknown (HELO localhost.localdomain)([114.246.227.120])
 by sina.com with ESMTP
 id 5E8DCEF90001B142; Wed, 8 Apr 2020 21:17:47 +0800 (CST)
X-Sender: hdanton@sina.com
X-Auth-ID: hdanton@sina.com
X-SMAIL-MID: 228695628785
From: Hillf Danton <hdanton@sina.com>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 04/28] dma-mapping: use vmap insted of reimplementing it
Date: Wed,  8 Apr 2020 21:17:36 +0800
Message-Id: <20200408131736.9532-1-hdanton@sina.com>
In-Reply-To: <20200408115926.1467567-1-hch@lst.de>
References: <20200408115926.1467567-1-hch@lst.de>
MIME-Version: 1.0
Cc: linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>,
 iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org
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


On Wed,  8 Apr 2020 13:59:02 +0200 Christoph Hellwig wrote:
>  
> @@ -62,24 +42,20 @@ void *dma_common_pages_remap(struct page **pages, size_t size,
>  void *dma_common_contiguous_remap(struct page *page, size_t size,
>  			pgprot_t prot, const void *caller)
>  {
> -	int i;
> +	int count = size >> PAGE_SHIFT;
>  	struct page **pages;
> -	struct vm_struct *area;
> +	void *vaddr;
> +	int i;
>  
> -	pages = kmalloc(sizeof(struct page *) << get_order(size), GFP_KERNEL);
> +	pages = kmalloc_array(count, sizeof(struct page *), GFP_KERNEL);

Is it making sense to vmalloc pages as long as array size is bigger than
PAGE_SIZE?

>  	if (!pages)
>  		return NULL;
> -
> -	for (i = 0; i < (size >> PAGE_SHIFT); i++)
> +	for (i = 0; i < count; i++)
>  		pages[i] = nth_page(page, i);
> -
> -	area = __dma_common_pages_remap(pages, size, prot, caller);
> -
> +	vaddr = vmap(pages, count, VM_DMA_COHERENT, prot);
>  	kfree(pages);
>  
> -	if (!area)
> -		return NULL;
> -	return area->addr;
> +	return vaddr;
>  }

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
