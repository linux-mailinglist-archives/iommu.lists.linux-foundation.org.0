Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id 59EB13EEF39
	for <lists.iommu@lfdr.de>; Tue, 17 Aug 2021 17:36:46 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AA1F940406;
	Tue, 17 Aug 2021 15:36:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id J83Mv5Bt-Mh3; Tue, 17 Aug 2021 15:36:40 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id BBE28404B7;
	Tue, 17 Aug 2021 15:36:40 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8B840C000E;
	Tue, 17 Aug 2021 15:36:40 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 62AD0C000E
 for <iommu@lists.linux-foundation.org>; Tue, 17 Aug 2021 15:36:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3EB0F80DD5
 for <iommu@lists.linux-foundation.org>; Tue, 17 Aug 2021 15:36:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RfWtSjcM_Gt2 for <iommu@lists.linux-foundation.org>;
 Tue, 17 Aug 2021 15:36:38 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [IPv6:2607:f8b0:4864:20::632])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A815980DC7
 for <iommu@lists.linux-foundation.org>; Tue, 17 Aug 2021 15:36:38 +0000 (UTC)
Received: by mail-pl1-x632.google.com with SMTP id o10so874339plg.0
 for <iommu@lists.linux-foundation.org>; Tue, 17 Aug 2021 08:36:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=jBb72hVOoT632QaKCIWdx6/CC01Jwh36ZqbBo7qR29w=;
 b=MZ87ScQaeTXUx2zc3QJX8paFfZdkSVdSMUYc0v0LY2+hc8AhlF3aqwldmB/BXXfh/z
 xVUkX3EuT93f+Ekid/9wOV8vd4VGMuUzHWRKeiBzsSym+hW8V3hELzVo+u+KhQB9PaFI
 yKaN6w7ws4iHi95okxDvcvyCJdiEqWiExOJPn7Rtxomj/p9ErurP79QsKnpF40UWedHY
 wXhiv+BXDH0p6Ybpa+matnVITHtpuG4LstcJLEA+MFTvG9pqsO1LvATqA0RHijA20GDK
 RCmlz/5mC+apSlI/jvD+4R9BoBCU6SvqrbqxGY696R6zje19Bg6nqx+tPpa86481eswl
 CE+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=jBb72hVOoT632QaKCIWdx6/CC01Jwh36ZqbBo7qR29w=;
 b=Z7aU/7afbyblRj32Q7+ABZtn8n+LcNcpdMCR1VGiSD2MnnEpCB+GXNU/TmBxracfYy
 SsdgJRYuUsIspY9G3fbpUQn90D4ZfAtFgQ3vY7K3OfVFdaWQiFTR5+7V+WARyPriMH2L
 rzYavULmFWyqa2rEtK8oSxM8PMAOLchelTmIvtyUcDyLcYTxocuZuiKfau+a9zRck3uh
 HHTIb2XrP+bqRgKXTsaK0q5YO4Siw4sl6m9CFpLSKEte/xueqLau1fB0EK3HqaZvyENV
 3v9bRPLL5jLn8fqqtfj6MZeAZ8fATFgFt+lWP+zdgkLqcud8DM7W7hGUiH/Vqi8dPRxZ
 Ehng==
X-Gm-Message-State: AOAM530ZE7g07u5tMrdn41z3UZObGujQI0VBvlAzfA3qD9Tl67v0pqsa
 uWcGdGxRiGEfbM3Teu10YOA=
X-Google-Smtp-Source: ABdhPJyI43P3qYYJRg0q+cd32Cif7a9Xl5o4vVONB3bqiCMyd2bKoq7nZrIha1ZM+VxRpd1t2YLiqw==
X-Received: by 2002:a17:903:31c3:b029:ed:6f74:49c7 with SMTP id
 v3-20020a17090331c3b02900ed6f7449c7mr3321877ple.12.1629214598127; 
 Tue, 17 Aug 2021 08:36:38 -0700 (PDT)
Received: from ?IPv6:2404:f801:0:5:8000::50b? ([2404:f801:9000:18:efec::50b])
 by smtp.gmail.com with ESMTPSA id
 q68sm3828407pgq.5.2021.08.17.08.36.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Aug 2021 08:36:37 -0700 (PDT)
Subject: Re: [PATCH V3 08/13] HV/Vmbus: Initialize VMbus ring buffer for
 Isolation VM
