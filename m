Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AA27211320
	for <lists.iommu@lfdr.de>; Wed,  1 Jul 2020 20:56:33 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 5271B8BC0C;
	Wed,  1 Jul 2020 18:56:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0mL0slZWZkVx; Wed,  1 Jul 2020 18:56:31 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 6A4128BC2F;
	Wed,  1 Jul 2020 18:56:31 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 51561C0733;
	Wed,  1 Jul 2020 18:56:31 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9A695C0733
 for <iommu@lists.linux-foundation.org>; Wed,  1 Jul 2020 18:56:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 5F9AD2F6A5
 for <iommu@lists.linux-foundation.org>; Wed,  1 Jul 2020 18:56:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5rIpp-dlSGna for <iommu@lists.linux-foundation.org>;
 Wed,  1 Jul 2020 18:56:28 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by silver.osuosl.org (Postfix) with ESMTP id D3FE12C808
 for <iommu@lists.linux-foundation.org>; Wed,  1 Jul 2020 18:56:27 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 27DFF1FB;
 Wed,  1 Jul 2020 11:56:27 -0700 (PDT)
Received: from [10.57.21.32] (unknown [10.57.21.32])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9501A3F68F;
 Wed,  1 Jul 2020 11:56:23 -0700 (PDT)
Subject: Re: [PATCH v8 1/3] iommu/arm-smmu: add NVIDIA implementation for dual
 ARM MMU-500 usage
To: Krishna Reddy <vdumpa@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>
References: <20200630001051.12350-1-vdumpa@nvidia.com>
 <20200630001051.12350-2-vdumpa@nvidia.com>
 <53bfa5c8-c32d-6fa3-df60-a18ab33ca1c2@nvidia.com>
 <d59b7220-168c-419f-db16-194307e11065@arm.com>
 <BYAPR12MB2822FC263456303302EF30BEB36C0@BYAPR12MB2822.namprd12.prod.outlook.com>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <9ae6b6e6-bd64-9c89-49ca-1f5785ef3f0c@arm.com>
Date: Wed, 1 Jul 2020 19:56:17 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <BYAPR12MB2822FC263456303302EF30BEB36C0@BYAPR12MB2822.namprd12.prod.outlook.com>
Content-Language: en-GB
Cc: Timo Alho <talho@nvidia.com>, Thierry Reding <treding@nvidia.com>,
 Bryan Huntsman <bhuntsman@nvidia.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
 Mikko Perttunen <mperttunen@nvidia.com>,
 "nicoleotsuka@gmail.com" <nicoleotsuka@gmail.com>,
 Sachin Nikam <Snikam@nvidia.com>, Nicolin Chen <nicolinc@nvidia.com>,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
 Yu-Huan Hsu <YHsu@nvidia.com>, Pritesh Raithatha <praithatha@nvidia.com>,
 "will@kernel.org" <will@kernel.org>,
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

On 2020-07-01 19:18, Krishna Reddy wrote:
>>> + * When Linux kernel supports multiple SMMU devices, the SMMU
>>> device +used for + * isochornous HW devices should be added as a
>>> separate ARM MMU-500 +device + * in DT and be programmed
>>> independently for efficient TLB invalidates.
> 
>> I don't understand the "When" there - the driver has always
>> supported multiple independent SMMUs, and it's not something that
>> could be configured out or otherwise disabled. Plus I really don't
>> see why you would ever want to force unrelated SMMUs to be
>> >programmed together - beyond the TLB thing mentioned it would also
>> waste precious context bank resources and might lead to weird
>> device grouping via false stream ID aliasing, with no obvious
>> upside at all.
> 
> Sorry, I missed this comment. During the initial patches, when the
> iommu_ops were different between, support multiple SMMU drivers at
> the same is not possible as one of them(that gets probed last)
> overwrites the platform bus ops. On revisiting the original issue,
> This problem is no longer relevant. At this point, It makes more
> sense to just get rid of 3rd instance programming in
> arm-smmu-nvidia.c and just limit it to the SMMU instances that need
> identical programming.

Yeah, I realised later last night that this probably originated from 
forking the whole driver downstream. But even then you could have 
treated the other one as a separate nsmmu with a single instance ;)

Since it does add a bit of confusion to the code and comments, let's 
just keep things simple. I do like Jon's suggestion of actually 
enforcing that the number of "reg" regions exactly matches the number 
expected for the given compatible - I guess for now that means just 
hard-coding 2 and hoping the hardware folks don't cook up any more of 
these...

Robin.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
