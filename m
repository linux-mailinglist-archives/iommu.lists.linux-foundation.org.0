Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 895E020F297
	for <lists.iommu@lfdr.de>; Tue, 30 Jun 2020 12:23:44 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 3550B2284C;
	Tue, 30 Jun 2020 10:23:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ngxwp+ADNrni; Tue, 30 Jun 2020 10:23:41 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id B871322836;
	Tue, 30 Jun 2020 10:23:41 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9C3BCC016E;
	Tue, 30 Jun 2020 10:23:41 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 16FC6C016E
 for <iommu@lists.linux-foundation.org>; Tue, 30 Jun 2020 10:23:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 08E3787D9D
 for <iommu@lists.linux-foundation.org>; Tue, 30 Jun 2020 10:23:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GU3ZE8nTnAAC for <iommu@lists.linux-foundation.org>;
 Tue, 30 Jun 2020 10:23:39 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from hqnvemgate24.nvidia.com (hqnvemgate24.nvidia.com
 [216.228.121.143])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 4871E87EAE
 for <iommu@lists.linux-foundation.org>; Tue, 30 Jun 2020 10:23:39 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5efb12480000>; Tue, 30 Jun 2020 03:22:00 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Tue, 30 Jun 2020 03:23:38 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Tue, 30 Jun 2020 03:23:38 -0700
Received: from [10.26.75.203] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 30 Jun
 2020 10:23:32 +0000
Subject: Re: [PATCH v7 1/3] iommu/arm-smmu: add NVIDIA implementation for dual
 ARM MMU-500 usage
To: Krishna Reddy <vdumpa@nvidia.com>, Nicolin Chen <nicoleotsuka@gmail.com>
References: <20200629022838.29628-1-vdumpa@nvidia.com>
 <20200629022838.29628-2-vdumpa@nvidia.com>
 <20200629215124.GD27967@Asurada-Nvidia>
 <BYAPR12MB2822B08564C7BD7212DCCEFEB36E0@BYAPR12MB2822.namprd12.prod.outlook.com>
From: Jon Hunter <jonathanh@nvidia.com>
Message-ID: <b353b3f0-ee7f-f777-4d38-c595bc990564@nvidia.com>
Date: Tue, 30 Jun 2020 11:23:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <BYAPR12MB2822B08564C7BD7212DCCEFEB36E0@BYAPR12MB2822.namprd12.prod.outlook.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1593512520; bh=hkVxLnq+dTBVptclOzrR1XDgzm1j91MigMWg/9IR+sc=;
 h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
 User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
 X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=jA+vkX9kGnJEYI414bhfejJlRZyrp5UzqC6J9cHezgBJHVXgkVVbxPzIw79ZCr1K2
 6NZM9rRZKisYQQmtP/17qWiYcfKSVBi1wt2agXRKs8zUczB2EJ+0Tqau/X1zH+pU+h
 9Jots5TvvQKE56CJvFZ6oEXf/L3ymPqIyvZcW86B7r4WSnl/BxaGzjl2IvNgtGRAKR
 kOCIwVbtWSDZkBqBlCNZocVhLWZI74uX19qdBLXiRr1XnzLjYF5SEp4Svosg9eWR2d
 q4bm+tZt15jQ1MldQCrAc4ibAr/k5xETp9f/+7dJd8rYOdcN36mM0s+7c/7q1KgPvr
 NXTHy46YcCPDg==
Cc: Sachin Nikam <Snikam@nvidia.com>, Mikko Perttunen <mperttunen@nvidia.com>,
 Bryan Huntsman <bhuntsman@nvidia.com>, "will@kernel.org" <will@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Pritesh Raithatha <praithatha@nvidia.com>, Timo Alho <talho@nvidia.com>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
 Nicolin Chen <nicolinc@nvidia.com>,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, Yu-Huan
 Hsu <YHsu@nvidia.com>, Thierry Reding <treding@nvidia.com>,
 "robin.murphy@arm.com" <robin.murphy@arm.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Bitan Biswas <bbiswas@nvidia.com>
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


On 29/06/2020 23:49, Krishna Reddy wrote:
>>> +     if (!nvidia_smmu->bases[0])
>>> +             nvidia_smmu->bases[0] = smmu->base;
>>> +
>>> +     return nvidia_smmu->bases[inst] + (page << smmu->pgshift); }
> 
>> Not critical -- just a nit: why not put the bases[0] in init()?
> 
> smmu->base is not available during nvidia_smmu_impl_init() call. It is set afterwards in arm-smmu.c.
> It can't be avoided without changing the devm_ioremap() and impl_init() call order in arm-smmu.c.


Why don't we move the call to devm_ioremap_resource() to before
arm_smmu_impl_init() in arm_smmu_device_probe()? From a quick look I
don't see why we cannot do this and seems better than what we are
currently doing which is quite confusing and hard to understand.

Jon


-- 
nvpublic
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
