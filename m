Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C0C93DA3A6
	for <lists.iommu@lfdr.de>; Thu, 29 Jul 2021 15:02:12 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A7468401B2;
	Thu, 29 Jul 2021 13:02:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id k5valjq05rGF; Thu, 29 Jul 2021 13:02:09 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 507A0401BD;
	Thu, 29 Jul 2021 13:02:09 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 91888C000E;
	Thu, 29 Jul 2021 13:02:08 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 686FFC000E
 for <iommu@lists.linux-foundation.org>; Thu, 29 Jul 2021 13:02:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 502094033D
 for <iommu@lists.linux-foundation.org>; Thu, 29 Jul 2021 13:02:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id e_p2pitaZF8C for <iommu@lists.linux-foundation.org>;
 Thu, 29 Jul 2021 13:02:06 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com
 [IPv6:2607:f8b0:4864:20::630])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 903BF401B2
 for <iommu@lists.linux-foundation.org>; Thu, 29 Jul 2021 13:02:06 +0000 (UTC)
Received: by mail-pl1-x630.google.com with SMTP id q2so6863945plr.11
 for <iommu@lists.linux-foundation.org>; Thu, 29 Jul 2021 06:02:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=xWZDnZQ7Uje44tOvyd+WhPXcE6YbxVNUTkV2DmxlC/I=;
 b=ExonRuvAP6deeZWP4ARMhx8XszTEeQWKqexdxGr8TsuL+Bz8VPrFj6Y730SphdAQDC
 84Fqe2zxnVuAY/b+yUA8Eq195vN/ev0qbH1bKyG9MpEY83Z3AAYzJOmRRNOSb1q264YH
 H1r0MDXkAlN2lmoLmNB9pMzmaE8qMyQJV2yXvzwM4lU7+cUmxyAefZ33Vtx/QsvY0B2Y
 7299cOKI8WViF8nwItNn9KeFY/6ShDYN3GG/09Lm/PkrJetdxTquTYKbp14IyHKNKJri
 w4KULmdKqUg3LoIRw+FRYrv+H/B2Jf9av5u6lx3SllYemnIcK4W70fMX/uAcJnqsyzu9
 1r1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=xWZDnZQ7Uje44tOvyd+WhPXcE6YbxVNUTkV2DmxlC/I=;
 b=royHS84ddze4PWCKKpFka1hdHd/fUHhB0TFHl9sgdQMJwI7O/ivIOZ64/rpWR56TiB
 PVHMIec4gIw6TgPsPwMgG+faXCOH3MXfOxBSkVCGzWql6SOA6ad9ri61LxgXAFeWq9Uw
 EvAI0kSSLgUt5uFiXPiRcklnlSTlEVg8aXPmv5iJxbLKa61YmdCgKcWn66hTjZhuU3ZE
 jw4A9RQzqy59x0j7zr36tgm5m0UdLdVyj1hToiWlsSgV6qUYOK+Yaj3r2GlyjYYvSWal
 p6uQQJM9g9JCIGCALgiegA7IfzB8q1ou88jHgduGrOKlMElnQKnUNeopvk87DVGG9BDU
 kXtg==
X-Gm-Message-State: AOAM530N11tRRolNWBuQncbrn1U0ahAnaU7N4yITEwdRrxEqeqUKxEQG
 UXNmKGdnztGcWZjCpy53SLg=
X-Google-Smtp-Source: ABdhPJyrI/P/7aQeOr7fGMy78ZxY6RcR1Rwj4jALXoPGmX2VorLJRrRMQ6J111Dxy7HnP0DgW7LcpA==
X-Received: by 2002:a05:6a00:24c6:b029:332:6773:165c with SMTP id
 d6-20020a056a0024c6b02903326773165cmr4937276pfv.33.1627563725957; 
 Thu, 29 Jul 2021 06:02:05 -0700 (PDT)
Received: from ?IPv6:2404:f801:0:5:8000::4b1? ([2404:f801:9000:1a:efea::4b1])
 by smtp.gmail.com with ESMTPSA id
 w2sm9730504pjt.14.2021.07.29.06.01.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Jul 2021 06:02:05 -0700 (PDT)
Subject: Re: [PATCH 03/13] x86/HV: Add new hvcall guest address host
 visibility support
To: Dave Hansen <dave.hansen@intel.com>, kys@microsoft.com,
 haiyangz@microsoft.com, sthemmin@microsoft.com, wei.liu@kernel.org,
 decui@microsoft.com, tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
 x86@kernel.org, hpa@zytor.com, dave.hansen@linux.intel.com, luto@kernel.org,
 peterz@infradead.org, konrad.wilk@oracle.com, boris.ostrovsky@oracle.com,
 jgross@suse.com, sstabellini@kernel.org, joro@8bytes.org, will@kernel.org,
 davem@davemloft.net, kuba@kernel.org, jejb@linux.ibm.com,
 martin.petersen@oracle.com, arnd@arndb.de, hch@lst.de,
 m.szyprowski@samsung.com, robin.murphy@arm.com, thomas.lendacky@amd.com,
 brijesh.singh@amd.com, ardb@kernel.org, Tianyu.Lan@microsoft.com,
 rientjes@google.com, martin.b.radev@gmail.com, akpm@linux-foundation.org,
 rppt@kernel.org, kirill.shutemov@linux.intel.com,
 aneesh.kumar@linux.ibm.com, krish.sadhukhan@oracle.com, saravanand@fb.com,
 xen-devel@lists.xenproject.org, pgonda@google.com, david@redhat.com,
 keescook@chromium.org, hannes@cmpxchg.org, sfr@canb.auug.org.au,
 michael.h.kelley@microsoft.com
References: <20210728145232.285861-1-ltykernel@gmail.com>
 <20210728145232.285861-4-ltykernel@gmail.com>
 <a2444c36-0103-8e1c-7005-d97f77f90e85@intel.com>
From: Tianyu Lan <ltykernel@gmail.com>
Message-ID: <0d956a05-7d24-57a0-f4a9-dccc849b52fc@gmail.com>
Date: Thu, 29 Jul 2021 21:01:49 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <a2444c36-0103-8e1c-7005-d97f77f90e85@intel.com>
Content-Language: en-US
Cc: linux-arch@vger.kernel.org, linux-hyperv@vger.kernel.org,
 linux-scsi@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 anparri@microsoft.com, vkuznets@redhat.com
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

On 7/29/2021 1:06 AM, Dave Hansen wrote:
> On 7/28/21 7:52 AM, Tianyu Lan wrote:
>> @@ -1986,7 +1988,9 @@ static int __set_memory_enc_dec(unsigned long addr, int numpages, bool enc)
>>   	int ret;
>>   
>>   	/* Nothing to do if memory encryption is not active */
>> -	if (!mem_encrypt_active())
>> +	if (hv_is_isolation_supported())
>> +		return hv_set_mem_enc(addr, numpages, enc);
>> +	else if (!mem_encrypt_active())
>>   		return 0;
> 
> One more thing.  If you're going to be patching generic code, please
> start using feature checks that can get optimized away at runtime.
> hv_is_isolation_supported() doesn't look like the world's cheapest
> check.  It can't be inlined and costs at least a function call.

Yes, you are right. How about adding a static branch key for the check 
of isolation VM? This may reduce the check cost.


_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
