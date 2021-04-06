Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id BC9B9355DA1
	for <lists.iommu@lfdr.de>; Tue,  6 Apr 2021 23:07:59 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 20E1D40590;
	Tue,  6 Apr 2021 21:07:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3wkELfM3Isvd; Tue,  6 Apr 2021 21:07:57 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTP id 18894401E5;
	Tue,  6 Apr 2021 21:07:57 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D7C54C0012;
	Tue,  6 Apr 2021 21:07:56 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 00AFAC000A
 for <iommu@lists.linux-foundation.org>; Tue,  6 Apr 2021 21:07:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with UTF8SMTP id E2E9A40365
 for <iommu@lists.linux-foundation.org>; Tue,  6 Apr 2021 21:07:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=mg.codeaurora.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with UTF8SMTP id jOu2JkQbg3gk for <iommu@lists.linux-foundation.org>;
 Tue,  6 Apr 2021 21:07:54 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from m43-7.mailgun.net (m43-7.mailgun.net [69.72.43.7])
 by smtp4.osuosl.org (Postfix) with UTF8SMTPS id 9358C4035E
 for <iommu@lists.linux-foundation.org>; Tue,  6 Apr 2021 21:07:52 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1617743274; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=VZeL16pjJokn+B594PjMdyFo17Dt6ozwQkbM8bxmQ7c=;
 b=QxBSdczVo+REfEZIxQjCaIEF99RPA76iuJxcp0W2im5Dd1lwOM3z+XTK4MAa0hR+7+5nxaQ2
 E/vlet8StWSMWtrnj4vvrPxHF9h2M6Pi4X808Xpz19FNdx9PvFSYfY94G8e64TJR0tIxQ2jy
 4yTvAi4lMjJZFN2J3h4uG/YF9PM=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI3NDkwMCIsICJpb21tdUBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-east-1.postgun.com with SMTP id
 606ccd9f8166b7eff764e29a (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 06 Apr 2021 21:07:43
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id AF3C2C433CA; Tue,  6 Apr 2021 21:07:42 +0000 (UTC)
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: isaacm)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 88808C433C6;
 Tue,  6 Apr 2021 21:07:41 +0000 (UTC)
MIME-Version: 1.0
Date: Tue, 06 Apr 2021 14:07:41 -0700
From: isaacm@codeaurora.org
To: Will Deacon <will@kernel.org>
Subject: Re: [RFC PATCH v3 03/12] iommu/io-pgtable: Introduce map_pages() as a
 page table op
In-Reply-To: <20210406115739.GD13747@willie-the-truck>
References: <20210405191112.28192-1-isaacm@codeaurora.org>
 <20210405191112.28192-4-isaacm@codeaurora.org>
 <20210406115739.GD13747@willie-the-truck>
Message-ID: <75a5d309498b8b41b5e24a2d9d36e78f@codeaurora.org>
X-Sender: isaacm@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Cc: pratikp@codeaurora.org, iommu@lists.linux-foundation.org,
 robin.murphy@arm.com, linux-arm-kernel@lists.infradead.org
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

On 2021-04-06 04:57, Will Deacon wrote:
> On Mon, Apr 05, 2021 at 12:11:03PM -0700, Isaac J. Manjarres wrote:
>> Mapping memory into io-pgtables follows the same semantics
>> that unmapping memory used to follow (i.e. a buffer will be
>> mapped one page block per call to the io-pgtable code). This
>> means that it can be optimized in the same way that unmapping
>> memory was, so add a map_pages() callback to the io-pgtable
>> ops structure, so that a range of pages of the same size
>> can be mapped within the same call.
>> 
>> Signed-off-by: Isaac J. Manjarres <isaacm@codeaurora.org>
>> Suggested-by: Will Deacon <will@kernel.org>
>> ---
>>  include/linux/io-pgtable.h | 4 ++++
>>  1 file changed, 4 insertions(+)
>> 
>> diff --git a/include/linux/io-pgtable.h b/include/linux/io-pgtable.h
>> index 2ed0c057d9e7..019149b204b8 100644
>> --- a/include/linux/io-pgtable.h
>> +++ b/include/linux/io-pgtable.h
>> @@ -143,6 +143,7 @@ struct io_pgtable_cfg {
>>   * struct io_pgtable_ops - Page table manipulation API for IOMMU 
>> drivers.
>>   *
>>   * @map:          Map a physically contiguous memory region.
>> + * @map_pages:    Map a physically contiguous range of pages of the 
>> same size.
>>   * @unmap:        Unmap a physically contiguous memory region.
>>   * @unmap_pages:  Unmap a range of virtually contiguous pages of the 
>> same size.
>>   * @iova_to_phys: Translate iova to physical address.
>> @@ -153,6 +154,9 @@ struct io_pgtable_cfg {
>>  struct io_pgtable_ops {
>>  	int (*map)(struct io_pgtable_ops *ops, unsigned long iova,
>>  		   phys_addr_t paddr, size_t size, int prot, gfp_t gfp);
>> +	int (*map_pages)(struct io_pgtable_ops *ops, unsigned long iova,
>> +			 phys_addr_t paddr, size_t pgsize, size_t pgcount,
>> +			 int prot, gfp_t gfp, size_t *mapped);
> 
> How about returning 'size_t' and using IS_ERR_VALUE() instead of adding
> the extra 'mapped' argument (i.e. return the size of the region mapped
> or an error code)? I don't think we realistically need to care about 
> map
> sizes that overlap with the error region.
> 
I'd given that a shot before, but the problem that I kept running into 
was that
in case of an error, if I return an error code, I don't know how much 
memory
was mapped, so that I can invoke iommu_unmap from __iommu_map with that 
size to
undo the partial mappings from a map_pages() call.

Returning the amount of memory that was mapped in the case of an error 
will be
less than the size that was requested, but then we lose the information 
about why
the error happened, since the error code won't be returned, so that's 
why I went
with the current approach. Do you have any other ideas about how to 
handle this?

I'd thought of having arm_lpae_map_pages() invoke 
arm_lpae_unmap_pages(), but
the TLB maintenance was a problem, as we wouldn't invoke 
iommu_iotlb_sync().

Thanks,
Isaac
> Will
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
