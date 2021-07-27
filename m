Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AFC03D7145
	for <lists.iommu@lfdr.de>; Tue, 27 Jul 2021 10:33:03 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AA263404DE;
	Tue, 27 Jul 2021 08:33:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BqR5RKd9JfSB; Tue, 27 Jul 2021 08:33:00 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id A1087404C2;
	Tue, 27 Jul 2021 08:33:00 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5E406C000E;
	Tue, 27 Jul 2021 08:33:00 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C5BBAC000E
 for <iommu@lists.linux-foundation.org>; Tue, 27 Jul 2021 08:32:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A0BA6404DF
 for <iommu@lists.linux-foundation.org>; Tue, 27 Jul 2021 08:32:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WNjYDu22kTlo for <iommu@lists.linux-foundation.org>;
 Tue, 27 Jul 2021 08:32:57 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7B945404DE
 for <iommu@lists.linux-foundation.org>; Tue, 27 Jul 2021 08:32:57 +0000 (UTC)
Received: from dggemv711-chm.china.huawei.com (unknown [172.30.72.54])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4GYqdt663Lz1CNvq;
 Tue, 27 Jul 2021 16:26:58 +0800 (CST)
Received: from dggpemm500002.china.huawei.com (7.185.36.229) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Tue, 27 Jul 2021 16:32:52 +0800
Received: from [10.174.178.247] (10.174.178.247) by
 dggpemm500002.china.huawei.com (7.185.36.229) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Tue, 27 Jul 2021 16:32:51 +0800
Subject: Re: [PATCH v6 0/9] ACPI/IORT: Support for IORT RMR node
To: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-acpi@vger.kernel.org>,
 <iommu@lists.linux-foundation.org>
References: <20210716083442.1708-1-shameerali.kolothum.thodi@huawei.com>
From: Hanjun Guo <guohanjun@huawei.com>
Message-ID: <fb7a2f1a-faf4-8d0c-bf1a-31cade789f12@huawei.com>
Date: Tue, 27 Jul 2021 16:32:51 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20210716083442.1708-1-shameerali.kolothum.thodi@huawei.com>
Content-Language: en-GB
X-Originating-IP: [10.174.178.247]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggpemm500002.china.huawei.com (7.185.36.229)
X-CFilter-Loop: Reflected
Cc: jon@solid-run.com, linuxarm@huawei.com, steven.price@arm.com,
 yangyicong@huawei.com, Sami.Mujawar@arm.com, robin.murphy@arm.com,
 wanghuiqiang@huawei.com
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

On 2021/7/16 16:34, Shameer Kolothum wrote:
> Hi,
> 
> Major Changes from v5:
> - Addressed comments from Robin & Lorenzo.
>    : Moved iort_parse_rmr() to acpi_iort_init() from
>      iort_init_platform_devices().
>    : Removed use of struct iort_rmr_entry during the initial
>      parse. Using struct iommu_resv_region instead.
>    : Report RMR address alignment and overlap errors, but continue.
>    : Reworked arm_smmu_init_bypass_stes() (patch # 6).
> - Updated SMMUv2 bypass SMR code. Thanks to Jon N (patch #8).
> - Set IOMMU protection flags(IOMMU_CACHE, IOMMU_MMIO) based
>    on Type of RMR region. Suggested by Jon N.

I use the updated firmware from Huiqiang(Cced), tested on
my Kunpeng 920 server, the 3408iMRraid and 3416iMRraid can
work as expected with SMMUv3 enabled.

Tested-by: Hanjun Guo <guohanjun@huawei.com>
Tested-by: Huiqiang Wang <wanghuiqiang@huawei.com>

Thanks
Hanjun
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
