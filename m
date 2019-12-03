Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id E22CE10F506
	for <lists.iommu@lfdr.de>; Tue,  3 Dec 2019 03:37:33 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 71CFE82F21;
	Tue,  3 Dec 2019 02:37:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rFd-LLo5odum; Tue,  3 Dec 2019 02:37:30 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id E2B7786038;
	Tue,  3 Dec 2019 02:37:30 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CBDDCC1797;
	Tue,  3 Dec 2019 02:37:30 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 16263C087F
 for <iommu@lists.linux-foundation.org>; Tue,  3 Dec 2019 02:37:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 06FBB8626F
 for <iommu@lists.linux-foundation.org>; Tue,  3 Dec 2019 02:37:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id clRTXXl4MBgE for <iommu@lists.linux-foundation.org>;
 Tue,  3 Dec 2019 02:37:27 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id D3F4D85DA5
 for <iommu@lists.linux-foundation.org>; Tue,  3 Dec 2019 02:37:27 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 02 Dec 2019 18:37:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,271,1571727600"; d="scan'208";a="222658134"
Received: from allen-box.sh.intel.com (HELO [10.239.159.136])
 ([10.239.159.136])
 by orsmga002.jf.intel.com with ESMTP; 02 Dec 2019 18:37:24 -0800
Subject: Re: [PATCH v2 5/8] iommu/vt-d: Add first level page table interfaces
To: Jacob Pan <jacob.jun.pan@linux.intel.com>
References: <20191128022550.9832-1-baolu.lu@linux.intel.com>
 <20191128022550.9832-6-baolu.lu@linux.intel.com>
 <20191202152732.3d9c6589@jacob-builder>
From: Lu Baolu <baolu.lu@linux.intel.com>
Message-ID: <cf76308c-e021-61d1-de74-01acc657c61c@linux.intel.com>
Date: Tue, 3 Dec 2019 10:36:48 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <20191202152732.3d9c6589@jacob-builder>
Content-Language: en-US
Cc: kevin.tian@intel.com, Yi Sun <yi.y.sun@linux.intel.com>,
 ashok.raj@intel.com, kvm@vger.kernel.org, sanjay.k.kumar@intel.com,
 yi.y.sun@intel.com, linux-kernel@vger.kernel.org,
 Alex Williamson <alex.williamson@redhat.com>, iommu@lists.linux-foundation.org,
 David Woodhouse <dwmw2@infradead.org>
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

Hi,

On 12/3/19 7:27 AM, Jacob Pan wrote:
> On Thu, 28 Nov 2019 10:25:47 +0800
> Lu Baolu<baolu.lu@linux.intel.com>  wrote:
> 
>> This adds functions to manipulate first level page tables
>> which could be used by a scalale mode capable IOMMU unit.
>>
> FL and SL page tables are very similar, and I presume we are not using
> all the flag bits in FL paging structures for DMA mapping. Are there
> enough relevant differences to warrant a new set of helper functions
> for FL? Or we can merge into one.
> 

I ever thought about this and I am still open for this suggestion.

We had a quick compare on these two page tables. The only concern is the
read/write/present encoding. The present bit in first level implies read
permission while second level page table explicitly has a READ bit.
(recalled from memory, correct me if it's bad. :-)).

Anyway, let's listen to more opinions.

Best regards,
baolu
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
