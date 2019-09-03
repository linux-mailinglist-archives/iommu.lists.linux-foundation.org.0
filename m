Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id BFF11A618A
	for <lists.iommu@lfdr.de>; Tue,  3 Sep 2019 08:34:31 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 72720C96;
	Tue,  3 Sep 2019 06:34:30 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id D413FC8E
	for <iommu@lists.linux-foundation.org>;
	Tue,  3 Sep 2019 06:34:28 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from huawei.com (szxga07-in.huawei.com [45.249.212.35])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 549B6709
	for <iommu@lists.linux-foundation.org>;
	Tue,  3 Sep 2019 06:34:28 +0000 (UTC)
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.58])
	by Forcepoint Email with ESMTP id 44FED515EAFCE51C88B3;
	Tue,  3 Sep 2019 14:34:26 +0800 (CST)
Received: from [127.0.0.1] (10.133.213.239) by DGGEMS404-HUB.china.huawei.com
	(10.3.19.204) with Microsoft SMTP Server id 14.3.439.0;
	Tue, 3 Sep 2019 14:34:22 +0800
Subject: Re: [PATCH -next] iommu/arm-smmu-v3: Fix build error without
	CONFIG_PCI_ATS
To: Will Deacon <will@kernel.org>
References: <20190903024212.20300-1-yuehaibing@huawei.com>
	<20190903063028.6ryuk5dmaohi2fqa@willie-the-truck>
From: Yuehaibing <yuehaibing@huawei.com>
Message-ID: <e246593a-e518-2d79-c89e-5191d28e9e34@huawei.com>
Date: Tue, 3 Sep 2019 14:34:21 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <20190903063028.6ryuk5dmaohi2fqa@willie-the-truck>
X-Originating-IP: [10.133.213.239]
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: robin.murphy@arm.com, iommu@lists.linux-foundation.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
X-BeenThere: iommu@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
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
Sender: iommu-bounces@lists.linux-foundation.org
Errors-To: iommu-bounces@lists.linux-foundation.org

On 2019/9/3 14:30, Will Deacon wrote:
> On Tue, Sep 03, 2019 at 10:42:12AM +0800, YueHaibing wrote:
>> If CONFIG_PCI_ATS is not set, building fails:
>>
>> drivers/iommu/arm-smmu-v3.c: In function arm_smmu_ats_supported:
>> drivers/iommu/arm-smmu-v3.c:2325:35: error: struct pci_dev has no member named ats_cap; did you mean msi_cap?
>>   return !pdev->untrusted && pdev->ats_cap;
>>                                    ^~~~~~~
>>
>> ats_cap should only used when CONFIG_PCI_ATS is defined,
>> so use #ifdef block to guard this.
>>
>> Fixes: bfff88ec1afe ("iommu/arm-smmu-v3: Rework enabling/disabling of ATS for PCI masters")
>> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
>> ---
>>  drivers/iommu/arm-smmu-v3.c | 4 +++-
>>  1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/iommu/arm-smmu-v3.c b/drivers/iommu/arm-smmu-v3.c
>> index 66bf641..44ac9ac 100644
>> --- a/drivers/iommu/arm-smmu-v3.c
>> +++ b/drivers/iommu/arm-smmu-v3.c
>> @@ -2313,7 +2313,7 @@ static void arm_smmu_install_ste_for_dev(struct arm_smmu_master *master)
>>  
>>  static bool arm_smmu_ats_supported(struct arm_smmu_master *master)
>>  {
>> -	struct pci_dev *pdev;
>> +	struct pci_dev *pdev __maybe_unused;
>>  	struct arm_smmu_device *smmu = master->smmu;
>>  	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(master->dev);
>>  
>> @@ -2321,8 +2321,10 @@ static bool arm_smmu_ats_supported(struct arm_smmu_master *master)
>>  	    !(fwspec->flags & IOMMU_FWSPEC_PCI_RC_ATS) || pci_ats_disabled())
>>  		return false;
>>  
>> +#ifdef CONFIG_PCI_ATS
>>  	pdev = to_pci_dev(master->dev);
>>  	return !pdev->untrusted && pdev->ats_cap;
>> +#endif
>>  }
> 
> Hmm, I really don't like the missing return statement here, even though we
> never get this far thanks to the feature not getting set during ->probe().
> I'd actually prefer just to duplicate the function:
> 
> #ifndef CONFIG_PCI_ATS
> static bool
> arm_smmu_ats_supported(struct arm_smmu_master *master) { return false; }
> #else
> <current code here>
> #endif
> 
> Can you send a v2 like that, please?

Ok, will send v2 as your suggestion.

> 
> Will
> 
> .
> 

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
