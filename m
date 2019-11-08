Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 24761F50D8
	for <lists.iommu@lfdr.de>; Fri,  8 Nov 2019 17:17:57 +0100 (CET)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 6954BE80;
	Fri,  8 Nov 2019 16:17:53 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 35753AC7
	for <iommu@lists.linux-foundation.org>;
	Fri,  8 Nov 2019 16:17:51 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from huawei.com (lhrrgout.huawei.com [185.176.76.210])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 47CA5196
	for <iommu@lists.linux-foundation.org>;
	Fri,  8 Nov 2019 16:17:49 +0000 (UTC)
Received: from LHREML710-CAH.china.huawei.com (unknown [172.18.7.107])
	by Forcepoint Email with ESMTP id 2D181470A7A6746D7EF5;
	Fri,  8 Nov 2019 16:17:47 +0000 (GMT)
Received: from lhreml724-chm.china.huawei.com (10.201.108.75) by
	LHREML710-CAH.china.huawei.com (10.201.108.33) with Microsoft SMTP
	Server (TLS) id 14.3.408.0; Fri, 8 Nov 2019 16:17:46 +0000
Received: from [127.0.0.1] (10.202.226.46) by lhreml724-chm.china.huawei.com
	(10.201.108.75) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5;
	Fri, 8 Nov 2019 16:17:46 +0000
Subject: Re: [PATCH v2 6/9] Revert "iommu/arm-smmu: Make arm-smmu-v3
	explicitly non-modular"
To: Will Deacon <will@kernel.org>, <iommu@lists.linux-foundation.org>,
	<linux-kernel@vger.kernel.org>
References: <20191108151608.20932-1-will@kernel.org>
	<20191108151608.20932-7-will@kernel.org>
From: John Garry <john.garry@huawei.com>
Message-ID: <06dfd385-1af0-3106-4cc5-6a5b8e864759@huawei.com>
Date: Fri, 8 Nov 2019 16:17:45 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
	Thunderbird/68.1.2
MIME-Version: 1.0
In-Reply-To: <20191108151608.20932-7-will@kernel.org>
Content-Language: en-US
X-Originating-IP: [10.202.226.46]
X-ClientProxiedBy: lhreml703-chm.china.huawei.com (10.201.108.52) To
	lhreml724-chm.china.huawei.com (10.201.108.75)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: "Isaac J. Manjarres" <isaacm@codeaurora.org>,
	Jean-Philippe Brucker <jean-philippe@linaro.org>, Saravana
	Kannan <saravanak@google.com>, Bjorn Helgaas <bhelgaas@google.com>,
	Robin Murphy <robin.murphy@arm.com>
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

On 08/11/2019 15:16, Will Deacon wrote:
> +MODULE_DEVICE_TABLE(of, arm_smmu_of_match);

Hi Will,

>   
>   static struct platform_driver arm_smmu_driver = {
>   	.driver	= {
>   		.name		= "arm-smmu-v3",
>   		.of_match_table	= of_match_ptr(arm_smmu_of_match),
> -		.suppress_bind_attrs = true,

Does this mean that we can now manually unbind this driver from the SMMU 
device?

Seems dangerous. Here's what happens for me:

root@ubuntu:/sys# cd ./bus/platform/drivers/arm-smmu-v3
ind @ubuntu:/sys/bus/platform/drivers/arm-smmu-v3# echo 
arm-smmu-v3.0.auto > unbind
[   77.580351] hisi_sas_v2_hw HISI0162:01: CQE_AXI_W_ERR (0x800) found!
ho [   78.635473] platform arm-smmu-v3.0.auto: CMD_SYNC timeout at 
0x00000146 [hwprod 0x00000146, hwcons 0x00000000]

>   	},
>   	.probe	= arm_smmu_device_probe,
> +	.remove	= arm_smmu_device_remove,
>   	.shutdown = arm_smmu_device_shutdown,
>   };
> -builtin_platform_driver(arm_smmu_driver);
> +module_platform_driver(arm_smmu_driver);
> +


Thanks,
John
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
