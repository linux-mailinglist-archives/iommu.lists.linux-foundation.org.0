Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 966B83B478F
	for <lists.iommu@lfdr.de>; Fri, 25 Jun 2021 18:47:57 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4A017405A3;
	Fri, 25 Jun 2021 16:47:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1qKHOAQuw8UG; Fri, 25 Jun 2021 16:47:55 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 5D329400D2;
	Fri, 25 Jun 2021 16:47:55 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 38E59C000E;
	Fri, 25 Jun 2021 16:47:55 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 99465C000E
 for <iommu@lists.linux-foundation.org>; Fri, 25 Jun 2021 16:47:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 750D683ABA
 for <iommu@lists.linux-foundation.org>; Fri, 25 Jun 2021 16:47:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1RK_JBXYnLsr for <iommu@lists.linux-foundation.org>;
 Fri, 25 Jun 2021 16:47:51 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com
 [185.176.79.56])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 55A3C83BF4
 for <iommu@lists.linux-foundation.org>; Fri, 25 Jun 2021 16:47:51 +0000 (UTC)
Received: from fraeml703-chm.china.huawei.com (unknown [172.18.147.201])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4GBMyt5Wztz6L4vj;
 Sat, 26 Jun 2021 00:34:14 +0800 (CST)
Received: from lhreml724-chm.china.huawei.com (10.201.108.75) by
 fraeml703-chm.china.huawei.com (10.206.15.52) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.2; Fri, 25 Jun 2021 18:47:47 +0200
Received: from [10.47.26.115] (10.47.26.115) by lhreml724-chm.china.huawei.com
 (10.201.108.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2; Fri, 25 Jun
 2021 17:47:47 +0100
Subject: Re: [PATCH v14 0/6] iommu: Enhance IOMMU default DMA mode build
 options
To: "joro@8bytes.org" <joro@8bytes.org>, "will@kernel.org" <will@kernel.org>, 
 "dwmw2@infradead.org" <dwmw2@infradead.org>, "baolu.lu@linux.intel.com"
 <baolu.lu@linux.intel.com>, "robin.murphy@arm.com" <robin.murphy@arm.com>,
 "corbet@lwn.net" <corbet@lwn.net>
References: <1624016058-189713-1-git-send-email-john.garry@huawei.com>
From: John Garry <john.garry@huawei.com>
Message-ID: <1b75de8f-a2e3-6297-0f56-b2f1548495b0@huawei.com>
Date: Fri, 25 Jun 2021 17:41:09 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.2
MIME-Version: 1.0
In-Reply-To: <1624016058-189713-1-git-send-email-john.garry@huawei.com>
Content-Language: en-US
X-Originating-IP: [10.47.26.115]
X-ClientProxiedBy: lhreml723-chm.china.huawei.com (10.201.108.74) To
 lhreml724-chm.china.huawei.com (10.201.108.75)
X-CFilter-Loop: Reflected
Cc: "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Linuxarm <linuxarm@huawei.com>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>
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

On 18/06/2021 12:34, John Garry wrote:
> This is a reboot of Zhen Lei's series from a couple of years ago, which
> never made it across the line.
> 
> I still think that it has some value, so taking up the mantle.
> 
> Motivation:
> Allow lazy mode be default mode for DMA domains for all ARCHs, and not
> only those who hardcode it (to be lazy). For ARM64, currently we must use
> a kernel command line parameter to use lazy mode, which is less than
> ideal.
> 
> I have now included the print for strict/lazy mode, which I originally
> sent in:
> https://lore.kernel.org/linux-iommu/72eb3de9-1d1c-ae46-c5a9-95f26525d435@huawei.com/
> 
> There was some concern there about drivers and their custom prints
> conflicting with the print in that patch, but I think that it
> should be ok.
> 
> Based on next-20210611 + "iommu: Update "iommu.strict" documentation"

Hi Joerg, Will,

We think that this series is ready to go.

There would be a build conflict with the following:
https://lore.kernel.org/linux-iommu/20210616100500.174507-1-namit@vmware.com/

So please let us know where you stand on it, so that could be resolved.

Robin and Baolu have kindly reviewed all the patches, apart from the AMD 
one.

Thanks,
John
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
