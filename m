Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id BF8E54F8109
	for <lists.iommu@lfdr.de>; Thu,  7 Apr 2022 15:53:49 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7061D41A51;
	Thu,  7 Apr 2022 13:53:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Q6FBJFD9PRAD; Thu,  7 Apr 2022 13:53:47 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 68ECD41A59;
	Thu,  7 Apr 2022 13:53:47 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3FC48C0082;
	Thu,  7 Apr 2022 13:53:47 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7C6B8C002C
 for <iommu@lists.linux-foundation.org>; Thu,  7 Apr 2022 13:53:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 59A6940C61
 for <iommu@lists.linux-foundation.org>; Thu,  7 Apr 2022 13:53:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id y45bHqdJP2-w for <iommu@lists.linux-foundation.org>;
 Thu,  7 Apr 2022 13:53:45 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4671140C60
 for <iommu@lists.linux-foundation.org>; Thu,  7 Apr 2022 13:53:45 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C0EF012FC;
 Thu,  7 Apr 2022 06:53:44 -0700 (PDT)
Received: from [10.57.41.19] (unknown [10.57.41.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A90933F73B;
 Thu,  7 Apr 2022 06:53:42 -0700 (PDT)
Message-ID: <b50cded6-6777-c9c7-7030-a57f28771bc3@arm.com>
Date: Thu, 7 Apr 2022 14:53:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v9 06/11] ACPI/IORT: Add support to retrieve IORT RMR
 reserved regions
Content-Language: en-GB
To: Christoph Hellwig <hch@infradead.org>,
 Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
References: <20220404124209.1086-1-shameerali.kolothum.thodi@huawei.com>
 <20220404124209.1086-7-shameerali.kolothum.thodi@huawei.com>
 <Yk7m8oDPtusDzReK@infradead.org>
From: Robin Murphy <robin.murphy@arm.com>
In-Reply-To: <Yk7m8oDPtusDzReK@infradead.org>
Cc: jon@solid-run.com, linuxarm@huawei.com, steven.price@arm.com,
 linux-acpi@vger.kernel.org, iommu@lists.linux-foundation.org,
 wanghuiqiang@huawei.com, guohanjun@huawei.com, yangyicong@huawei.com,
 Sami.Mujawar@arm.com, will@kernel.org, linux-arm-kernel@lists.infradead.org
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

On 2022-04-07 14:28, Christoph Hellwig wrote:
>> +static void iort_rmr_desc_check_overlap(struct acpi_iort_rmr_desc *desc, u32 count)
> 
> Overly long line.
> 
>>   void iommu_dma_put_resv_regions(struct device *dev, struct list_head *list)
>>   {
>> +	if (!is_of_node(dev_iommu_fwspec_get(dev)->iommu_fwnode))
>> +		iort_iommu_put_resv_regions(dev, list);
>> +
>>   	generic_iommu_put_resv_regions(dev, list);
>>   }
> 
> Why can't this just go into generic_iommu_put_resv_regions?  The idea
> that the iommu low-level drivers need to call into dma-iommu which is
> a consumer of the IOMMU API is odd.  Especially if that just calls out
> to ACPI code and generic IOMMU code only anyway.

Because assuming ACPI means IORT is not generic. Part of the aim in 
adding the union to iommu_resv_region is that stuff like AMD's 
unity_map_entry and Intel's dmar_rmrr_unit can be folded into it as 
well, and their reserved region handling correspondingly simplified too.

The iommu_dma_{get,put}_resv_region() helpers are kind of intended to be 
specific to the fwnode mechanism which deals with IORT and devicetree 
(once the reserved region bindings are fully worked out).

Thanks,
Robin.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
