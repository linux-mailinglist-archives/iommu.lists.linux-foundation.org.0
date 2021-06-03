Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id A6E35399F69
	for <lists.iommu@lfdr.de>; Thu,  3 Jun 2021 13:01:00 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 42F0B400E7;
	Thu,  3 Jun 2021 11:00:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pLT2X9IcdlOo; Thu,  3 Jun 2021 11:00:58 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3C6D7400A7;
	Thu,  3 Jun 2021 11:00:58 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0EC9AC0024;
	Thu,  3 Jun 2021 11:00:58 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 40E2BC0001
 for <iommu@lists.linux-foundation.org>; Thu,  3 Jun 2021 11:00:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 18B22400C8
 for <iommu@lists.linux-foundation.org>; Thu,  3 Jun 2021 11:00:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dhChW2P-wBC2 for <iommu@lists.linux-foundation.org>;
 Thu,  3 Jun 2021 11:00:55 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by smtp2.osuosl.org (Postfix) with ESMTP id 09D6A400A7
 for <iommu@lists.linux-foundation.org>; Thu,  3 Jun 2021 11:00:54 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 345F81063;
 Thu,  3 Jun 2021 04:00:54 -0700 (PDT)
Received: from [10.57.73.64] (unknown [10.57.73.64])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C8CA53F774;
 Thu,  3 Jun 2021 04:00:52 -0700 (PDT)
Subject: Re: [PATCH v3] iommu/dma: Fix IOVA reserve dma ranges
To: Sven Peter <sven@svenpeter.dev>,
 Srinath Mannam <srinath.mannam@broadcom.com>, Joerg Roedel
 <joro@8bytes.org>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Bjorn Helgaas <bhelgaas@google.com>, poza@codeaurora.org
References: <20200914072319.6091-1-srinath.mannam@broadcom.com>
 <c72a45e4-c156-4a62-bfd7-9cf8a31ff499@www.fastmail.com>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <c9b5900b-8212-35c1-c358-46158d34b253@arm.com>
Date: Thu, 3 Jun 2021 12:00:46 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <c72a45e4-c156-4a62-bfd7-9cf8a31ff499@www.fastmail.com>
Content-Language: en-GB
Cc: iommu <iommu@lists.linux-foundation.org>,
 bcm-kernel-feedback-list@broadcom.com, linux-kernel@vger.kernel.org
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

On 2021-06-02 21:18, Sven Peter wrote:
> Hi,
> 
> I just ran into the exact same issue while working on the M1 DART IOMMU driver
> and it was fixed by this commit. Thanks!
> 
> Would be great if this could be picked up.

Oops, apparently I was happy enough with this 9 months ago to forget 
about it, so if it helps,

Reviewed-by: Robin Murphy <robin.murphy@arm.com>

> Tested-by: Sven Peter <sven@svenpeter.dev>
> 
> 
> Best,
> 
> 
> Sven
> 
> 
> On Mon, Sep 14, 2020, at 09:23, Srinath Mannam via iommu wrote:
>> Fix IOVA reserve failure in the case when address of first memory region
>> listed in dma-ranges is equal to 0x0.
>>
>> Fixes: aadad097cd46f ("iommu/dma: Reserve IOVA for PCIe inaccessible
>> DMA address")
>> Signed-off-by: Srinath Mannam <srinath.mannam@broadcom.com>
>> ---
>> Changes from v2:
>>     Modify error message with useful information based on Bjorn's
>> comments.
>>
>> Changes from v1:
>>     Removed unnecessary changes based on Robin's review comments.
>>
>>   drivers/iommu/dma-iommu.c | 6 ++++--
>>   1 file changed, 4 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/iommu/dma-iommu.c b/drivers/iommu/dma-iommu.c
>> index 5141d49a046b..5b9791f35c5e 100644
>> --- a/drivers/iommu/dma-iommu.c
>> +++ b/drivers/iommu/dma-iommu.c
>> @@ -217,9 +217,11 @@ static int iova_reserve_pci_windows(struct pci_dev *dev,
>>   			lo = iova_pfn(iovad, start);
>>   			hi = iova_pfn(iovad, end);
>>   			reserve_iova(iovad, lo, hi);
>> -		} else {
>> +		} else if (end < start) {
>>   			/* dma_ranges list should be sorted */
>> -			dev_err(&dev->dev, "Failed to reserve IOVA\n");
>> +			dev_err(&dev->dev,
>> +				"Failed to reserve IOVA [%#010llx-%#010llx]\n",
>> +				start, end);
>>   			return -EINVAL;
>>   		}
>>   
>> -- 
>> 2.17.1
>>
>> _______________________________________________
>> iommu mailing list
>> iommu@lists.linux-foundation.org
>> https://lists.linuxfoundation.org/mailman/listinfo/iommu
>>
>>
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
