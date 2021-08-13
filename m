Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 865B83EBA3B
	for <lists.iommu@lfdr.de>; Fri, 13 Aug 2021 18:43:44 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 365D380F04;
	Fri, 13 Aug 2021 16:43:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id j90-TjIvImtc; Fri, 13 Aug 2021 16:43:39 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 06A5D80F01;
	Fri, 13 Aug 2021 16:43:39 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D75FEC001F;
	Fri, 13 Aug 2021 16:43:38 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1F247C000E
 for <iommu@lists.linux-foundation.org>; Fri, 13 Aug 2021 16:43:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 08E81605BF
 for <iommu@lists.linux-foundation.org>; Fri, 13 Aug 2021 16:43:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UkVSjtPCosF5 for <iommu@lists.linux-foundation.org>;
 Fri, 13 Aug 2021 16:43:33 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com
 [IPv6:2607:f8b0:4864:20::633])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1CC51605E1
 for <iommu@lists.linux-foundation.org>; Fri, 13 Aug 2021 16:43:32 +0000 (UTC)
Received: by mail-pl1-x633.google.com with SMTP id b7so12717349plh.7
 for <iommu@lists.linux-foundation.org>; Fri, 13 Aug 2021 09:43:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Br8kWTJBYxAsDNXsgBmQPMZlHU8mozxNfYo/9WDsR4I=;
 b=aoTndkeVaHx+xBp7rqX3zmRgkXAUaeWNU6g1W5l6j2h14KXWDt/4KR1/vs8KQLuFc+
 34iHxz0QkWtvArbfHie0V+3SpbV3Etyaux0TSLQVrp+6lyKitKxYLcmpKDuBa3hKgs1Q
 L+HBlJsf1N4PmA7Lhrcv6XYigXfGievs/en9zESUnFG4qu4IHQbnz7Fh+vazW6arL56N
 dGeRpy35Kd27RqG5JRWguH9nICCCpQJez7lwxLr0P4Fr+rJHgUPVJfNeUcfFFOMN0Pib
 ad4dksepULIsumOQAu+X2SAOKzn90wqArATLcQxfXs2NZOHu8wo377ndiUdyqLv8zpwd
 Rq0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Br8kWTJBYxAsDNXsgBmQPMZlHU8mozxNfYo/9WDsR4I=;
 b=m9y98hj9deMTJJ3N8FG6Vs70XnqltpOrhNMSN1K034I7ErxmgUf6PrCnncSkQ3mFBu
 jTn27AOt9m1XQ0Gg/p5iJHyPmnYvLrHKkHv+IJFIH8C5W1NZom2U5HQHx+gkdLXR6rYR
 T59lTBphMAfSFv1YJF7/54SHnDUtjID38m9ADjurxwHWR7mMi9F+36UAGU/8TnaWBf82
 Ke3D+CWdl/7A1gjvv0Iya6bFSyfQR6M9+gV+IA1Pq43qrq5qo41NPDh6ehdNbK0dUE0s
 17f1ZZ5s4g9+pPxJf+rTpE/E+/XOI8vypzb8fiXlhlZAV4Mgz550nah2a4CVkJjYGMY3
 Jstg==
X-Gm-Message-State: AOAM530Qbds2Q4Kpr8SHn8JTn2XwMWTBvRGhtyC9ElGH1lzUK36XlFra
 P7pjJbfvfpqpI1MUB6pZtYM=
X-Google-Smtp-Source: ABdhPJzF5OxYFo7ub8a8o5Dc0QIjyn2ULZzeCAc9wcqXWRPO4wbeX7mR+yOK6dhKrmTMKf5MwdVa8w==
X-Received: by 2002:a17:90a:c2:: with SMTP id v2mr3374490pjd.96.1628873012452; 
 Fri, 13 Aug 2021 09:43:32 -0700 (PDT)
Received: from ?IPv6:2404:f801:0:5:8000::50b? ([2404:f801:9000:1a:efea::50b])
 by smtp.gmail.com with ESMTPSA id
 q5sm2573972pfu.185.2021.08.13.09.43.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Aug 2021 09:43:32 -0700 (PDT)
Subject: Re: [Resend RFC PATCH V4 09/13] x86/Swiotlb/HV: Add Swiotlb bounce
 buffer remap function for HV IVM
To: Christoph Hellwig <hch@lst.de>
References: <20210707154629.3977369-1-ltykernel@gmail.com>
 <20210707154629.3977369-10-ltykernel@gmail.com>
 <20210720135437.GA13554@lst.de>
From: Tianyu Lan <ltykernel@gmail.com>
Message-ID: <20926467-6f67-9549-1c34-1841f597b977@gmail.com>
Date: Sat, 14 Aug 2021 00:43:16 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210720135437.GA13554@lst.de>
Content-Language: en-US
Cc: linux-hyperv@vger.kernel.org, brijesh.singh@amd.com, david@redhat.com,
 peterz@infradead.org, dave.hansen@linux.intel.com, hpa@zytor.com,
 anparri@microsoft.com, kys@microsoft.com, will@kernel.org,
 boris.ostrovsky@oracle.com, linux-arch@vger.kernel.org, robh@kernel.org,
 wei.liu@kernel.org, sstabellini@kernel.org, sthemmin@microsoft.com,
 xen-devel@lists.xenproject.org, linux-scsi@vger.kernel.org, x86@kernel.org,
 decui@microsoft.com, ardb@kernel.org, michael.h.kelley@microsoft.com,
 nramas@linux.microsoft.com, mingo@redhat.com, pgonda@google.com,
 rientjes@google.com, kuba@kernel.org, jejb@linux.ibm.com,
 martin.b.radev@gmail.com, thomas.lendacky@amd.com, Tianyu.Lan@microsoft.com,
 keescook@chromium.org, arnd@arndb.de, konrad.wilk@oracle.com,
 haiyangz@microsoft.com, bp@alien8.de, luto@kernel.org,
 krish.sadhukhan@oracle.com, tglx@linutronix.de, vkuznets@redhat.com,
 jgross@suse.com, martin.petersen@oracle.com, saravanand@fb.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, rppt@kernel.org, hannes@cmpxchg.org,
 akpm@linux-foundation.org, robin.murphy@arm.com, davem@davemloft.net,
 kirill.shutemov@linux.intel.com
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
       I followed your this suggestion to rework the latest
version(https://lkml.org/lkml/2021/8/9/805). I just remove the arch
prefix from your suggested name arch_dma_map_decrypted because the 
platform may populate their map/umap callback in the ops. But from your 
latest comment(https://lkml.org/lkml/2021/8/12/149), these names confuse 
vs the actual dma_map_* calls... Could you help to give the right 
function name? The new map function is to map bounce buffer in the 
trust/Isolation VM and these buffers are DMA memory.



On 7/20/2021 9:54 PM, Christoph Hellwig wrote:
>> -	set_memory_decrypted((unsigned long)vaddr, bytes >> PAGE_SHIFT);
>> -	memset(vaddr, 0, bytes);
>> +	mem->vstart = (void *)set_memory_decrypted_map((unsigned long)vaddr, bytes);
> Please always pass kernel virtual addresses as pointers.
> 
> And I think these APIs might need better names, e.g.
> 
> arch_dma_map_decrypted and arch_dma_unmap_decrypted.
> 
> Also these will need fallback versions for non-x86 architectures that
> currently use memory encryption.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
