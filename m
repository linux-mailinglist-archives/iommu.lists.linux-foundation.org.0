Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D2FA35247E
	for <lists.iommu@lfdr.de>; Fri,  2 Apr 2021 02:35:48 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 05A384017B;
	Fri,  2 Apr 2021 00:35:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WD4Ky5MlA3Qn; Fri,  2 Apr 2021 00:35:46 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTP id 32DC8405FC;
	Fri,  2 Apr 2021 00:35:46 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 14729C000A;
	Fri,  2 Apr 2021 00:35:46 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0F287C000A
 for <iommu@lists.linux-foundation.org>; Fri,  2 Apr 2021 00:35:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EA4F484BF0
 for <iommu@lists.linux-foundation.org>; Fri,  2 Apr 2021 00:35:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hBTJXWTW2fsa for <iommu@lists.linux-foundation.org>;
 Fri,  2 Apr 2021 00:35:43 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4B66584BEF
 for <iommu@lists.linux-foundation.org>; Fri,  2 Apr 2021 00:35:42 +0000 (UTC)
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4FBLd75H6vzwR1g;
 Fri,  2 Apr 2021 08:33:31 +0800 (CST)
Received: from [10.174.178.147] (10.174.178.147) by
 DGGEMS413-HUB.china.huawei.com (10.3.19.213) with Microsoft SMTP Server id
 14.3.498.0; Fri, 2 Apr 2021 08:35:30 +0800
Subject: Re: [PATCH v14 02/10] iommu/arm-smmu-v3: Use device properties for
 pasid-num-bits
To: Jean-Philippe Brucker <jean-philippe@linaro.org>, <joro@8bytes.org>,
 <will@kernel.org>
References: <20210401154718.307519-1-jean-philippe@linaro.org>
 <20210401154718.307519-3-jean-philippe@linaro.org>
From: Hanjun Guo <guohanjun@huawei.com>
Message-ID: <5e0037ea-7c1a-ecbd-e5db-89050679650e@huawei.com>
Date: Fri, 2 Apr 2021 08:35:29 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20210401154718.307519-3-jean-philippe@linaro.org>
Content-Language: en-GB
X-Originating-IP: [10.174.178.147]
X-CFilter-Loop: Reflected
Cc: vivek.gautam@arm.com, linux-acpi@vger.kernel.org, zhangfei.gao@linaro.org,
 lenb@kernel.org, devicetree@vger.kernel.org, kevin.tian@intel.com,
 robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org, rjw@rjwysocki.net,
 iommu@lists.linux-foundation.org, sudeep.holla@arm.com, robin.murphy@arm.com,
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

On 2021/4/1 23:47, Jean-Philippe Brucker wrote:
> The pasid-num-bits property shouldn't need a dedicated fwspec field,
> it's a job for device properties. Add properties for IORT, and access
> the number of PASID bits using device_property_read_u32().
> 
> Suggested-by: Robin Murphy<robin.murphy@arm.com>
> Acked-by: Jonathan Cameron<Jonathan.Cameron@huawei.com>
> Acked-by: Will Deacon<will@kernel.org>
> Reviewed-by: Eric Auger<eric.auger@redhat.com>
> Signed-off-by: Jean-Philippe Brucker<jean-philippe@linaro.org>
> ---
>   include/linux/iommu.h                       |  2 --
>   drivers/acpi/arm64/iort.c                   | 13 +++++++------

Acked-by: Hanjun Guo <guohanjun@huawei.com>
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
