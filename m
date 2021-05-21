Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id C54B038C508
	for <lists.iommu@lfdr.de>; Fri, 21 May 2021 12:36:17 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6EDBA844ED;
	Fri, 21 May 2021 10:36:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id j_AvStkxL2Z2; Fri, 21 May 2021 10:36:15 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9090984573;
	Fri, 21 May 2021 10:36:15 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5291DC001C;
	Fri, 21 May 2021 10:36:15 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 52927C0001
 for <iommu@lists.linux-foundation.org>; Fri, 21 May 2021 10:36:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4D31760DD7
 for <iommu@lists.linux-foundation.org>; Fri, 21 May 2021 10:36:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id p3vwQoptMwLm for <iommu@lists.linux-foundation.org>;
 Fri, 21 May 2021 10:36:13 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3D88960DD4
 for <iommu@lists.linux-foundation.org>; Fri, 21 May 2021 10:36:12 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F36F5101E;
 Fri, 21 May 2021 03:36:11 -0700 (PDT)
Received: from [10.57.73.64] (unknown [10.57.73.64])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DCC123F73D;
 Fri, 21 May 2021 03:36:10 -0700 (PDT)
Subject: Re: [PATCH] dma-iommu: Add a check to avoid dereference null pointer
 in function iommu_dma_map_sg()
To: chenxiang <chenxiang66@hisilicon.com>, will@kernel.org, joro@8bytes.org,
 hch@lst.de
References: <1621566334-93468-1-git-send-email-chenxiang66@hisilicon.com>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <56f7f4fa-8d62-cc6e-cb1c-adbf82e34d31@arm.com>
Date: Fri, 21 May 2021 11:36:05 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <1621566334-93468-1-git-send-email-chenxiang66@hisilicon.com>
Content-Language: en-GB
Cc: iommu@lists.linux-foundation.org, linuxarm@openeuler.org,
 linuxarm@huawei.com
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

On 2021-05-21 04:05, chenxiang wrote:
> From: Xiang Chen <chenxiang66@hisilicon.com>
> 
> The issue is reported by tool TscanCode, and it is possible to deference
> null pointer when prev is NULL which is the initial value.

No it isn't. This is literally explained in the comment visible in the 
diff context below...

Robin.

> Signed-off-by: Xiang Chen <chenxiang66@hisilicon.com>
> ---
>   drivers/iommu/dma-iommu.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/iommu/dma-iommu.c b/drivers/iommu/dma-iommu.c
> index 4cb63b2..88a4f34 100644
> --- a/drivers/iommu/dma-iommu.c
> +++ b/drivers/iommu/dma-iommu.c
> @@ -1042,7 +1042,7 @@ static int iommu_dma_map_sg(struct device *dev, struct scatterlist *sg,
>   		 *   iova_len == 0, thus we cannot dereference prev the first
>   		 *   time through here (i.e. before it has a meaningful value).
>   		 */
> -		if (pad_len && pad_len < s_length - 1) {
> +		if (prev && pad_len && pad_len < s_length - 1) {
>   			prev->length += pad_len;
>   			iova_len += pad_len;
>   		}
> 
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
