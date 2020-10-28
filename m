Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id C7F0A29CE72
	for <lists.iommu@lfdr.de>; Wed, 28 Oct 2020 08:01:18 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 731F22038B;
	Wed, 28 Oct 2020 07:01:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uU3W0YDq0H1U; Wed, 28 Oct 2020 07:01:15 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id E76F420443;
	Wed, 28 Oct 2020 07:01:14 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D2718C0051;
	Wed, 28 Oct 2020 07:01:14 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4104BC0051
 for <iommu@lists.linux-foundation.org>; Wed, 28 Oct 2020 07:01:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 2F5CE867B9
 for <iommu@lists.linux-foundation.org>; Wed, 28 Oct 2020 07:01:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 24v0EMvd-6YQ for <iommu@lists.linux-foundation.org>;
 Wed, 28 Oct 2020 07:01:12 +0000 (UTC)
X-Greylist: delayed 00:05:43 by SQLgrey-1.7.6
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
 [209.85.210.196])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 186EE864AA
 for <iommu@lists.linux-foundation.org>; Wed, 28 Oct 2020 07:01:12 +0000 (UTC)
Received: by mail-pf1-f196.google.com with SMTP id e7so2369016pfn.12
 for <iommu@lists.linux-foundation.org>; Wed, 28 Oct 2020 00:01:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ozlabs-ru.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=0gyGFaDOcOeQhjWoBvvUrgMjgi73degQBGCdgvQxJWw=;
 b=1zT8ojDOkSyqm3LHsLojKFZue3lfDkmgiWdwR7z3MDg2KVVJQGN/8bLcvGve/9V3pS
 kBPxpkrMojKBM57d5lD99sAlDJiRCtLv7Obo9mUqTw5lqcvJb+a3sVumt4NQIsPQ0c+h
 5ZiQ3KTjFB4WDGRRJNKwnOHtY4CoJgy7lr08/ICOLvF0N/EXWRGrijyARFNwUBVjBxLJ
 JD1q1WUh/pnebnTDXWA7JpJeffYh5IFKaVEz7/CsXrXi+69HYzxfY3pQ40hxcM2sJt05
 gx5BSOdWvwBaK+xQ8yZ7PrpnOnogk80Pda4TRHVztUF6Mzv244Yy5pHVvOTgs09BfV59
 A7Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=0gyGFaDOcOeQhjWoBvvUrgMjgi73degQBGCdgvQxJWw=;
 b=bug/NehKucrqQ1Pt3Aqu5Bwuh8/kg2Q52O950oIw5PNnj9SLqzWTb/c/Ef5yHEZFMd
 0azIZoxQE//bB/9XhXFBQn+6tKt8TR/fPNlrPMfk++ZinXjFDVvM/DRYaZoLJHwczuta
 CeeTNbA7hz54hrygj6a/WthsftTDxpGPicc5YpKpg9Gf3mafBBKWHVRpxUmoGaEqecDz
 HI6+5Os9L5L5GK3bEWg9yKTkIXul3xPQCOHa0jyJ73GFw4pDnilfZ4C/5HsK0umZprjl
 HSZY2PbbOG2dGdFjfcNrtp6OF+9EE8P7yYhSrc3lSRifUjELVYPlZzGjlSy1ibak6hzg
 MqJA==
X-Gm-Message-State: AOAM532GXL6FqTTTykjevhgo84+YxEqU0wPGfttdNvWJffG3NS58gTPB
 gJ6QemfaTHccrJ943sTY6vlio/kNHY6DSg==
X-Google-Smtp-Source: ABdhPJwLK7sVbIf76eH/CksvHl+Gf+oPqZSizyfuyOV5tzPAtqjO0/LOeSMI+tR01QpsT10hmjc/Cg==
X-Received: by 2002:a62:a10a:0:b029:154:fd62:ba90 with SMTP id
 b10-20020a62a10a0000b0290154fd62ba90mr5423227pff.62.1603868128933; 
 Tue, 27 Oct 2020 23:55:28 -0700 (PDT)
Received: from [192.168.10.88] (124-171-72-187.dyn.iinet.net.au.
 [124.171.72.187])
 by smtp.gmail.com with UTF8SMTPSA id b6sm4288883pjq.42.2020.10.27.23.55.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Oct 2020 23:55:27 -0700 (PDT)
Subject: Re: [PATCH kernel v2 1/2] dma: Allow mixing bypass and normal IOMMU
 operation
To: Christoph Hellwig <hch@lst.de>
References: <20201027101841.96056-1-aik@ozlabs.ru>
 <20201027101841.96056-2-aik@ozlabs.ru> <20201027164858.GA30651@lst.de>
From: Alexey Kardashevskiy <aik@ozlabs.ru>
Message-ID: <28147035-500d-f3cd-f283-257066343697@ozlabs.ru>
Date: Wed, 28 Oct 2020 17:55:23 +1100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:83.0) Gecko/20100101
 Thunderbird/83.0
