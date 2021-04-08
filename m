Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 9369D3586FC
	for <lists.iommu@lfdr.de>; Thu,  8 Apr 2021 16:19:43 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2830384821;
	Thu,  8 Apr 2021 14:19:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0YvDnEsWZJll; Thu,  8 Apr 2021 14:19:41 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTP id 387D384C42;
	Thu,  8 Apr 2021 14:19:41 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 145EFC000A;
	Thu,  8 Apr 2021 14:19:41 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2C290C000A
 for <iommu@lists.linux-foundation.org>; Thu,  8 Apr 2021 14:19:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with UTF8SMTP id 27784606DC
 for <iommu@lists.linux-foundation.org>; Thu,  8 Apr 2021 14:19:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=mg.codeaurora.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with UTF8SMTP id xNmOKnWH3zef for <iommu@lists.linux-foundation.org>;
 Thu,  8 Apr 2021 14:19:39 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from m43-7.mailgun.net (m43-7.mailgun.net [69.72.43.7])
 by smtp3.osuosl.org (Postfix) with UTF8SMTPS id E0616606A5
 for <iommu@lists.linux-foundation.org>; Thu,  8 Apr 2021 14:19:37 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1617891579; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=EP+pBunBgSa45mKTGCYWWxXN5ncn0hl1hP411pSbOqY=;
 b=chcL8cwcRwFaPY29V+Jw08NelvXCBzxZLWqnByu09DI0WfuQ3qax29TlzwBs+WYu9I020V+n
 4N08EXN4MUQUA+zxzHFk9VpsDvqRe+MCZp8Gp2zVem6qhctWo+4to3KgSVDkb5hnHKP/btj4
 liFbwfR5JDPQvP+L0z6zwf40ilE=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI3NDkwMCIsICJpb21tdUBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-west-2.postgun.com with SMTP id
 606f10f2f34440a9d43a7be4 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 08 Apr 2021 14:19:30
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id E2C82C43464; Thu,  8 Apr 2021 14:19:29 +0000 (UTC)
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: isaacm)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 226C2C433C6;
 Thu,  8 Apr 2021 14:19:29 +0000 (UTC)
MIME-Version: 1.0
Date: Thu, 08 Apr 2021 07:19:29 -0700
From: isaacm@codeaurora.org
To: Will Deacon <will@kernel.org>
Subject: Re: [RFC PATCH v4 12/15] iommu/io-pgtable-arm-v7s: Implement
 arm_v7s_unmap_pages()
In-Reply-To: <20210408135807.GA17998@willie-the-truck>
References: <20210408045241.27316-1-isaacm@codeaurora.org>
 <20210408045241.27316-13-isaacm@codeaurora.org>
 <20210408135807.GA17998@willie-the-truck>
Message-ID: <342d453c1e5d737122b43be006de6077@codeaurora.org>
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

On 2021-04-08 06:58, Will Deacon wrote:
> On Wed, Apr 07, 2021 at 09:52:38PM -0700, Isaac J. Manjarres wrote:
>> Implement the unmap_pages() callback for the ARM v7s io-pgtable
>> format.
>> 
>> Signed-off-by: Isaac J. Manjarres <isaacm@codeaurora.org>
>> ---
>>  drivers/iommu/io-pgtable-arm-v7s.c | 23 ++++++++++++++++++++---
>>  1 file changed, 20 insertions(+), 3 deletions(-)
>> 
>> diff --git a/drivers/iommu/io-pgtable-arm-v7s.c 
>> b/drivers/iommu/io-pgtable-arm-v7s.c
>> index d4004bcf333a..5e203e03c352 100644
>> --- a/drivers/iommu/io-pgtable-arm-v7s.c
>> +++ b/drivers/iommu/io-pgtable-arm-v7s.c
>> @@ -710,15 +710,32 @@ static size_t __arm_v7s_unmap(struct 
>> arm_v7s_io_pgtable *data,
>>  	return __arm_v7s_unmap(data, gather, iova, size, lvl + 1, ptep);
>>  }
>> 
>> -static size_t arm_v7s_unmap(struct io_pgtable_ops *ops, unsigned long 
>> iova,
>> -			    size_t size, struct iommu_iotlb_gather *gather)
>> +static size_t arm_v7s_unmap_pages(struct io_pgtable_ops *ops, 
>> unsigned long iova,
>> +				  size_t pgsize, size_t pgcount,
>> +				  struct iommu_iotlb_gather *gather)
>>  {
>>  	struct arm_v7s_io_pgtable *data = io_pgtable_ops_to_data(ops);
>> +	size_t unmapped = 0, ret;
>> 
>>  	if (WARN_ON(iova >= (1ULL << data->iop.cfg.ias)))
>>  		return 0;
>> 
>> -	return __arm_v7s_unmap(data, gather, iova, size, 1, data->pgd);
>> +	while (pgcount--) {
>> +		ret = __arm_v7s_unmap(data, gather, iova, pgsize, 1, data->pgd);
>> +		if (!ret)
>> +			break;
>> +
>> +		unmapped += pgsize;
>> +		iova += pgsize;
>> +	}
>> +
>> +	return unmapped;
>> +}
> 
> Wait -- don't you need to hook this up somewhere (likewise for 
> ->map_pages)?
Done. Likewise for map_pages(). I'm not sure how the compiler didn't 
catch this; I'm compile testing this, as I don't have hardware that uses 
the short descriptor format.
> How are you testing this?
> 
> Will
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
