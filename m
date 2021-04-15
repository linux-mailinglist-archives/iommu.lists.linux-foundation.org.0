Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DDF43603FE
	for <lists.iommu@lfdr.de>; Thu, 15 Apr 2021 10:13:58 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B71D3846E7;
	Thu, 15 Apr 2021 08:13:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZpA30xY34b3m; Thu, 15 Apr 2021 08:13:56 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTP id CEA13846CC;
	Thu, 15 Apr 2021 08:13:55 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B9E0FC000A;
	Thu, 15 Apr 2021 08:13:55 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 73612C000A
 for <iommu@lists.linux-foundation.org>; Thu, 15 Apr 2021 08:13:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5FA5460815
 for <iommu@lists.linux-foundation.org>; Thu, 15 Apr 2021 08:13:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id otcZTYtKnch4 for <iommu@lists.linux-foundation.org>;
 Thu, 15 Apr 2021 08:13:53 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com
 [IPv6:2607:f8b0:4864:20::532])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B311360654
 for <iommu@lists.linux-foundation.org>; Thu, 15 Apr 2021 08:13:53 +0000 (UTC)
Received: by mail-pg1-x532.google.com with SMTP id f29so16382513pgm.8
 for <iommu@lists.linux-foundation.org>; Thu, 15 Apr 2021 01:13:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=fHEMmI0zE+vS0F59KD+p8uLBPHfbYBHWkM9/N8ompfg=;
 b=soGoMktoPpdmcNOzFk1ITFDuDtu3Bms6GteRh5tLiO6qb0bvu2ZpKl/SQUxnJZVhIy
 TZByoPlO2do1WWZ1mSqK2SULn034q1AHzgoZKCn8bh+JZVf3F6F6PB7g20X/Nh1WpAHF
 rCBCP3iFqt4C1IuZLp4HVH8Pfaz9ffUilpbXSsLHdoKjMpv5l2AhgJxNUtRKf5pKGRRa
 95wZ67Np7MfVTeLuR4irmligwiqSTYlfHtXkkfjZSOcWleOgpSFBA/fc79RIp3kM1TcP
 PP7bCdAai6YFnjMRcKLl7cDXD/3rCBRVrWlkJt0NHB4UQEIOQQycVlS65Yq0aMOH/E/g
 9lkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=fHEMmI0zE+vS0F59KD+p8uLBPHfbYBHWkM9/N8ompfg=;
 b=pLYRczJ6Ky+m/X8PByJ0hRhaiWA6kdObDX974lGNlw0t0z4DC0bMuPHbtZWWW39uiZ
 G4e35ohhV19GDS113YpZi9+sfAxf3nqWu8aBED5O+OsAqv00t33jNm3zLfQ8w1OUcY9Q
 tV7ZbossSBDpSxQ6RW5v4dQd4YYqk2I1eQglSqj+eINr9RkI8hMM2GcR0jnAPJjv7r4w
 A+BiWO0Zv/MHu695XJLcKBM99vFPenVnizFlZJN6ColdFjGzy4S9jjmWWtsZc6GuSA8m
 3h+v3b+7BvH49dOXPbOvBp4jsokw1pjsPuuq/vpHa1THz6lD7okuptpBe6Y1KzXoF/+S
 OVJg==
X-Gm-Message-State: AOAM532L7j8as9qzkA56We5U+5HUBScRE8l8q92gL5i/pqTRGRZLDRg/
 19yXeERsGDAsmV4QFnTQ8hw=
X-Google-Smtp-Source: ABdhPJxO29fqU99JC5dI1dJM618j9ehjc6CzkxxJfsgiXjKmSO/GcguSS35F2oL6Ti4QORoZgkAHpg==
X-Received: by 2002:a63:36ce:: with SMTP id d197mr2329852pga.237.1618474433176; 
 Thu, 15 Apr 2021 01:13:53 -0700 (PDT)
Received: from ?IPv6:2404:f801:0:6:8000::a31c? ([2404:f801:9000:1a:efeb::a31c])
 by smtp.gmail.com with ESMTPSA id u21sm771781pfm.89.2021.04.15.01.13.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Apr 2021 01:13:52 -0700 (PDT)
Subject: Re: [Resend RFC PATCH V2 03/12] x86/Hyper-V: Add new hvcall guest
 address host visibility support
To: Christoph Hellwig <hch@lst.de>
References: <20210414144945.3460554-1-ltykernel@gmail.com>
 <20210414144945.3460554-4-ltykernel@gmail.com>
 <20210414154028.GA32045@lst.de>
From: Tianyu Lan <ltykernel@gmail.com>
Message-ID: <d79e4a79-2259-6a5a-ca7d-3580f6d9dc8f@gmail.com>
Date: Thu, 15 Apr 2021 16:13:42 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <20210414154028.GA32045@lst.de>
Content-Language: en-US
Cc: linux-hyperv@vger.kernel.org, brijesh.singh@amd.com, linux-mm@kvack.org,
 hpa@zytor.com, kys@microsoft.com, will@kernel.org, sunilmut@microsoft.com,
 linux-arch@vger.kernel.org, wei.liu@kernel.org, sthemmin@microsoft.com,
 linux-scsi@vger.kernel.org, x86@kernel.org, mingo@redhat.com, kuba@kernel.org,
 jejb@linux.ibm.com, thomas.lendacky@amd.com,
 Tianyu Lan <Tianyu.Lan@microsoft.com>, arnd@arndb.de, konrad.wilk@oracle.com,
 haiyangz@microsoft.com, bp@alien8.de, tglx@linutronix.de, vkuznets@redhat.com,
 martin.petersen@oracle.com, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 netdev@vger.kernel.org, akpm@linux-foundation.org, robin.murphy@arm.com,
 davem@davemloft.net
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

Hi Christoph:
	Thanks for your review.

On 4/14/2021 11:40 PM, Christoph Hellwig wrote:
>> +/*
>> + * hv_set_mem_host_visibility - Set host visibility for specified memory.
>> + */
> 
> I don't think this comment really clarifies anything over the function
> name.  What is 'host visibility'

OK. Will update the comment.

> 
>> +int hv_set_mem_host_visibility(void *kbuffer, u32 size, u32 visibility)
> 
> Should size be a size_t?
> Should visibility be an enum of some kind?
> 

Will update.

>> +int hv_mark_gpa_visibility(u16 count, const u64 pfn[], u32 visibility)
> 
> Not sure what this does either.

Will add a comment.

> 
>> +	local_irq_save(flags);
>> +	input_pcpu = (struct hv_input_modify_sparse_gpa_page_host_visibility **)
> 
> Is there a chance we could find a shorter but still descriptive
> name for this variable?  Why do we need the cast?

Sure. The cast is to avoid build error due to "incompatible-pointer-types"
> 
>> +#define VMBUS_PAGE_VISIBLE_READ_ONLY HV_MAP_GPA_READABLE
>> +#define VMBUS_PAGE_VISIBLE_READ_WRITE (HV_MAP_GPA_READABLE|HV_MAP_GPA_WRITABLE)
> 
> pointlessly overlong line.
> 
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
