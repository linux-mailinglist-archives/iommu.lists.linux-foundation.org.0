Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A0AB3EBBC3
	for <lists.iommu@lfdr.de>; Fri, 13 Aug 2021 19:58:56 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 86B16407D7;
	Fri, 13 Aug 2021 17:58:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Vpz6Tx4KxYnF; Fri, 13 Aug 2021 17:58:50 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 8A8C2407D3;
	Fri, 13 Aug 2021 17:58:50 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5B7BBC000E;
	Fri, 13 Aug 2021 17:58:50 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A212DC000E
 for <iommu@lists.linux-foundation.org>; Fri, 13 Aug 2021 17:58:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 88BEA407D3
 for <iommu@lists.linux-foundation.org>; Fri, 13 Aug 2021 17:58:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5DcEpfBGQ-9g for <iommu@lists.linux-foundation.org>;
 Fri, 13 Aug 2021 17:58:48 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com
 [IPv6:2607:f8b0:4864:20::631])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0D1C2407D0
 for <iommu@lists.linux-foundation.org>; Fri, 13 Aug 2021 17:58:47 +0000 (UTC)
Received: by mail-pl1-x631.google.com with SMTP id e15so12979672plh.8
 for <iommu@lists.linux-foundation.org>; Fri, 13 Aug 2021 10:58:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=di7QngSrp4FnsSGO3LSu9eV65mIJNW5jKf6yiG0+RuU=;
 b=dQXLqc5X8fIsHbzymW3PLJOTOjlQdK8tcmZqLFzG352erBCZhuDdyQp5dJjpAxQs4B
 JeaS1pyddkxqdfr1t8ujRcY12W0PqS0hXNNOXZ0wFZF2oaeKK3/1DVpmWTSnCW6zOWzY
 gqsqTLjc9I8480wq1q6uBW3m6zMSJpXzGOBUxY9waV/oC7JaNorcF8JKXWehHZRJ5RUq
 g7RNoWhlraHMPVn4DI6/rTvyrmiPeXKT3mG72JAOtuEM7ufjtq62UA9Nz9UYy2mJkzEG
 NpAl0ATS3TPxm1KRHOuuzcztGTWzT/f9vfWyWDsL/FUIc3fxfMILeA2ztqpuFTME9rw+
 80RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=di7QngSrp4FnsSGO3LSu9eV65mIJNW5jKf6yiG0+RuU=;
 b=H4HzKZtM4uwphZV3BwOIwRjTJVlP0AOL71fE3xoQbaw44rKwG025tU3DjnqFYo5Aze
 55DPDtU9T18/BHiItzgWRzvPfZ0zktxlvC3UiBPNahLzV/5XwUyvmUAMOaQAXz+rN27V
 hdK+ZZe5/p8gWDe632M+tKr3N90HyiuBvVi5mWrNLZTbOPxghB3nnjI1/U7qLTTxeA4h
 CnMHLqzk+FZlqctjkAg01yA2UrMA/GKqN4RVNvNryY4T1ieVAAN6hlItx8LyVdjivNAZ
 VwdlNhUce6Dfee6riWAIO5zoxNke4/QMHiHfMpnkZEdjBbl3MDY9keBjhY0GedhcXWoR
 ac2g==
X-Gm-Message-State: AOAM531pF2jVix0Ko0D15XNwEKQlB9zlJQJ1H7cjMXVqUeWvuM3SWKDc
 bKMNaNnq5TbaDqUA8qtfr5o=
X-Google-Smtp-Source: ABdhPJwzwumzRBi1BCTF3AFHLjIkjk9cXsbjw6TqqLX1fdRzbRFo7tzsATIv9gSPcOccSh8E3bFC/Q==
X-Received: by 2002:a63:f749:: with SMTP id f9mr3387048pgk.77.1628877527474;
 Fri, 13 Aug 2021 10:58:47 -0700 (PDT)
Received: from ?IPv6:2404:f801:0:5:8000::50b? ([2404:f801:9000:1a:efea::50b])
 by smtp.gmail.com with ESMTPSA id
 19sm2945794pfw.203.2021.08.13.10.58.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Aug 2021 10:58:47 -0700 (PDT)
Subject: Re: [PATCH V3 10/13] x86/Swiotlb: Add Swiotlb bounce buffer remap
 function for HV IVM
To: Christoph Hellwig <hch@lst.de>
References: <20210809175620.720923-1-ltykernel@gmail.com>
 <20210809175620.720923-11-ltykernel@gmail.com>
 <20210812122741.GC19050@lst.de>
From: Tianyu Lan <ltykernel@gmail.com>
Message-ID: <d18ae061-6fc2-e69e-fc2c-2e1a1114c4b4@gmail.com>
Date: Sat, 14 Aug 2021 01:58:32 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210812122741.GC19050@lst.de>
Content-Language: en-US
Cc: parri.andrea@gmail.com, linux-hyperv@vger.kernel.org, brijesh.singh@amd.com,
 peterz@infradead.org, dave.hansen@linux.intel.com, dave.hansen@intel.com,
 hpa@zytor.com, kys@microsoft.com, will@kernel.org, boris.ostrovsky@oracle.com,
 linux-arch@vger.kernel.org, sfr@canb.auug.org.au, wei.liu@kernel.org,
 sstabellini@kernel.org, sthemmin@microsoft.com, xen-devel@lists.xenproject.org,
 linux-scsi@vger.kernel.org, aneesh.kumar@linux.ibm.com, x86@kernel.org,
 decui@microsoft.com, ardb@kernel.org, michael.h.kelley@microsoft.com,
 mingo@redhat.com, pgonda@google.com, rientjes@google.com, kuba@kernel.org,
 jejb@linux.ibm.com, martin.b.radev@gmail.com, thomas.lendacky@amd.com,
 Tianyu.Lan@microsoft.com, arnd@arndb.de, konrad.wilk@oracle.com,
 haiyangz@microsoft.com, bp@alien8.de, luto@kernel.org,
 krish.sadhukhan@oracle.com, tglx@linutronix.de, vkuznets@redhat.com,
 jgross@suse.com, martin.petersen@oracle.com, saravanand@fb.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, rppt@kernel.org, hannes@cmpxchg.org,
 tj@kernel.org, akpm@linux-foundation.org, robin.murphy@arm.com,
 davem@davemloft.net, kirill.shutemov@linux.intel.com
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

On 8/12/2021 8:27 PM, Christoph Hellwig wrote:
> This is still broken.  You need to make sure the actual DMA allocations
> do have struct page backing.
> 

Hi Christoph:
      swiotlb_tbl_map_single() still returns PA below vTOM/share_gpa_
boundary. These PAs has backing pages and belong to system memory.
In other word, all PAs passed to DMA API have backing pages and these is 
no difference between Isolation guest and traditional guest for DMA API.
The new mapped VA for PA above vTOM here is just to access the bounce 
buffer in the swiotlb code and isn't exposed to outside.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