To: Michael Kelley <mikelley@microsoft.com>, KY Srinivasan
 <kys@microsoft.com>, Haiyang Zhang <haiyangz@microsoft.com>,
 Stephen Hemminger <sthemmin@microsoft.com>,
 "wei.liu@kernel.org" <wei.liu@kernel.org>, Dexuan Cui <decui@microsoft.com>,
 "tglx@linutronix.de" <tglx@linutronix.de>,
 "mingo@redhat.com" <mingo@redhat.com>, "bp@alien8.de" <bp@alien8.de>,
 "x86@kernel.org" <x86@kernel.org>, "hpa@zytor.com" <hpa@zytor.com>,
 "dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
 "luto@kernel.org" <luto@kernel.org>,
 "peterz@infradead.org" <peterz@infradead.org>,
 "konrad.wilk@oracle.com" <konrad.wilk@oracle.com>,
 "boris.ostrovsky@oracle.com" <boris.ostrovsky@oracle.com>,
 "jgross@suse.com" <jgross@suse.com>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 "joro@8bytes.org" <joro@8bytes.org>, "will@kernel.org" <will@kernel.org>,
 "davem@davemloft.net" <davem@davemloft.net>,
 "kuba@kernel.org" <kuba@kernel.org>, "jejb@linux.ibm.com"
 <jejb@linux.ibm.com>, "martin.petersen@oracle.com"
 <martin.petersen@oracle.com>, "arnd@arndb.de" <arnd@arndb.de>,
 "hch@lst.de" <hch@lst.de>,
 "m.szyprowski@samsung.com" <m.szyprowski@samsung.com>,
 "robin.murphy@arm.com" <robin.murphy@arm.com>,
 "thomas.lendacky@amd.com" <thomas.lendacky@amd.com>,
 "brijesh.singh@amd.com" <brijesh.singh@amd.com>,
 "ardb@kernel.org" <ardb@kernel.org>, Tianyu Lan <Tianyu.Lan@microsoft.com>,
 "pgonda@google.com" <pgonda@google.com>,
 "martin.b.radev@gmail.com" <martin.b.radev@gmail.com>,
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
 "kirill.shutemov@linux.intel.com" <kirill.shutemov@linux.intel.com>,
 "rppt@kernel.org" <rppt@kernel.org>,
 "sfr@canb.auug.org.au" <sfr@canb.auug.org.au>,
 "saravanand@fb.com" <saravanand@fb.com>,
 "krish.sadhukhan@oracle.com" <krish.sadhukhan@oracle.com>,
 "aneesh.kumar@linux.ibm.com" <aneesh.kumar@linux.ibm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "rientjes@google.com" <rientjes@google.com>,
 "hannes@cmpxchg.org" <hannes@cmpxchg.org>, "tj@kernel.org" <tj@kernel.org>
References: <20210809175620.720923-1-ltykernel@gmail.com>
 <20210809175620.720923-9-ltykernel@gmail.com>
 <MWHPR21MB1593FFD7F3402753751F433CD7FD9@MWHPR21MB1593.namprd21.prod.outlook.com>
From: Tianyu Lan <ltykernel@gmail.com>
Message-ID: <9de7c3ae-8f3f-3fc4-0491-b9df24f03cb6@gmail.com>
Date: Tue, 17 Aug 2021 23:36:22 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <MWHPR21MB1593FFD7F3402753751F433CD7FD9@MWHPR21MB1593.namprd21.prod.outlook.com>
Content-Language: en-US
Cc: "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>,
 "parri.andrea@gmail.com" <parri.andrea@gmail.com>,
 "linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>,
 "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dave.hansen@intel.com" <dave.hansen@intel.com>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
 vkuznets <vkuznets@redhat.com>
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



On 8/17/2021 1:28 AM, Michael Kelley wrote:
> This patch does the following:
> 
> 1) The existing ring buffer wrap-around mapping functionality is still
> executed in hv_ringbuffer_init() when not doing SNP isolation.
> This mapping is based on an array of struct page's that describe the
> contiguous physical memory.
> 
> 2) New ring buffer wrap-around mapping functionality is added in
> hv_ringbuffer_post_init() for the SNP isolation case.  The case is
> handled in hv_ringbuffer_post_init() because it must be done after
> the GPADL is established, since that's where the host visibility
> is set.  What's interesting is that this case is exactly the same
> as #1 above, except that the mapping is based on physical
> memory addresses instead of struct page's.  We have to use physical
> addresses because of applying the GPA boundary, and there are no
> struct page's for those physical addresses.
> 
> Unfortunately, this duplicates a lot of logic in #1 and #2, except
> for the struct page vs. physical address difference.
> 
> Proposal:  Couldn't we always do #2, even for the normal case
> where SNP isolation is not being used?   The difference would
> only be in whether the GPA boundary is added.  And it looks like
> the normal case could be done after the GPADL is established,
> as setting up the GPADL doesn't have any dependencies on
> having the ring buffer mapped.  This approach would remove
> a lot of duplication.  Just move the calls to hv_ringbuffer_init()
> to after the GPADL is established, and do all the work there for
> both cases.
> 

Hi Michael:
     Thanks for suggestion. I just keep the original logic in current
code. I will try combining these two functions and report back.

Thanks.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
