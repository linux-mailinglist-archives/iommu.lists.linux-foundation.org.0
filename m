Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 655ECBD88F
	for <lists.iommu@lfdr.de>; Wed, 25 Sep 2019 08:54:40 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 8838EBA9;
	Wed, 25 Sep 2019 06:54:36 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 77D899CA
	for <iommu@lists.linux-foundation.org>;
	Wed, 25 Sep 2019 06:54:35 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 16890102
	for <iommu@lists.linux-foundation.org>;
	Wed, 25 Sep 2019 06:54:27 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	24 Sep 2019 23:54:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,547,1559545200"; d="scan'208";a="201155117"
Received: from allen-box.sh.intel.com (HELO [10.239.159.136])
	([10.239.159.136])
	by orsmga002.jf.intel.com with ESMTP; 24 Sep 2019 23:54:23 -0700
Subject: Re: [RFC PATCH 2/4] iommu/vt-d: Add first level page table interfaces
To: Peter Xu <peterx@redhat.com>, "Tian, Kevin" <kevin.tian@intel.com>
References: <20190923122454.9888-1-baolu.lu@linux.intel.com>
	<20190923122454.9888-3-baolu.lu@linux.intel.com>
	<20190923203102.GB21816@araj-mobl1.jf.intel.com>
	<9cfe6042-f0fb-ea5e-e134-f6f5bb9eb7b0@linux.intel.com>
	<20190925043050.GK28074@xz-x1>
	<AADFC41AFE54684AB9EE6CBC0274A5D19D58F018@SHSMSX104.ccr.corp.intel.com>
	<20190925052402.GM28074@xz-x1>
From: Lu Baolu <baolu.lu@linux.intel.com>
Message-ID: <1713f03c-4d47-34ad-f36d-882645c36389@linux.intel.com>
Date: Wed, 25 Sep 2019 14:52:26 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190925052402.GM28074@xz-x1>
Content-Language: en-US
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Alex Williamson <alex.williamson@redhat.com>,
	Yi Sun <yi.y.sun@linux.intel.com>, "Raj, Ashok" <ashok.raj@intel.com>,
	"kvm@vger.kernel.org" <kvm@vger.kernel.org>, "Kumar,
	Sanjay K" <sanjay.k.kumar@intel.com>,
	"iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"Sun, Yi Y" <yi.y.sun@intel.com>, David Woodhouse <dwmw2@infradead.org>
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

Hi Peter and Kevin,

On 9/25/19 1:24 PM, Peter Xu wrote:
> On Wed, Sep 25, 2019 at 04:38:31AM +0000, Tian, Kevin wrote:
>>> From: Peter Xu [mailto:peterx@redhat.com]
>>> Sent: Wednesday, September 25, 2019 12:31 PM
>>>
>>> On Tue, Sep 24, 2019 at 09:38:53AM +0800, Lu Baolu wrote:
>>>>>> intel_mmmap_range(domain, addr, end, phys_addr, prot)
>>>>>
>>>>> Maybe think of a different name..? mmmap seems a bit weird :-)
>>>>
>>>> Yes. I don't like it either. I've thought about it and haven't
>>>> figured out a satisfied one. Do you have any suggestions?
>>>
>>> How about at least split the word using "_"?  Like "mm_map", then
>>> apply it to all the "mmm*" prefixes.  Otherwise it'll be easily
>>> misread as mmap() which is totally irrelevant to this...
>>>
>>
>> what is the point of keeping 'mm' here? replace it with 'iommu'?
> 
> I'm not sure of what Baolu thought, but to me "mm" makes sense itself
> to identify this from real IOMMU page tables (because IIUC these will
> be MMU page tables).  We can come up with better names, but IMHO
> "iommu" can be a bit misleading to let people refer to the 2nd level
> page table.

"mm" represents a CPU (first level) page table;

vs.

"io" represents an IOMMU (second level) page table.

Best regards,
Baolu
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
