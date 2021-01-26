Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id EA12C303883
	for <lists.iommu@lfdr.de>; Tue, 26 Jan 2021 10:00:50 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 9BBF920396;
	Tue, 26 Jan 2021 09:00:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dzu4CPo4oSJA; Tue, 26 Jan 2021 09:00:47 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 99AD31FE32;
	Tue, 26 Jan 2021 09:00:47 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7C18BC013A;
	Tue, 26 Jan 2021 09:00:47 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 38F3AC013A
 for <iommu@lists.linux-foundation.org>; Tue, 26 Jan 2021 09:00:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 2F63285118
 for <iommu@lists.linux-foundation.org>; Tue, 26 Jan 2021 09:00:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id frNfqD3xlVDu for <iommu@lists.linux-foundation.org>;
 Tue, 26 Jan 2021 09:00:43 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id A915A84AA7
 for <iommu@lists.linux-foundation.org>; Tue, 26 Jan 2021 09:00:42 +0000 (UTC)
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4DQ0zL3bJpz15yjp;
 Tue, 26 Jan 2021 16:59:26 +0800 (CST)
Received: from [127.0.0.1] (10.40.188.87) by DGGEMS402-HUB.china.huawei.com
 (10.3.19.202) with Microsoft SMTP Server id 14.3.498.0; Tue, 26 Jan 2021
 17:00:30 +0800
Subject: Re: [RFC PATCH v2] uacce: Add uacce_ctrl misc device
To: Jason Gunthorpe <jgg@ziepe.ca>
References: <1611563696-235269-1-git-send-email-wangzhou1@hisilicon.com>
 <20210125154717.GW4605@ziepe.ca>
From: Zhou Wang <wangzhou1@hisilicon.com>
Message-ID: <c20b0894-dd04-cf67-0975-7219f95bcaae@hisilicon.com>
Date: Tue, 26 Jan 2021 17:00:31 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.7.1
MIME-Version: 1.0
In-Reply-To: <20210125154717.GW4605@ziepe.ca>
X-Originating-IP: [10.40.188.87]
X-CFilter-Loop: Reflected
Cc: Sihang Chen <chensihang1@hisilicon.com>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, iommu@lists.linux-foundation.org,
 Zhangfei Gao <zhangfei.gao@linaro.org>, liguozhu@hisilicon.com,
 linux-accelerators@lists.ozlabs.org
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

On 2021/1/25 23:47, Jason Gunthorpe wrote:
> On Mon, Jan 25, 2021 at 04:34:56PM +0800, Zhou Wang wrote:
> 
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
> 
> This needs to copy the RLIMIT_MEMLOCK and can_do_mlock() stuff from
> other places, like ib_umem_get

I am confused as can_do_mlock seems to be about the limitation of mlock,
which has different meaning with pin memory?

> 
>> +	ret = xa_err(xa_store(&priv->array, p->first, p, GFP_KERNEL));
> 
> And this is really weird, I don't think it makes sense to make handles
> for DMA based on the starting VA.

Here starting VA is used as an index of pinned pages. When doing unpinning,
starting VA is used to get pinned pages, check unpinned VA/size.

But it has problem here to use xa_store here as new one will replace old one :(
Seems we can use xa_insert here, which returns -EBUSY if the entry at one
index is not empty. The design here will be that we only support to pin same
VA once.

> 
>> +static int uacce_unpin_page(struct uacce_pin_container *priv,
>> +			    struct uacce_pin_address *addr)
>> +{
>> +	unsigned long first, last, nr_pages;
>> +	struct pin_pages *p;
>> +
>> +	first = (addr->addr & PAGE_MASK) >> PAGE_SHIFT;
>> +	last = ((addr->addr + addr->size - 1) & PAGE_MASK) >> PAGE_SHIFT;
>> +	nr_pages = last - first + 1;
>> +
>> +	/* find pin_pages */
>> +	p = xa_load(&priv->array, first);
>> +	if (!p)
>> +		return -ENODEV;
>> +
>> +	if (p->nr_pages != nr_pages)
>> +		return -EINVAL;
>> +
>> +	/* unpin */
>> +	unpin_user_pages(p->pages, p->nr_pages);
> 
> And unpinning without guaranteeing there is no ongoing DMA is really
> weird
> 
> Are you abusing this in conjunction with a SVA scheme just to prevent
> page motion? Why wasn't mlock good enough?

Just as Barry said, mlock can not avoid IOPF from page migration.

Best,
Zhou

> 
> Jason
> 
> .
> 

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
