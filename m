Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E4EE33A9DC
	for <lists.iommu@lfdr.de>; Mon, 15 Mar 2021 04:17:54 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1F48E82CD4;
	Mon, 15 Mar 2021 03:17:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nnXVpcIpW4PJ; Mon, 15 Mar 2021 03:17:52 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2DF0C82CCB;
	Mon, 15 Mar 2021 03:17:52 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 074ACC0012;
	Mon, 15 Mar 2021 03:17:52 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 40EAEC0001
 for <iommu@lists.linux-foundation.org>; Mon, 15 Mar 2021 03:17:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1FFE282CCB
 for <iommu@lists.linux-foundation.org>; Mon, 15 Mar 2021 03:17:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TxJi49mxGcaD for <iommu@lists.linux-foundation.org>;
 Mon, 15 Mar 2021 03:17:48 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from szxga06-in.huawei.com (szxga06-in.huawei.com [45.249.212.32])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EBD5282CB7
 for <iommu@lists.linux-foundation.org>; Mon, 15 Mar 2021 03:17:47 +0000 (UTC)
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4DzM596d3szjJZc;
 Mon, 15 Mar 2021 11:16:13 +0800 (CST)
Received: from [10.174.184.42] (10.174.184.42) by
 DGGEMS405-HUB.china.huawei.com (10.3.19.205) with Microsoft SMTP Server id
 14.3.498.0; Mon, 15 Mar 2021 11:17:42 +0800
Subject: Re: [PATCH] vfio/type1: fix vaddr_get_pfns() return in
 vfio_pin_page_external()
To: Daniel Jordan <daniel.m.jordan@oracle.com>, Alex Williamson
 <alex.williamson@redhat.com>, Cornelia Huck <cohuck@redhat.com>
References: <20210308172452.38864-1-daniel.m.jordan@oracle.com>
From: Keqian Zhu <zhukeqian1@huawei.com>
Message-ID: <5a0f3949-2643-51b2-20f9-e6b6983e223e@huawei.com>
Date: Mon, 15 Mar 2021 11:17:42 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.7.1
MIME-Version: 1.0
In-Reply-To: <20210308172452.38864-1-daniel.m.jordan@oracle.com>
X-Originating-IP: [10.174.184.42]
X-CFilter-Loop: Reflected
Cc: iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
 kvm@vger.kernel.org
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


Hi Daniel,

[+Cc iommu mail list]

This patch looks good to me. (but I don't test it too.)

Thanks,
Keqian

On 2021/3/9 1:24, Daniel Jordan wrote:
> vaddr_get_pfns() now returns the positive number of pfns successfully
> gotten instead of zero.  vfio_pin_page_external() might return 1 to
> vfio_iommu_type1_pin_pages(), which will treat it as an error, if
> vaddr_get_pfns() is successful but vfio_pin_page_external() doesn't
> reach vfio_lock_acct().
> 
> Fix it up in vfio_pin_page_external().  Found by inspection.
> 
> Fixes: be16c1fd99f4 ("vfio/type1: Change success value of vaddr_get_pfn()")
> Signed-off-by: Daniel Jordan <daniel.m.jordan@oracle.com>
> ---
> 
> I couldn't test this due to lack of hardware.
> 
>  drivers/vfio/vfio_iommu_type1.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/vfio/vfio_iommu_type1.c b/drivers/vfio/vfio_iommu_type1.c
> index 4bb162c1d649..2a0e3b3ce206 100644
> --- a/drivers/vfio/vfio_iommu_type1.c
> +++ b/drivers/vfio/vfio_iommu_type1.c
> @@ -785,7 +785,12 @@ static int vfio_pin_page_external(struct vfio_dma *dma, unsigned long vaddr,
>  		return -ENODEV;
>  
>  	ret = vaddr_get_pfns(mm, vaddr, 1, dma->prot, pfn_base, pages);
> -	if (ret == 1 && do_accounting && !is_invalid_reserved_pfn(*pfn_base)) {
> +	if (ret != 1)
> +		goto out;
> +
> +	ret = 0;
> +
> +	if (do_accounting && !is_invalid_reserved_pfn(*pfn_base)) {
>  		ret = vfio_lock_acct(dma, 1, true);
>  		if (ret) {
>  			put_pfn(*pfn_base, dma->prot);
> @@ -797,6 +802,7 @@ static int vfio_pin_page_external(struct vfio_dma *dma, unsigned long vaddr,
>  		}
>  	}
>  
> +out:
>  	mmput(mm);
>  	return ret;
>  }
> 
> base-commit: 144c79ef33536b4ecb4951e07dbc1f2b7fa99d32
> 
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
