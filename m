Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 63C141ADD95
	for <lists.iommu@lfdr.de>; Fri, 17 Apr 2020 14:50:02 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id D4B0E2012F;
	Fri, 17 Apr 2020 12:50:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2Do75vjV13Ay; Fri, 17 Apr 2020 12:50:00 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 2057320116;
	Fri, 17 Apr 2020 12:50:00 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id F38A6C0172;
	Fri, 17 Apr 2020 12:49:59 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A34ABC0172
 for <iommu@lists.linux-foundation.org>; Fri, 17 Apr 2020 12:49:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 7F9542012F
 for <iommu@lists.linux-foundation.org>; Fri, 17 Apr 2020 12:49:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XBDv4wJSQChq for <iommu@lists.linux-foundation.org>;
 Fri, 17 Apr 2020 12:49:57 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by silver.osuosl.org (Postfix) with ESMTPS id 8F88720116
 for <iommu@lists.linux-foundation.org>; Fri, 17 Apr 2020 12:49:57 +0000 (UTC)
IronPort-SDR: U22bRo7VQEM5Z4Hdkh4k2rHdY61WiNuwaktvXxbGIwoPB/ojZl9H1tfIkRjQ9pLbp8Ohe9CBud
 SLpeoav2B/LA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2020 05:49:57 -0700
IronPort-SDR: u91vT/8R96PqqOwJZ/zmjrYrVjxn5h++dhiMGTpcQXN/WIusuJSIcX+L8EUakarT17Zf+5T1Rb
 I/aeL3P+rWOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,395,1580803200"; d="scan'208";a="364320718"
Received: from lzhu11-mobl1.ccr.corp.intel.com (HELO [10.254.212.68])
 ([10.254.212.68])
 by fmsmga001.fm.intel.com with ESMTP; 17 Apr 2020 05:49:54 -0700
Subject: Re: [PATCH v3 1/3] iommu/vt-d: Allow 32bit devices to uses DMA domain
To: Christoph Hellwig <hch@lst.de>
References: <20200416062354.10307-1-baolu.lu@linux.intel.com>
 <20200416062354.10307-2-baolu.lu@linux.intel.com>
 <20200416070102.GA12588@lst.de>
 <e11d8138-f704-2f5e-c0b1-70b367a33d5d@linux.intel.com>
 <20200417065054.GA18880@lst.de>
From: Lu Baolu <baolu.lu@linux.intel.com>
Message-ID: <741e4882-969f-b102-f91a-f2ef86b6fb90@linux.intel.com>
Date: Fri, 17 Apr 2020 20:49:53 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200417065054.GA18880@lst.de>
Content-Language: en-US
Cc: kevin.tian@intel.com, ashok.raj@intel.com, linux-kernel@vger.kernel.org,
 Daniel Drake <drake@endlessm.com>, iommu@lists.linux-foundation.org,
 Robin Murphy <robin.murphy@arm.com>,
 Derrick Jonathan <jonathan.derrick@intel.com>
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

Hi Christoph,

On 2020/4/17 14:50, Christoph Hellwig wrote:
> On Thu, Apr 16, 2020 at 03:40:38PM +0800, Lu Baolu wrote:
>>> description.  I'd need to look at the final code, but it seems like
>>> this will still cause bounce buffering instead of using dynamic
>>> mapping, which still seems like an awful idea.
>>
>> Yes. If the user chooses to use identity domain by default through
>> kernel command, identity domain will be applied for all devices. For
>> those devices with limited addressing capability, bounce buffering will
>> be used when they try to access the memory beyond their address
>> capability. This won't cause any kernel regression as far as I can see.
>>
>> Switching domain during runtime with drivers loaded will cause real
>> problems as I said in the commit message. That's the reason why I am
>> proposing to remove it. If we want to keep it, we have to make sure that
>> switching domain for one device should not impact other devices which
>> share the same domain with it. Furthermore, it's better to implement it
>> in the generic layer to keep device driver behavior consistent on all
>> architectures.
> 
> I don't disagree with the technical points.  What I pointed out is that
> 
>   a) the actual technical change is not in the commit log, which it
>      should be

Sorry! I should make the commit message more comprehensive.

>   b) that I still think taking away the ability to dynamically map
>      devices in the identify domain after all the time we allowed for
>      that is going to cause nasty regressions.
> 

This change just asks Intel IOMMU driver to use the default domain
specified by the generic default domain framework, just like what other
vendor iommu drivers do. I understand that some users wants to use DMA
domain for some specific devices when the default domain type is
identity, and vice versa, use identity domain for some devices while
default one is DMA. I think Sai's patch series posted at

https://www.spinics.net/lists/iommu/msg41680.html

is a good start. It changes the default domain with all device drivers
unbound in the generic layer, hence every vendor iommu driver could
benefit from it.

Best regards,
baolu
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