MIME-Version: 1.0
In-Reply-To: <20201027164858.GA30651@lst.de>
Content-Language: en-US
Cc: Michael Ellerman <mpe@ellerman.id.au>, iommu@lists.linux-foundation.org,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
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



On 28/10/2020 03:48, Christoph Hellwig wrote:
>> +static inline bool dma_handle_direct(struct device *dev, dma_addr_t dma_handle)
>> +{
>> +       return dma_handle >= dev->archdata.dma_offset;
>> +}
> 
> This won't compile except for powerpc, and directly accesing arch members
> in common code is a bad idea.  Maybe both your helpers need to be
> supplied by arch code to better abstract this out.


rats, overlooked it :( bus_dma_limit is generic but dma_offset is in 
archdata :-/


> 
>>   	if (dma_map_direct(dev, ops))
>>   		addr = dma_direct_map_page(dev, page, offset, size, dir, attrs);
>> +#ifdef CONFIG_DMA_OPS_BYPASS_BUS_LIMIT
>> +	else if (dev->bus_dma_limit &&
>> +		 can_map_direct(dev, (phys_addr_t) page_to_phys(page) + offset + size))
>> +		addr = dma_direct_map_page(dev, page, offset, size, dir, attrs);
>> +#endif
> 
> I don't think page_to_phys needs a phys_addr_t on the return value.
> I'd also much prefer if we make this a little more beautiful, here
> are a few suggestions:
> 
>   - hide the bus_dma_limit check inside can_map_direct, and provide a
>     stub so that we can avoid the ifdef
>   - use a better name for can_map_direct, and maybe also a better calling
>     convention by passing the page (the sg code also has the page), 

It is passing an address of the end of the mapped area so passing a page 
struct means passing page and offset which is an extra parameter and we 
do not want to do anything with the page in those hooks anyway so I'd 
keep it as is.


> and
>     maybe even hide the dma_map_direct inside it.

Call dma_map_direct() from arch_dma_map_page_direct() if 
arch_dma_map_page_direct() is defined? Seems suboptimal as it is going 
to be bypass=true in most cases and we save one call by avoiding calling 
arch_dma_map_page_direct(). Unless I missed something?


> 
> 	if (dma_map_direct(dev, ops) ||
> 	    arch_dma_map_page_direct(dev, page, offset, size))
> 		addr = dma_direct_map_page(dev, page, offset, size, dir, attrs);
> 
>>   	BUG_ON(!valid_dma_direction(dir));
>>   	if (dma_map_direct(dev, ops))
>>   		dma_direct_unmap_page(dev, addr, size, dir, attrs);
>> +#ifdef CONFIG_DMA_OPS_BYPASS_BUS_LIMIT
>> +	else if (dev->bus_dma_limit && dma_handle_direct(dev, addr + size))
>> +		dma_direct_unmap_page(dev, addr, size, dir, attrs);
>> +#endif
> 
> Same here.
> 
>>   	if (dma_map_direct(dev, ops))
>>   		ents = dma_direct_map_sg(dev, sg, nents, dir, attrs);
>> +#ifdef CONFIG_DMA_OPS_BYPASS_BUS_LIMIT
>> +	else if (dev->bus_dma_limit) {
>> +		struct scatterlist *s;
>> +		bool direct = true;
>> +		int i;
>> +
>> +		for_each_sg(sg, s, nents, i) {
>> +			direct = can_map_direct(dev, sg_phys(s) + s->offset + s->length);
>> +			if (!direct)
>> +				break;
>> +		}
>> +		if (direct)
>> +			ents = dma_direct_map_sg(dev, sg, nents, dir, attrs);
>> +		else
>> +			ents = ops->map_sg(dev, sg, nents, dir, attrs);
>> +	}
>> +#endif
> 
> This needs to go into a helper as well.  I think the same style as
> above would work pretty nicely as well:

Yup. I'll repost v3 soon with this change. Thanks for the review.


> 
>   	if (dma_map_direct(dev, ops) ||
> 	    arch_dma_map_sg_direct(dev, sg, nents))
>   		ents = dma_direct_map_sg(dev, sg, nents, dir, attrs);
>   	else
>   		ents = ops->map_sg(dev, sg, nents, dir, attrs);
> 
>> +#ifdef CONFIG_DMA_OPS_BYPASS_BUS_LIMIT
>> +	if (dev->bus_dma_limit) {
>> +		struct scatterlist *s;
>> +		bool direct = true;
>> +		int i;
>> +
>> +		for_each_sg(sg, s, nents, i) {
>> +			direct = dma_handle_direct(dev, s->dma_address + s->length);
>> +			if (!direct)
>> +				break;
>> +		}
>> +		if (direct) {
>> +			dma_direct_unmap_sg(dev, sg, nents, dir, attrs);
>> +			return;
>> +		}
>> +	}
>> +#endif
> 
> One more time here..
> 

-- 
Alexey
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
