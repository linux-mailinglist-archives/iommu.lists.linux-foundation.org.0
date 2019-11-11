Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id C3A4BF6DB5
	for <lists.iommu@lfdr.de>; Mon, 11 Nov 2019 06:03:00 +0100 (CET)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id EA041B5F;
	Mon, 11 Nov 2019 05:02:55 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id C8DE8B5F
	for <iommu@lists.linux-foundation.org>;
	Mon, 11 Nov 2019 05:02:54 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 6ADC612E
	for <iommu@lists.linux-foundation.org>;
	Mon, 11 Nov 2019 05:02:54 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	10 Nov 2019 21:02:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,291,1569308400"; d="scan'208";a="228820402"
Received: from allen-box.sh.intel.com (HELO [10.239.159.136])
	([10.239.159.136])
	by fmsmga004.fm.intel.com with ESMTP; 10 Nov 2019 21:01:22 -0800
Subject: Re: [PATCH v2] iommu/vt-d: Turn off translations at shutdown
To: Deepa Dinamani <deepa.kernel@gmail.com>
References: <20191110172744.12541-1-deepa.kernel@gmail.com>
	<9e2e95e2-37ac-c0d6-d438-bd09ba7064bd@linux.intel.com>
	<CABeXuvofh-z97=iq9S7E1igbzyWwNU-MPbuCjNa_gzC3Q=L7hg@mail.gmail.com>
From: Lu Baolu <baolu.lu@linux.intel.com>
Message-ID: <155325c9-5c7b-9fb1-edaf-2c22d67f207c@linux.intel.com>
Date: Mon, 11 Nov 2019 12:58:28 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CABeXuvofh-z97=iq9S7E1igbzyWwNU-MPbuCjNa_gzC3Q=L7hg@mail.gmail.com>
Content-Language: en-US
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
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

On 11/11/19 11:21 AM, Deepa Dinamani wrote:
> On Sun, Nov 10, 2019 at 5:35 PM Lu Baolu <baolu.lu@linux.intel.com> wrote:
>>
>> Hi,
>>
>> On 11/11/19 1:27 AM, Deepa Dinamani wrote:
>>> The intel-iommu driver assumes that the iommu state is
>>> cleaned up at the start of the new kernel.
>>> But, when we try to kexec boot something other than the
>>> Linux kernel, the cleanup cannot be relied upon.
>>> Hence, cleanup before we go down for reboot.
>>>
>>> Keeping the cleanup at initialization also, in case BIOS
>>> leaves the IOMMU enabled.
>>
>> Do you mind shining more light on this statement? I can't get your point
>> here. Currently iommu_shutdown() only happens for reboot, right?
> 
> In this part, I'm saying that I'm leaving intel_iommu_init() alone.
> I'm not taking out disabling the iommu from intel_iommu_init(). This
> will help when BIOS has enabled the IOMMU and for whatever reason, the
> kernel is booting with IOMMU off.

Okay, thanks for the explanation.

> 
> -Deepa
> 

Best regards,
baolu
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
