Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id 617903A30B5
	for <lists.iommu@lfdr.de>; Thu, 10 Jun 2021 18:31:41 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D091083DB5;
	Thu, 10 Jun 2021 16:31:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 53z4XlrGF38Z; Thu, 10 Jun 2021 16:31:39 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id F2B4A83DAA;
	Thu, 10 Jun 2021 16:31:38 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CE637C0022;
	Thu, 10 Jun 2021 16:31:38 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D6CD8C000B
 for <iommu@lists.linux-foundation.org>; Thu, 10 Jun 2021 16:31:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D13C383DAA
 for <iommu@lists.linux-foundation.org>; Thu, 10 Jun 2021 16:31:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jyaIPKTwnBBo for <iommu@lists.linux-foundation.org>;
 Thu, 10 Jun 2021 16:31:37 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com
 [185.176.79.56])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CB91083D9B
 for <iommu@lists.linux-foundation.org>; Thu, 10 Jun 2021 16:31:36 +0000 (UTC)
Received: from fraeml705-chm.china.huawei.com (unknown [172.18.147.206])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4G18Pt73ckz6H6jZ;
 Fri, 11 Jun 2021 00:22:10 +0800 (CST)
Received: from lhreml724-chm.china.huawei.com (10.201.108.75) by
 fraeml705-chm.china.huawei.com (10.206.15.54) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.2; Thu, 10 Jun 2021 18:31:33 +0200
Received: from [10.47.80.201] (10.47.80.201) by lhreml724-chm.china.huawei.com
 (10.201.108.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2; Thu, 10 Jun
 2021 17:31:32 +0100
From: John Garry <john.garry@huawei.com>
Subject: Re: [PATCH v11 0/3] Enhance IOMMU default DMA mode build options
To: Joerg Roedel <joro@8bytes.org>
References: <1623158308-180604-1-git-send-email-john.garry@huawei.com>
 <YMB4tCrkZv1b44qM@8bytes.org>
Message-ID: <4c1f02c5-fc6c-997f-19de-081efbb96566@huawei.com>
Date: Thu, 10 Jun 2021 17:25:36 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.2
MIME-Version: 1.0
In-Reply-To: <YMB4tCrkZv1b44qM@8bytes.org>
Content-Language: en-US
X-Originating-IP: [10.47.80.201]
X-ClientProxiedBy: lhreml749-chm.china.huawei.com (10.201.108.199) To
 lhreml724-chm.china.huawei.com (10.201.108.75)
X-CFilter-Loop: Reflected
Cc: will@kernel.org, rdunlap@infradead.org, linuxarm@huawei.com,
 robin.murphy@arm.com, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, dwmw2@infradead.org
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

On 09/06/2021 09:15, Joerg Roedel wrote:
> On Tue, Jun 08, 2021 at 09:18:25PM +0800, John Garry wrote:
>> Zhen Lei (3):
>>    iommu: Enhance IOMMU default DMA mode build options
>>    iommu/vt-d: Add support for IOMMU default DMA mode build options
>>    iommu/amd: Add support for IOMMU default DMA mode build options
> So I like the idea, but can we go a step further and get (mostly) rid of
> the driver-specific setup code for lazy/non-lazy mode? This can happen
> in the dma-iommu code and the drivers only need to keep the support for
> their legacy command line options.

The AMD driver just maintains a flag and a print for the strict mode 
setting.

The Intel driver still maintains some lazy vs strict config, depending 
on the platform:
- DMAR caching mode set means that we enforce strict mode globally
- workaround for ironlake gpu means that we enforce strict mode globally

So there isn't much driver-specific setup remaining, and I can't see the 
intel stuff being moved into dma-iommu.c or asbtracted (for that).

We could prob replace the driver-specific logs with new logs in iommu.c, 
and do away with maintaining the proprietary driver strict mode flags. 
That's if we're ok with replacing the driver-specific logs, though.

Thanks,
John

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
