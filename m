Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id C4220302517
	for <lists.iommu@lfdr.de>; Mon, 25 Jan 2021 13:48:17 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 7E7CF86B79;
	Mon, 25 Jan 2021 12:48:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Q3uZR8Mx+cly; Mon, 25 Jan 2021 12:48:15 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 3EC6B8699B;
	Mon, 25 Jan 2021 12:48:15 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 190FCC013A;
	Mon, 25 Jan 2021 12:48:15 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 55B4CC013A
 for <iommu@lists.linux-foundation.org>; Mon, 25 Jan 2021 12:48:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 47A6A20441
 for <iommu@lists.linux-foundation.org>; Mon, 25 Jan 2021 12:48:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yycYJLeWFHx4 for <iommu@lists.linux-foundation.org>;
 Mon, 25 Jan 2021 12:48:11 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
 by silver.osuosl.org (Postfix) with ESMTPS id 26732203BF
 for <iommu@lists.linux-foundation.org>; Mon, 25 Jan 2021 12:48:05 +0000 (UTC)
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4DPV496csnz15yFb;
 Mon, 25 Jan 2021 20:46:49 +0800 (CST)
Received: from [127.0.0.1] (10.40.188.87) by DGGEMS405-HUB.china.huawei.com
 (10.3.19.205) with Microsoft SMTP Server id 14.3.498.0; Mon, 25 Jan 2021
 20:47:52 +0800
Subject: Re: [RFC PATCH v2] uacce: Add uacce_ctrl misc device
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <1611563696-235269-1-git-send-email-wangzhou1@hisilicon.com>
 <YA6PWSs8dxsHEpY+@kroah.com>
From: Zhou Wang <wangzhou1@hisilicon.com>
Message-ID: <8e49eaf8-64d3-c25a-9e65-5461a1af7941@hisilicon.com>
Date: Mon, 25 Jan 2021 20:47:52 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.7.1
MIME-Version: 1.0
In-Reply-To: <YA6PWSs8dxsHEpY+@kroah.com>
X-Originating-IP: [10.40.188.87]
X-CFilter-Loop: Reflected
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

On 2021/1/25 17:28, Greg Kroah-Hartman wrote:
> On Mon, Jan 25, 2021 at 04:34:56PM +0800, Zhou Wang wrote:
>> +static int uacce_pin_page(struct uacce_pin_container *priv,
>> +			  struct uacce_pin_address *addr)
>> +{
>> +	unsigned int flags = FOLL_FORCE | FOLL_WRITE;
>> +	unsigned long first, last, nr_pages;
>> +	struct page **pages;
>> +	struct pin_pages *p;
>> +	int ret;
>> +
>> +	first = (addr->addr & PAGE_MASK) >> PAGE_SHIFT;
>> +	last = ((addr->addr + addr->size - 1) & PAGE_MASK) >> PAGE_SHIFT;
>> +	nr_pages = last - first + 1;
>> +
>> +	pages = vmalloc(nr_pages * sizeof(struct page *));
>> +	if (!pages)
>> +		return -ENOMEM;
>> +
>> +	p = kzalloc(sizeof(*p), GFP_KERNEL);
>> +	if (!p) {
>> +		ret = -ENOMEM;
>> +		goto free;
>> +	}
>> +
>> +	ret = pin_user_pages_fast(addr->addr & PAGE_MASK, nr_pages,
>> +				  flags | FOLL_LONGTERM, pages);
>> +	if (ret != nr_pages) {
>> +		pr_err("uacce: Failed to pin page\n");
>> +		goto free_p;
>> +	}
>> +	p->first = first;
>> +	p->nr_pages = nr_pages;
>> +	p->pages = pages;
>> +
>> +	ret = xa_err(xa_store(&priv->array, p->first, p, GFP_KERNEL));
>> +	if (ret)
>> +		goto unpin_pages;
>> +
>> +	return 0;
>> +
>> +unpin_pages:
>> +	unpin_user_pages(pages, nr_pages);
>> +free_p:
>> +	kfree(p);
>> +free:
>> +	vfree(pages);
>> +	return ret;
>> +}
> 
> No error checking on the memory locations or size of memory to be
> 'pinned', what could ever go wrong?

These problems has been considered if I understand it right.

I have checked pin_user_pages_fast, it checks memory location by access_ok.
For the size of memory to pin, we added a limitation, like limiting pin
page size to 1GB, however, it has been removed in the post patch. The
reason is the permission of /dev/uacce_ctrl is 600 root:root, /dev/uacce_ctrl
has to been added to trusted groups by root to be used.

> 
> Note, this opens a huge hole in the kernel that needs to be documented
> really really really well somewhere, as it can cause very strange
> results if you do not know exactly what you are doing, which is why I am
> going to require that the mm developers sign off on this type of thing.
> 
> And to give more context, I really don't think this is needed, but if it

Maybe I do not explain the problem clearly. Let us see it again.

From the view of functionality, pin page is no needed at all, however,
from the view of performance, we need make DMA physical pages fixed as
the latency of IO page fault currently is relatively high, for example
for ARM SMMUv3 IO page fault, it will be at least 20us+. When a DMA
transaction triggers a IO page fault, the performance will be bad. See
from a long term, the DMA performance will be not stable.

Here we use pinned pages to create a memory pool in user space, users'
lib/app can use the memory in above pinned pages based memory pool to
avoid IO page fault.

Best,
Zhou

> is, it should be a new syscall, not buried in an ioctl for a random
> misc driver, but the author seems to want it tied to this specific
> driver...
> 
> thanks,
> 
> greg k-h
> 
> .
> 

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
