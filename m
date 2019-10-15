Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B840D71D1
	for <lists.iommu@lfdr.de>; Tue, 15 Oct 2019 11:08:21 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id DB253CB0;
	Tue, 15 Oct 2019 09:08:16 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 25D8FAF3
	for <iommu@lists.linux-foundation.org>;
	Tue, 15 Oct 2019 09:08:15 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from huawei.com (szxga04-in.huawei.com [45.249.212.190])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 5245E14D
	for <iommu@lists.linux-foundation.org>;
	Tue, 15 Oct 2019 09:08:14 +0000 (UTC)
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.58])
	by Forcepoint Email with ESMTP id E49F951A1DF59C7F64F8;
	Tue, 15 Oct 2019 17:08:10 +0800 (CST)
Received: from [127.0.0.1] (10.202.227.179) by DGGEMS401-HUB.china.huawei.com
	(10.3.19.201) with Microsoft SMTP Server id 14.3.439.0;
	Tue, 15 Oct 2019 17:08:01 +0800
Subject: Re: [RFC PATCH 1/6] ACPI/IORT: Set PMCG device parent
To: Hanjun Guo <guohanjun@huawei.com>, <lorenzo.pieralisi@arm.com>,
	<sudeep.holla@arm.com>, <robin.murphy@arm.com>, <mark.rutland@arm.com>, 
	<will@kernel.org>
References: <1569854031-237636-1-git-send-email-john.garry@huawei.com>
	<1569854031-237636-2-git-send-email-john.garry@huawei.com>
	<ae9a1c8a-d84b-95ab-9a6b-87a7c89c68d9@huawei.com>
From: John Garry <john.garry@huawei.com>
Message-ID: <c7bfc6ac-71a1-50d2-e18f-4d352837b93b@huawei.com>
Date: Tue, 15 Oct 2019 10:07:54 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:45.0) Gecko/20100101
	Thunderbird/45.3.0
MIME-Version: 1.0
In-Reply-To: <ae9a1c8a-d84b-95ab-9a6b-87a7c89c68d9@huawei.com>
X-Originating-IP: [10.202.227.179]
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: nleeder@codeaurora.org, rjw@rjwysocki.net, linux-kernel@vger.kernel.org,
	linuxarm@huawei.com, iommu@lists.linux-foundation.org,
	linux-arm-kernel@lists.infradead.org, lenb@kernel.org
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: iommu-bounces@lists.linux-foundation.org
Errors-To: iommu-bounces@lists.linux-foundation.org

Hi Hanjun,

Thanks for checking this.

>>   */
>>  static int __init iort_add_platform_device(struct acpi_iort_node *node,
>> -					   const struct iort_dev_config *ops)
>> +					   const struct iort_dev_config *ops, struct device *parent)
>
> Since you added a input for this function, could you please update
> the comments of this function as well?

Right, that can be updated. Indeed, the current comment omit the @ops 
argument also.

>
>>  {
>>  	struct fwnode_handle *fwnode;
>>  	struct platform_device *pdev;
>> @@ -1466,6 +1466,8 @@ static int __init iort_add_platform_device(struct acpi_iort_node *node,
>>  	if (!pdev)
>>  		return -ENOMEM;
>>
>> +	pdev->dev.parent = parent;
>> +
>>  	if (ops->dev_set_proximity) {
>>  		ret = ops->dev_set_proximity(&pdev->dev, node);
>>  		if (ret)
>> @@ -1573,6 +1575,11 @@ static void __init iort_enable_acs(struct acpi_iort_node *iort_node)
>>  static inline void iort_enable_acs(struct acpi_iort_node *iort_node) { }
>>  #endif
>>
>> +static int iort_fwnode_match(struct device *dev, const void *fwnode)
>> +{
>> +	return dev->fwnode == fwnode;
>> +}
>> +
>>  static void __init iort_init_platform_devices(void)
>>  {
>>  	struct acpi_iort_node *iort_node, *iort_end;
>> @@ -1594,11 +1601,34 @@ static void __init iort_init_platform_devices(void)
>>  				iort_table->length);
>>
>>  	for (i = 0; i < iort->node_count; i++) {
>> +		struct device *parent = NULL;
>> +
>>  		if (iort_node >= iort_end) {
>>  			pr_err("iort node pointer overflows, bad table\n");
>>  			return;
>>  		}
>>
>> +		/* Fixme: handle parent declared in IORT after PMCG */
>> +		if (iort_node->type == ACPI_IORT_NODE_PMCG) {
>> +			struct acpi_iort_node *iort_assoc_node;
>> +			struct acpi_iort_pmcg *pmcg;
>> +			u32 node_reference;
>> +
>> +			pmcg = (struct acpi_iort_pmcg *)iort_node->node_data;
>> +
>> +			node_reference = pmcg->node_reference;
>> +			iort_assoc_node = ACPI_ADD_PTR(struct acpi_iort_node, iort,
>> +				 node_reference);
>> +
>> +			if (iort_assoc_node->type == ACPI_IORT_NODE_SMMU_V3) {
>> +				struct fwnode_handle *assoc_fwnode;
>> +
>> +				assoc_fwnode = iort_get_fwnode(iort_assoc_node);
>> +
>> +				parent = bus_find_device(&platform_bus_type, NULL,
>> +				      assoc_fwnode, iort_fwnode_match);
>> +			}
>> +		}
>
> How about using a function to include those new added code to make this
> function (iort_init_platform_devices()) a bit cleaner?
>

Can do. But I still need to add code to deal with the scenario of the 
parent PMCG not being an SMMU, which is supported in the spec as I recall.

Note that I would not have FW to test that, so maybe can omit support 
for now as long as there's no regression.

>>  		iort_enable_acs(iort_node);
>>
>>  		ops = iort_get_dev_cfg(iort_node);
>> @@ -1609,7 +1639,7 @@ static void __init iort_init_platform_devices(void)
>>
>>  			iort_set_fwnode(iort_node, fwnode);
>>
>> -			ret = iort_add_platform_device(iort_node, ops);
>> +			ret = iort_add_platform_device(iort_node, ops, parent);
>
> This function is called if ops is valid, so retrieve the parent
> can be done before this function I think.

Ah, yes

Thanks,
John

>

> Thanks
> Hanjun
>
>
> .
>


_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
