Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id A30A4F5C4B
	for <lists.iommu@lfdr.de>; Sat,  9 Nov 2019 01:38:33 +0100 (CET)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 34C6AC8B;
	Sat,  9 Nov 2019 00:38:29 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 31208C11
	for <iommu@lists.linux-foundation.org>;
	Sat,  9 Nov 2019 00:38:28 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id C36DB712
	for <iommu@lists.linux-foundation.org>;
	Sat,  9 Nov 2019 00:38:27 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	08 Nov 2019 16:38:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,283,1569308400"; d="scan'208";a="213338067"
Received: from allen-box.sh.intel.com (HELO [10.239.159.136])
	([10.239.159.136])
	by fmsmga001.fm.intel.com with ESMTP; 08 Nov 2019 16:38:24 -0800
Subject: Re: [PATCH] intel-iommu: Turn off translations at shutdown
To: Deepa Dinamani <deepa.kernel@gmail.com>
References: <20191107205914.10611-1-deepa.kernel@gmail.com>
	<f3d7138b-b254-3c6d-b865-d3b6889aa896@linux.intel.com>
	<CABeXuvpHYTU8qT5_+vxGUfLN34b6n-dF_5=KfRYp4eY22D8CKA@mail.gmail.com>
From: Lu Baolu <baolu.lu@linux.intel.com>
Message-ID: <2f09d7f4-6c9a-91f1-4618-c196f46870b9@linux.intel.com>
Date: Sat, 9 Nov 2019 08:35:33 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CABeXuvpHYTU8qT5_+vxGUfLN34b6n-dF_5=KfRYp4eY22D8CKA@mail.gmail.com>
Content-Language: en-US
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: David Woodhouse <dwmw2@infradead.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	iommu@lists.linux-foundation.org
X-BeenThere: iommu@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
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
Sender: iommu-bounces@lists.linux-foundation.org
Errors-To: iommu-bounces@lists.linux-foundation.org

Hi,

On 11/9/19 6:28 AM, Deepa Dinamani wrote:
>>> +     x86_platform.iommu_shutdown = intel_iommu_shutdown;
>>
>> How about moving it to detect_intel_iommu() in drivers/iommu/dmar.c? And
> 
> Ok, makes sense to move it along with the init handler.
> 
>> make sure that it's included with CONFIG_X86_64.
> 
> You mean CONFIG_X86 like the init that is already there?
> 
> #ifdef CONFIG_X86
>      if (!ret)
>          x86_init.iommu.iommu_init = intel_iommu_init;
> #endif
> 

Yes.

Also, change the title to "iommu/vt-d: Turn off ..."

Best regards,
baolu
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
