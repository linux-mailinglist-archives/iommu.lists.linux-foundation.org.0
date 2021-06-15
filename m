Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 35B433A8845
	for <lists.iommu@lfdr.de>; Tue, 15 Jun 2021 20:08:48 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B6FE84018E;
	Tue, 15 Jun 2021 18:08:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7H0rrlDtaSDH; Tue, 15 Jun 2021 18:08:45 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id BCC52400F3;
	Tue, 15 Jun 2021 18:08:45 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8DAE2C0022;
	Tue, 15 Jun 2021 18:08:45 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E68E1C000B
 for <iommu@lists.linux-foundation.org>; Tue, 15 Jun 2021 18:08:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D578283521
 for <iommu@lists.linux-foundation.org>; Tue, 15 Jun 2021 18:08:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AN0tvcbiNAzJ for <iommu@lists.linux-foundation.org>;
 Tue, 15 Jun 2021 18:08:42 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by smtp1.osuosl.org (Postfix) with ESMTP id A1D8B834C7
 for <iommu@lists.linux-foundation.org>; Tue, 15 Jun 2021 18:08:42 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CCFD4ED1;
 Tue, 15 Jun 2021 11:08:41 -0700 (PDT)
Received: from [10.57.9.136] (unknown [10.57.9.136])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6A32B3F694;
 Tue, 15 Jun 2021 11:08:40 -0700 (PDT)
Subject: Re: [PATCH v3 3/9] iommu/arm-smmu: Implement ->probe_finalize()
To: Marek Szyprowski <m.szyprowski@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>, Will Deacon <will@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
References: <20210603164632.1000458-1-thierry.reding@gmail.com>
 <20210603164632.1000458-4-thierry.reding@gmail.com>
 <CGME20210615180133eucas1p2563c2a173eca1fb5a1c5ccf654c23778@eucas1p2.samsung.com>
 <46e65ade-49cb-5437-5863-1f11ccc2205e@samsung.com>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <b070bca8-f8e8-8f58-5b3c-2b587e93d9e5@arm.com>
Date: Tue, 15 Jun 2021 19:08:34 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <46e65ade-49cb-5437-5863-1f11ccc2205e@samsung.com>
Content-Language: en-GB
Cc: linux-tegra@vger.kernel.org, iommu@lists.linux-foundation.org,
 Nicolin Chen <nicolinc@nvidia.com>, linux-arm-kernel@lists.infradead.org,
 Jon Hunter <jonathanh@nvidia.com>
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

On 2021-06-15 19:01, Marek Szyprowski wrote:
> Hi,
> 
> On 03.06.2021 18:46, Thierry Reding wrote:
>> From: Thierry Reding <treding@nvidia.com>
>>
>> Implement a ->probe_finalize() callback that can be used by vendor
>> implementations to perform extra programming necessary after devices
>> have been attached to the SMMU.
>>
>> Signed-off-by: Thierry Reding <treding@nvidia.com>
> 
> This patch landed recently in linux-next as commit 0d97174aeadf
> ("iommu/arm-smmu: Implement ->probe_finalize()"). It causes the
> following issue on ARM Juno R1 board:

[...]

>> +static void arm_smmu_probe_finalize(struct device *dev)
>> +{
>> +	struct arm_smmu_master_cfg *cfg;
>> +	struct arm_smmu_device *smmu;
>> +
>> +	cfg = dev_iommu_priv_get(dev);
>> +	smmu = cfg->smmu;
>> +
>> +	if (smmu->impl->probe_finalize)

Oops, indeed that needs to check smmu->impl first.

Robin.

>> +		smmu->impl->probe_finalize(smmu, dev);
>> +}
>> +
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
