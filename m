Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 21DF87E7B8
	for <lists.iommu@lfdr.de>; Fri,  2 Aug 2019 04:07:26 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 806D118E7;
	Fri,  2 Aug 2019 02:07:24 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id DA2D01847
	for <iommu@lists.linux-foundation.org>;
	Fri,  2 Aug 2019 02:07:22 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 844A2712
	for <iommu@lists.linux-foundation.org>;
	Fri,  2 Aug 2019 02:07:22 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	01 Aug 2019 19:07:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,336,1559545200"; d="scan'208";a="184440078"
Received: from allen-box.sh.intel.com (HELO [10.239.159.136])
	([10.239.159.136])
	by orsmga002.jf.intel.com with ESMTP; 01 Aug 2019 19:07:19 -0700
Subject: Re: [PATCH 1/3] iommu/vt-d: Refactor find_domain() helper
To: Christoph Hellwig <hch@lst.de>
References: <20190801060156.8564-1-baolu.lu@linux.intel.com>
	<20190801060156.8564-2-baolu.lu@linux.intel.com>
	<20190801061021.GA14955@lst.de>
	<40f3a736-0a96-0491-61ad-0ddf03612d91@linux.intel.com>
	<20190801140913.GD23435@lst.de>
From: Lu Baolu <baolu.lu@linux.intel.com>
Message-ID: <7c1b26a6-0caa-ae42-4fc6-967901fb9bbc@linux.intel.com>
Date: Fri, 2 Aug 2019 10:06:35 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190801140913.GD23435@lst.de>
Content-Language: en-US
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: kevin.tian@intel.com, ashok.raj@intel.com,
	Robin Murphy <robin.murphy@arm.com>,
	linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
	jacob.jun.pan@intel.com, David Woodhouse <dwmw2@infradead.org>
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

On 8/1/19 10:09 PM, Christoph Hellwig wrote:
> On Thu, Aug 01, 2019 at 02:20:07PM +0800, Lu Baolu wrote:
>> Hi Christoph,
>>
>> On 8/1/19 2:10 PM, Christoph Hellwig wrote:
>>> On Thu, Aug 01, 2019 at 02:01:54PM +0800, Lu Baolu wrote:
>>>> +	/* No lock here, assumes no domain exit in normal case */
>>>
>>> s/exit/exists/ ?
>>
>> This comment is just moved from one place to another in this patch.
>>
>> "no domain exit" means "the domain isn't freed". (my understand)
> 
> Maybe we'll get that refconfirmed and can fix up the comment?

Sure.

> 
>>
>>>
>>>> +	info = dev->archdata.iommu;
>>>> +	if (likely(info))
>>>> +		return info->domain;
>>>
>>> But then again the likely would be odd.
>>>
>>
>> Normally there's a domain for a device (default domain or isolation
>> domain for assignment cases).
> 
> Makes sense, I just mean to say that the likely was contrary to my
> understanding of the above comment.
> 

Best regards,
Baolu
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
