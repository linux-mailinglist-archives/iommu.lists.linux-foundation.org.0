Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C7DF3AE952
	for <lists.iommu@lfdr.de>; Mon, 21 Jun 2021 14:44:04 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CE1E54017D;
	Mon, 21 Jun 2021 12:44:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4AmsAMDN1uMz; Mon, 21 Jun 2021 12:44:02 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id F01E040173;
	Mon, 21 Jun 2021 12:44:01 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BC155C000C;
	Mon, 21 Jun 2021 12:44:01 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 139A3C000C
 for <iommu@lists.linux-foundation.org>; Mon, 21 Jun 2021 12:44:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E0CAD4017D
 for <iommu@lists.linux-foundation.org>; Mon, 21 Jun 2021 12:43:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sewtY1r3WRLV for <iommu@lists.linux-foundation.org>;
 Mon, 21 Jun 2021 12:43:58 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com
 [185.176.79.56])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CA3A940173
 for <iommu@lists.linux-foundation.org>; Mon, 21 Jun 2021 12:43:58 +0000 (UTC)
Received: from fraeml702-chm.china.huawei.com (unknown [172.18.147.207])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4G7plY3SyGz6H8Bq;
 Mon, 21 Jun 2021 20:30:33 +0800 (CST)
Received: from lhreml724-chm.china.huawei.com (10.201.108.75) by
 fraeml702-chm.china.huawei.com (10.206.15.51) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.2; Mon, 21 Jun 2021 14:43:55 +0200
Received: from [10.47.93.67] (10.47.93.67) by lhreml724-chm.china.huawei.com
 (10.201.108.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2; Mon, 21 Jun
 2021 13:43:54 +0100
Subject: Re: [PATCH v4 2/7] iommu/amd: Do not use flush-queue when NpCache is
 on
To: Nadav Amit <nadav.amit@gmail.com>, Joerg Roedel <joro@8bytes.org>
References: <20210616100500.174507-1-namit@vmware.com>
 <20210616100500.174507-3-namit@vmware.com>
From: John Garry <john.garry@huawei.com>
Message-ID: <91ea2a97-2db6-3e10-9c2e-80f6a4e0f733@huawei.com>
Date: Mon, 21 Jun 2021 13:37:29 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.2
MIME-Version: 1.0
In-Reply-To: <20210616100500.174507-3-namit@vmware.com>
Content-Language: en-US
X-Originating-IP: [10.47.93.67]
X-ClientProxiedBy: lhreml747-chm.china.huawei.com (10.201.108.197) To
 lhreml724-chm.china.huawei.com (10.201.108.75)
X-CFilter-Loop: Reflected
Cc: Will Deacon <will@kernel.org>, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, Nadav Amit <namit@vmware.com>,
 Jiajun Cao <caojiajun@vmware.com>, Robin Murphy <robin.murphy@arm.com>
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

On 16/06/2021 11:04, Nadav Amit wrote:
> -	if (iommu->cap & (1UL << IOMMU_CAP_NPCACHE))
> +	if (iommu->cap & (1UL << IOMMU_CAP_NPCACHE)) {
> +		if (!amd_iommu_unmap_flush)
> +			pr_warn("IOMMU batching is disabled due to virtualization");

This is missing the '\n', like the Intel driver.

And, JFYI, we are also downgrading that same print to info level (in the 
Intel driver).

Thanks,
John

> +
>   		amd_iommu_np_cache = true;
> +		amd_iommu_unmap_flush = true;

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
