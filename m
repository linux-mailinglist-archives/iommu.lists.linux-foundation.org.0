Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 78E1A30233A
	for <lists.iommu@lfdr.de>; Mon, 25 Jan 2021 10:29:04 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 370098741C;
	Mon, 25 Jan 2021 09:29:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AyQ4FiddjBYe; Mon, 25 Jan 2021 09:29:02 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id B3ECA87415;
	Mon, 25 Jan 2021 09:29:02 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9D68BC013A;
	Mon, 25 Jan 2021 09:29:02 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id AF349C013A
 for <iommu@lists.linux-foundation.org>; Mon, 25 Jan 2021 09:29:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 9CDB887243
 for <iommu@lists.linux-foundation.org>; Mon, 25 Jan 2021 09:29:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qvTOZVVRwn06 for <iommu@lists.linux-foundation.org>;
 Mon, 25 Jan 2021 09:29:01 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 07C288701B
 for <iommu@lists.linux-foundation.org>; Mon, 25 Jan 2021 09:29:00 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id CEFAC22472;
 Mon, 25 Jan 2021 09:28:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1611566940;
 bh=wF0JYx7C+UwAIZY8ksPAuFgLqtbCeO/VruEju37N6uo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=UVmpbLLUS17+Ue9duoUlgwPZAao35PSkhItEGsD+FSck0iLnOluYZsuOCgXE0g4wP
 hnC+b2Znk45U2PhKkTOSc/4ceGhIqgsz6tRKk3YKakkpX4LC3bDpYNsNZEW3EsXbZA
 pwRl84JwfoH8fc2R3mBJb8Zj75Gsf4+nt7Qi4xSQ=
Date: Mon, 25 Jan 2021 10:28:57 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Zhou Wang <wangzhou1@hisilicon.com>
Subject: Re: [RFC PATCH v2] uacce: Add uacce_ctrl misc device
Message-ID: <YA6PWSs8dxsHEpY+@kroah.com>
References: <1611563696-235269-1-git-send-email-wangzhou1@hisilicon.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1611563696-235269-1-git-send-email-wangzhou1@hisilicon.com>
Cc: Sihang Chen <chensihang1@hisilicon.com>, Arnd Bergmann <arnd@arndb.de>,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 iommu@lists.linux-foundation.org, Zhangfei Gao <zhangfei.gao@linaro.org>,
 liguozhu@hisilicon.com, linux-accelerators@lists.ozlabs.org
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

On Mon, Jan 25, 2021 at 04:34:56PM +0800, Zhou Wang wrote:
> +static int uacce_pin_page(struct uacce_pin_container *priv,
> +			  struct uacce_pin_address *addr)
> +{
> +	unsigned int flags = FOLL_FORCE | FOLL_WRITE;
> +	unsigned long first, last, nr_pages;
> +	struct page **pages;
> +	struct pin_pages *p;
> +	int ret;
> +
> +	first = (addr->addr & PAGE_MASK) >> PAGE_SHIFT;
> +	last = ((addr->addr + addr->size - 1) & PAGE_MASK) >> PAGE_SHIFT;
> +	nr_pages = last - first + 1;
> +
> +	pages = vmalloc(nr_pages * sizeof(struct page *));
> +	if (!pages)
> +		return -ENOMEM;
> +
> +	p = kzalloc(sizeof(*p), GFP_KERNEL);
> +	if (!p) {
> +		ret = -ENOMEM;
> +		goto free;
> +	}
> +
> +	ret = pin_user_pages_fast(addr->addr & PAGE_MASK, nr_pages,
> +				  flags | FOLL_LONGTERM, pages);
> +	if (ret != nr_pages) {
> +		pr_err("uacce: Failed to pin page\n");
> +		goto free_p;
> +	}
> +	p->first = first;
> +	p->nr_pages = nr_pages;
> +	p->pages = pages;
> +
> +	ret = xa_err(xa_store(&priv->array, p->first, p, GFP_KERNEL));
> +	if (ret)
> +		goto unpin_pages;
> +
> +	return 0;
> +
> +unpin_pages:
> +	unpin_user_pages(pages, nr_pages);
> +free_p:
> +	kfree(p);
> +free:
> +	vfree(pages);
> +	return ret;
> +}

No error checking on the memory locations or size of memory to be
'pinned', what could ever go wrong?

Note, this opens a huge hole in the kernel that needs to be documented
really really really well somewhere, as it can cause very strange
results if you do not know exactly what you are doing, which is why I am
going to require that the mm developers sign off on this type of thing.

And to give more context, I really don't think this is needed, but if it
is, it should be a new syscall, not buried in an ioctl for a random
misc driver, but the author seems to want it tied to this specific
driver...

thanks,

greg k-h
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
